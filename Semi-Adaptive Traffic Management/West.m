function sim=West
                    WRef = imread('D:\Program Files\Polyspace\R2019a\bin\West\WRef.jpg');
                    WRefG=rgb2gray(WRef);
                    
                     disp('Select the current image:');

                    [filename,filepath]=uigetfile({'*.jpg'},'Select and image');
                    selectedImage = imread(strcat(filepath, filename));
                    I=rgb2gray(selectedImage);
                    
                    X1=edge(WRefG,'canny');
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
                    xlswrite('Sheets.xlsx',100-sim,'B2:B2');