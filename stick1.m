while 1
%to capture the screenshot
system('adb shell screencap -p /sdcard/sh1.png');

%to pull the screenshot on the system’s current directory
system('adb pull /sdcard/sh1.png');

%to remove the screenshot from the phone’s memory
system('adb shell rm /sdcard/sh1.png');

%to read the image i.e. to store the image in a matrix
a=imread('C:\Users\ASUS\AppData\Local\VirtualStore\Program Files\MATLAB\R2016a\bin\sh1.png');

%to crop the image for desired dimension
b=imcrop(a,[0 1190 1080 600]);

%setting the layer for thresholding
red = b(:,:,1);
green = b(:,:,2);
blue = b(:,:,3);

%converting the image to binary and then storing the image in a variable out
out = red>=0 & red<=60 & green>=0 & green<=60 & blue>=0 & blue<=60;
%in binary image black is stored as 0 and white is stored as 1
%storing the values of the matrix of the row 30 in another array
g=out(30,:);
q=1;
w=1;

%if the tower does not start with the screen 
if g(q)==0
    while g(q)==0 & q<=1080
        q=q+1;
    end
end
while g(q)==1 & q<=1080
    q=q+1;
end
while g(q)==0 & q<=1080
    w=w+1;
    q=q+1;
end
while g(q)==1 & q<=1080
    w=w+1;
    q=q+1;
end

%calculating the distance w and then multiplying with time factor 1.023
z=(w-1)*1.023;
u=['adb shell input swipe 100 500 100 500 ',num2str(int16(z))];
system(u);

%to wait for the hero to run to the second tower or simply for screen transition
pause(z/100);
end
