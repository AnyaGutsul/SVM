function [] = process_Img(SVMStruct,img_matrix)

    %Prepare the image to prediction
    inputImg = im2double(img_matrix);
    inputImg = imresize(inputImg, [200 200]);
    inputImg = reshape (inputImg', 1, size(inputImg,1)*size(inputImg,2));
    result = predict(SVMStruct, inputImg); %predict using SVMStruct we have build 
    
    %Display the decision of prediction to the user
    if (result == -1)
        caption = sprintf('This Image is a Mouse');
        title(caption, 'FontSize', 14);
    end
     
    if (result == 1)
        caption = sprintf('This Image is an Apple');
        title(caption, 'FontSize', 14);
    end
    
end