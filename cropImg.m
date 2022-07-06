function [croptedImg1,croptedImg2] = cropImg(img_matrix)

      %Find the image boundaries
     [rows, columns] = find(img_matrix);
     x_min = min(columns);
     y_min = min(rows);
     x_max = max(columns);

     %Find the image start from the top
    sumRows = sum(img_matrix,2);
    indexOfSumZero = find(~sumRows);

    %Find the image end
    %[rowmax,columnmax,y_max] = find(indexOfSumZero(:,1) > y_min);
    y_max = find(indexOfSumZero(:,1) > y_min);
    y_max = min(indexOfSumZero(y_max));
    
    %Set the crop boundaries and divide the image into 2 parts
    rect1 = [x_min-5 ,y_min - 5,x_max+5,y_max+5];
    croptedImg1 = imcrop(img_matrix, rect1);
 
    rect2=[x_min-5 ,y_max+5,x_max+5,length(img_matrix)];
    croptedImg2 = imcrop(img_matrix, rect2);
end

