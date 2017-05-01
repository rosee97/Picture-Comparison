%%%
% set names of query image and target image
sdog_folder = './SampleDogs/';
dbdogs_folder = './CroppedDogDB/';

sdog1 = zeros(2, 45);
sdog2 = zeros(2, 45);
sdog3 = zeros(2, 45);
sdog4 = zeros(2, 45);
sdog5 = zeros(2, 45);

for i=1:1:5,
    
    SampleDog=[sdog_folder, 'd',num2str(i),'.png'];
    Isd= imread(SampleDog);
    IcsdGrayScale = rgb2gray(Isd);
%   SAM_ROWS = size(I,1);
%    SAM_COLS = size(I,2);
    
    for j=1:1:10,
        
    DBDogs=[dbdogs_folder,'dog',num2str(j),'.png'];
    Idb= imread(DBDogs);
    IqdbGrayScale = rgb2gray(Idb);

        %%%
        % compute the correlation match score
        %%
    currCorrScore = myCorrelationMatch(IcsdGrayScale, IqdbGrayScale);
    corrInfo(1, i(1,j)) = currCorrScore;
    corrInfo(1, i(2,j)) = ['dog', num2str(j), '.png'];
        %%
        % If you get a bigger correlation score, record
        % the (x,y) coordinates of upper left corner
        %%
        
        if (currCorrScore > maxCorrScore) 
          maxCorrScore= currCorrScore;
          maxXCorr= x;
          maxYCorr= y;
        end

       end
    end
    
    %Store the correlation coefficient
    maxCorrScore;
    

% imshow(I);
% pos= [ maxXCorr maxYCorr CROP_COLS CROP_ROWS];
% rectangle('Position',pos,'edgecolor','r','linewidth',3);
% 
% disp(sprintf('Total time is: %.4g  ', totalTime))
% disp(sprintf('Correlation Coefficient is: %.4g  ', maxCorrScore))
