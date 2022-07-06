function [] = rotate_image(img,degrees,name)

    %Read and rotate the given image
    test_img=imread(img);
    test_img=imrotate(test_img,degrees);
    
    %Display the rotated image
    figure
    imshow(test_img);
    imwrite(test_img,name); %save test image
end