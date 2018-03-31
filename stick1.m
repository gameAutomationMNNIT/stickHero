while 1
system('adb shell screencap -p /sdcard/sh1.png');
system('adb pull /sdcard/sh1.png');
system('adb shell rm /sdcard/sh1.png');
a=imread('C:\Users\ASUS\AppData\Local\VirtualStore\Program Files\MATLAB\R2016a\bin\sh1.png');
b=imcrop(a,[0 1190 1080 600]);
red = b(:,:,1);
green = b(:,:,2);
blue = b(:,:,3);
out = red>=0 & red<=60 & green>=0 & green<=60 & blue>=0 & blue<=60;
%subplot(1,3,1), imshow(a)
%subplot(1,3,2), imshow(b)
%subplot(1,3,3), imshow(out)
g=out(30,:);
q=1;
w=1;
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

z=(w-1)*1.023;
%disp(q);
%disp(w);
%disp(z);
u=['adb shell input swipe 100 500 100 500 ',num2str(int16(z))];
%disp(u);
system(u);
%%system(['adb shell input swipe 100 500 100 500 ',num2str(w*1.43)]);
pause(z/100);
end