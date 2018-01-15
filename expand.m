clear all;
image=imread('robot.jpg');   %读取原始图像
im=rgb2gray(image);    %原始灰度图像
im=double(im);
im2=im;
strength=60;
pointx=120;
pointy=156;
r=30;
left=pointy-r;
right=pointy+r;
top=pointx-r;
bottom=pointx+r;
space=r*r;

for x=top:bottom
    offsetx=x-pointx;
    for y=left:right
        offsety=y-pointy;
        xy=offsetx*offsetx+offsety*offsety;
        if xy<=space
            scale=1-xy/space;
            scale=1-strength/100*scale;
            posy=round(offsety*scale+pointy);
            posx=round(offsetx*scale+pointx);
            im2(x,y)=im(posx,posy);
        end
    end
end
figure(1)
subplot(1,2,1);
imshow(uint8(im));
subplot(1,2,2);
imshow(uint8(im2));
