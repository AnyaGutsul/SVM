function [] = two_obj_image(img1,img2,name)

    %Read and resize 2 input images 
    test_img1=imread(img1);
    test_img1=imresize(test_img1,[200 200]);
    
    test_img2=imread(img2);
    test_img2=imresize(test_img2,[200 200]);
    
    %Create test image by assembling two input images
    test_img=[test_img1;test_img2];

    %Display test image
    figure
    imshow(test_img);
    imwrite(test_img,name); %save test image
end