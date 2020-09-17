Corr=['N';'W';'S';'E'];
i=1;
cam=webcam(2);
cam.Resolution = '320x240';
ARD=arduino();
writeDigitalPin(ARD, 'D12', 1);           %N-> Green-D1,Red-D0
writeDigitalPin(ARD, 'D3', 1);           %W-> Green-D4,Red-D3
writeDigitalPin(ARD, 'D6', 1);           %S-> Green-D7,Red-D6
writeDigitalPin(ARD, 'D9', 1);           %E-> Green-D10,Red-D9
while(1)

    clc;
    close all;
    C=Corr(i);
    switch(C)
            case 'N'
                    writeDigitalPin(ARD, 'D13', 1);
                    writeDigitalPin(ARD, 'D12', 0); 
                    disp('NORTH');
                    NRef = imread('D:\Program Files\Polyspace\R2019a\bin\North\NRef.png');
                    NRefG=rgb2gray(NRef);
             
                    disp('Select the current image:');

                    [filename,filepath]=uigetfile({'*.png'},'Select and image');
                    selectedImage = imread(strcat(filepath, filename));
                   
                    %I=snapshot(cam);
                    I=rgb2gray(selectedImage);
                    

                    X1=edge(NRefG,'canny');
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

                    result=(now1/now2)*100;

                    disp('Similarity: ');
                    disp(result);
                    
                    if((result>80)&&(result<100))
                        time=20;
                    else if(result>70)
                            time=30;
                        else time=40;
                        end
                    end
                    disp('Open time: ');
                    display(time);
                    
                    system('dir')
                    pause(time-5)
                    system('dir');
                    
                    writeDigitalPin(ARD, 'D13', 0);
                    writeDigitalPin(ARD, 'D12', 1); 
                    
            case 'W'
                    writeDigitalPin(ARD, 'D4', 1);
                    writeDigitalPin(ARD, 'D3', 0); 
                
                    disp('WEST');
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

                    result=(now1/now2)*100;
                    disp('Similarity: ');
                    disp(result);
                    
                     if((result>80)&&(result<100))
                        time=20;
                    else if(result>70)
                            time=30;
                        else time=40;
                        end
                    end
                    disp('Open time: ');
                    display(time);
                    
                    system('dir')
                    pause(time-5)
                    system('dir');
                    
                    writeDigitalPin(ARD, 'D4', 0);
                    writeDigitalPin(ARD, 'D3', 1); 
            case 'S'
                    writeDigitalPin(ARD, 'D7', 1);
                    writeDigitalPin(ARD, 'D6', 0); 
                    
                    disp('SOUTH');
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

                    result=(now1/now2)*100;
                    disp('Similarity: ');
                    disp(result);
                    
                     if((result>80)&&(result<100))
                        time=20;
                    else if(result>70)
                            time=30;
                        else time=40;
                        end
                    end
                    disp('Open time: ');
                    display(time);
                    
                    system('dir')
                    pause(time-5)
                    system('dir');
                    
                    writeDigitalPin(ARD, 'D7', 0);
                    writeDigitalPin(ARD, 'D6', 1); 
            case 'E'
                    writeDigitalPin(ARD, 'D10', 1);
                    writeDigitalPin(ARD, 'D9', 0); 
                    
                    disp('EAST');
                    ERef = imread('D:\Program Files\Polyspace\R2019a\bin\East\ERef.jpg');
                    ERefG=rgb2gray(ERef);
                   
                    
                     disp('Select the current image:');

                    [filename,filepath]=uigetfile({'*.jpg'},'Select and image');
                    selectedImage = imread(strcat(filepath, filename));
                    I=rgb2gray(selectedImage);
                  

                    X1=edge(ERefG,'canny');
                    X2=edge(I,'canny');

                    figure(2);
                    subplot(1,2,1);
                    title('Canny Edge Detection on Reference image'); 
                    imshow(X1);
                    subplot(1,2,2);
                    imshow(X2);
                    title('Canny Edge Detection on Current image');
                    now1=sum(sum(X1));
                    now2=sum(sum(X2));

                    result=(now1/now2)*100;
                    disp('Similarity: ');
                    disp(result);
                    
                     if((result>80)&&(result<100))
                        time=20;
                    else if(result>70)
                            time=30;
                        else time=40;
                        end
                    end
                    disp('Open time: ');
                    display(time);
                    
                    system('dir')
                    pause(time-5)
                    system('dir');
                    
                    writeDigitalPin(ARD, 'D10', 0);
                    writeDigitalPin(ARD, 'D9', 1); 
            
    end
    if(i==4)
        i=1;
        else i=i+1;
    end

 
end

    

       

