%%%
% set names of query image and target image
folder = './
for i=1:1:5,
    SampleDog=['d',num2str(i),'.png'];
    I= imread(SampleDog);
    Igray = rgb2gray(I);
    SAM_ROWS = size(I,1);
    SAM_COLS = size(I,2);
    
    for j=1:1:45,
    DBDogs=['dog',num2str(J),'.png'];
    Iq= imread(DBDogs);
    Iqgray= rgb2gray(Iq);

    DB_ROWS= size(Iq,1);
    DB_COLS= size(Iq,2);

    XSHIFT= 10;
    YSHIFT= 10;

    % initialize position vector used to display
    % the cropping rectangle
    %
    % [ x y with height]

    pos = [0 0 0 0];

    %%%
    % initialize variables used to track the
    % location where cropping achieves its
    % maximum score
    %%
    maxCorrScore= -1000;%initialize to large neg value so always find a max
    maxXCorr= -1;       %initialize to invalid x-coordinate to make fail stop
    maxYCorr= -1;       %initialize to invalid y-coordinate to make fial stop

    currCorrScore= maxCorrScore;  %set in search, but must still intialize
    totalTime=0;

    for y=1:YSHIFT:SAM_ROWS-DB_ROWS,
       showedMiddle= false;
       for x=1:XSHIFT:SAM_COLS-DB_COLS,

          % note the crop window returns region of image one pixel
          % wider and one pixel taller so we specify (CROP_COLS-1)
          % and (CROP_ROWS-1) here so that cropped region is same
          % size as query image


          Ic = imcrop(I,[x y (DB_COLS-1)  (DB_ROWS-1)]); 

        %%
        % to simplify the match score, we will do it with grayscale
        % images instead of color, thus freeing us from having to
        % deal with three color planes (red, green, blue).
        %%
          IcGrayScale = rgb2gray(Ic);
          IqGrayScale = rgb2gray(Iq);

        %%%
        % compute the correlation match score
        %%
        currCorrScore = myCorrelationMatch(IcGrayScale, IqGrayScale);
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
    

    end 
end 

% imshow(I);
% pos= [ maxXCorr maxYCorr CROP_COLS CROP_ROWS];
% rectangle('Position',pos,'edgecolor','r','linewidth',3);
% 
% disp(sprintf('Total time is: %.4g  ', totalTime))
% disp(sprintf('Correlation Coefficient is: %.4g  ', maxCorrScore))
