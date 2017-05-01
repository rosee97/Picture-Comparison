clc;
clear; 
close all;
%%%
% set names of query image and target image
sdog_folder = './SampleDogs/';
dbdogs_folder = './CroppedDogDB/';

% 
sdog = {};

% arrays with color
% sdog1 = zeros(3, 45);
% sdog2 = zeros(3, 45);
% sdog3 = zeros(3, 45);
% sdog4 = zeros(3, 45);
% sdog5 = zeros(3, 45);

maxCorrScores = zeros(5,2);

%maxCorrScores = zeros(5,4);

corrInfo = {};
% maxColorCorrScore = 0.0;
closestGreyImage = '';
% closestColorImage = '';
counter = 1;
counter2 = 2;

for i=1:1:5,
    
    maxCorrScore = 0.0; 
    sdFileName = [ 'd',num2str(i),'.png'];
    SampleDog=[sdog_folder, sdFileName ] ;
    IsdbColor = imread(SampleDog);
    IcsdbGrayScale = rgb2gray(IsdbColor);
    
    for j=1:1:45,
    dbFileName = [ 'dog', num2str(j),'.png'];
    DBDogs= [dbdogs_folder,dbFileName];
    IdbColor = imread(DBDogs);
    IqdbGrayScale = rgb2gray(IdbColor);

        %%%
        % compute the correlation match score
        %%
    currCorrScore = myCorrelationMatch(IcsdbGrayScale, IqdbGrayScale);

    sdog = [sdog, {string(dbFileName), currCorrScore}];
    
    if (currCorrScore > maxCorrScore) 
      maxCorrScore= currCorrScore;

      closestGreyImage = j;
    end
  
    end
        
    corrInfo = [corrInfo, {sdog}];
    
    maxCorrScores(i,1) = closestGreyImage;
    maxCorrScores(i,2) = maxCorrScore;
    
end

    

% imshow(I);
% pos= [ maxXCorr maxYCorr CROP_COLS CROP_ROWS];
% rectangle('Position',pos,'edgecolor','r','linewidth',3);
% 
% disp(sprintf('Total time is: %.4g  ', totalTime))
% disp(sprintf('Correlation Coefficient is: %.4g  ', maxCorrScore))
