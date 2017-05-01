%%%
% set names of query image and target image
sdog_folder = './SampleDogs/';
dbdogs_folder = './CroppedDogDB/';
origindogs_folder='./DogDataBase/';

rowDogs={'dog1','dog2','dog3','dog4','dog5','dog6','dog7','dog8','dog9','dog10',...
    'dog11','dog12','dog13','dog14','dog15','dog16','dog17','dog18','dog19','dog20',...
    'dog21','dog22','dog23','dog24','dog25','dog26','dog27','dog28','dog29','dog30',...
    'dog31','dog32','dog33','dog34','dog35','dog36','dog37','dog38','dog39','dog40',...
    'dog41','dog42','dog43','dog44','dog45'};
d1=zeros(45,1);
d2=zeros(45,1);
d3=zeros(45,1);
d4=zeros(45,1);
d5=zeros(45,1);

max=zeros(1,5);


for i=1:1:5,
    figure(i);
    subplot(2,2,1)
    imshow([sdog_folder,'d',num2str(i),'.png']);
    maxCorrScore=0;
    SampleDog=[sdog_folder, 'd',num2str(i),'.png'];
    Isd= imread(SampleDog);
    IcsdGrayScale = rgb2gray(Isd);
    
    for j=1:1:45,
        
    DBDogs=[dbdogs_folder,'dog',num2str(j),'.png'];
    Idb= imread(DBDogs);
    IqdbGrayScale = rgb2gray(Idb);

    %Compute the correlation match score

    currCorrScore = myCorrelationMatch(IcsdGrayScale, IqdbGrayScale);
    
    %Store the correlation coefficient
    
    if i==1
        d1(j,1)=currCorrScore;
    elseif i==2
        d2(j,1)=currCorrScore;
    elseif i==3
        d3(j,1)=currCorrScore;
    elseif i==4
        d4(j,1)=currCorrScore;
    elseif i==5
        d5(j,1)=currCorrScore;
    end
    
    %Pick the most three closely pics
    if (currCorrScore > maxCorrScore) 
          maxCorrScore= currCorrScore;
    end
    end
    max(1,i)=maxCorrScore;
   
end

T=table(d1,d2,d3,d4,d5,...
    'RowNames',rowDogs) ;

%Pick the most three
mostThree=zeros(1,3);
%Sorted the correlation 
sorted_d1=sort(d1,'descend');
sorted_d2=sort(d2,'descend');
sorted_d3=sort(d3,'descend');
sorted_d4=sort(d4,'descend');
sorted_d5=sort(d5,'descend');
%Get the name of the image
for b = 1:1:k;
    if i==1
     for k=1:1:3
        for q=1:1:45
            if d1(q,1)==sorted_d1(k,1)
                subplot(2,2,k+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
            end 
        end
     end
    elseif i==2
     for k=1:1:3
        for q=1:1:45
            if d2(q,1)==sorted_d2(k,1)
                subplot(2,2,k+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
            end 
        end
     end
    elseif i==3
     for k=1:1:3
        for q=1:1:45
            if d3(q,1)==sorted_d3(k,1)
                subplot(2,2,k+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
            end 
        end
     end
    elseif i==4
     for k=1:1:3
        for q=1:1:45
            if d4(q,1)==sorted_d4(k,1)
                subplot(2,2,k+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
            end 
        end
     end
    elseif i==5
     for k=1:1:3
        for q=1:1:45
            if d5(q,1)==sorted_d5(k,1)
                subplot(2,2,k+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
            end 
        end
     end
    end
end





