clc % clear the command window
clear all % clear variables 

imagefiles = dir('*.gif'); % struct array with fields : name, folder,date, bytes, is dir datenum (36 images)
nfiles = 36; 

%Read and process all the training set images 
for i = 1:nfiles
    currentfilename = imagefiles(i).name;
    currentimage = imread(currentfilename);
    images{i} = currentimage;
    images{i} = im2double(images{i}); % takes an image as input, and returns an image of class double.
    images{i} = imresize(images{i},[200 200]);
    images{i} = reshape(images{i}', 1, size(images{i},1)*size(images{i},2)); 
end

%Create labels for the training data set. 
trainData = zeros(nfiles, 40000);

for ii=1:nfiles
    trainData(ii,:) = images{ii};
end

%Labels are: apple=1, mouse=-1
apples = ones(18,1);
moueses = -1*ones(18,1);
class = [apples; moueses];

%Train support vector machine (SVM) classifier for one-class and binary classification
SVMStruct = fitcsvm (trainData, class);


%Test images creation using functions two_obj_image, rotate_image.

%two_obj_image function joins two given images and saves created test
%image. This function was used the next way:

%%two_obj_image('test-rat1.gif','test2.gif',name)

%rotate_image function rotates the given image in by given angle degrees 
%and saves created test image. This function was used the next way: 

%%rotate_image('test-rat1.gif',45,'test-rotated-rat1.gif')


%Ask for test image from user and classify the objects
prompt = 'Enter images name for testing.\nTo stop enter q\n';
str = input(prompt,'s');
while str ~= 'q'
    
    %Read the given image
    inputImgToDisplay = imread(str);
    inputImg = imread(str);
    [croped1,croped2] = cropImg(inputImg); %Divide the given image into two parts
    
    %Display the original image
    figure
    subplot(2,1,1);
    imshow(inputImgToDisplay)
    caption = sprintf('Original Image');
        title(caption, 'FontSize', 14);
    
    %Process and show the first part image with classification
    subplot(2,2,3);
    imshow(croped1)
    process_Img(SVMStruct,croped1)  %predict using SVMStruct we have built and display the decision to the user
   
    %In the case that the original image containes only one object, the
    %second part of the image will not be processed.
    
    %Check if the second part of the image has no objects.
    sumRows = sum(croped2);
    sum1=sum(sumRows);
    
    
    %If the second part of the image containes objects, 
    %we will process it and will display the prediction decision to the user.
    if  sum1~=0
    subplot(2,2,4);
    imshow(croped2)
    process_Img(SVMStruct,croped2) %predict using SVMStruct we have built and display the decision to the user
    end
    
    prompt = 'Enter image name:\n';
    str = input(prompt,'s');
    
end
