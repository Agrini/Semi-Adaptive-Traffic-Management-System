function sim=South
                    SRef = imread('D:\Program Files\Polyspace\R2019a\bin\South\SRef.jpg');
                    SRefG=rgb2gray(SRef);
                    
                     disp('Select the current image:');

                    [filename,filepath]=uigetfile({'*.jpg'},'Select and image');
                    selectedImage = imread(strcat(filepath, filename));
                    I=rgb2gray(selectedImage);
                    
                    X1=edge(SRefG,'canny');
                    X2=edge(I,'canny');

                    figure(2);
                    subplot(1,2,1);
                    imshow(X1);
                    title('Canny Edge Detection on Reference image');
                    subplot(1,2,2);
                    imshow(X2);
                    title('Canny Edge Detection on Current image');
                    now1=sum(sum(X1));
                    now2=sum(sum(X2));

                    sim=(now1/now2)*100;
                    disp('Similarity: ');
                    disp(sim);
                    xlswrite('Sheets.xlsx',100-sim,'B3:B3');