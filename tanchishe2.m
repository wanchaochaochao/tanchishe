clear;
%设定并产生游戏界面大小及颜色
m=100;n=120;a0=10;
a=zeros(m,n)+a0;
c=[30 30];
a(c(1),c(2))=1;%%%%%%%%%%%%%%%%%%%%%%%
%设定并产生初始贪吃蛇的位置及长度
a1=ceil(m/2);b1=ceil(n/2);
x=[a1,a1+1,a1+2];
a(x,b1)=0;
%设定贪吃蛇移动方向1,2,3,4对应上右下左（北东南西）
f(1:3)=1;
%记录贪吃蛇长度
d=3;
%贪吃蛇头尾c1,c2;
c1=[a1,b1];c2=[a1+2,b1];
%=========================== 
%界面的开始、暂停、结束按钮
%build the GUI  
%define the plot button
plotbutton=uicontrol('style','pushbutton',... 
   'string','开始', ...
    'fontsize',12, ...
     'position',[85,400,50,20], ...
    'callback', 'run=1;');   %define the stop button
erasebutton=uicontrol('style','pushbutton',...
    'string','暂停', ...
    'fontsize',12, ...
     'position',[135,400,50,20], ...
    'callback','freeze=1;');   %define the Quit button
quitbutton=uicontrol('style','pushbutton',...
    'string','结束', ...
    'fontsize',12, ...
     'position',[185,400,50,20], ...
    'callback','stop=1;close;');
number = uicontrol('style','text', ...
     'string','1', ...
    'fontsize',12, ...
     'position',[20,400,50,20]);
 %==============================
 
 %------------------------------
%界面的上下左右及速度按钮
%build the GUI
%define the plot button
ff=1;
shangbutton1=uicontrol('style','pushbutton',... 
   'string','上', ...
    'fontsize',12, ...
     'position',[509,350,60,20], ...
    'callback', 'ff=1;');   %define the stop button 
 youbutton1=uicontrol('style','pushbutton',...
    'string','右', ...
    'fontsize',12, ...
     'position',[539,330,30,20], ...
    'callback','ff=2;');   %define the Quit button  
xiabutton1=uicontrol('style','pushbutton',...
    'string','下', ...
    'fontsize',12, ...
     'position',[509,310,60,20], ...
    'callback','ff=3;'); 
zuobutton2=uicontrol('style','pushbutton',...
    'string','左', ...
    'fontsize',12, ...
     'position',[509,330,30,20], ...
    'callback','ff=4;');
plotbutton11=uicontrol('style','pushbutton',... 
   'string','快速', ...
    'fontsize',12, ...
     'position',[235,400,50,20], ...
    'callback', 'sudu=0.008;');   %define the stop button
erasebutton22=uicontrol('style','pushbutton',...
    'string','一般', ...
    'fontsize',12, ...
     'position',[285,400,50,20], ...
    'callback','sudu=0.08;');   %define the Quit button
quitbutton33=uicontrol('style','pushbutton',...
    'string','慢速', ...
    'fontsize',12, ...
     'position',[335,400,50,20], ...
    'callback','sudu=0.2;');
number122 = uicontrol('style','text', ...
     'string','分数：', ...
    'fontsize',12, ...
     'position',[385,400,50,20]);
number11 = uicontrol('style','text', ...
     'string','0', ...
    'fontsize',12, ...
     'position',[435,400,30,20]);

   %---------------------------------
   
 
imh = image(cat(3,a,a,a));
%  set(imh, 'erasemode', 'none')
axis equal
axis tight   %index definition for cell update
stop= 0; %wait for a quit button push
run = 0; %wait for a draw
freeze = 0; %wait for a freeze 
shang=0;
you=0;
xia=0;
zuo=0;
sudu=0.08;

while (stop==0)     
    if (run==1)          %nearest neighbor sum     
        pause(sudu);
%         ff=input('');
%  ff=4;
        if(isempty(ff));
            ff=f(1);
        end
        if(~isempty(ff) && (abs(mod(ff,10)-f(1))==2))
             ff=f(1);
        end;
        for i=d:-1:1
            f(i+1)=f(i);
        end;
        f(1)=mod(ff,10);
        %实现贪吃蛇头的位置更新
        switch f(1)
            case 1
                c1(1)=c1(1)-1;
            case 2
                c1(2)=c1(2)+1;
            case 3
                c1(1)=c1(1)+1;
            case 4
                c1(2)=c1(2)-1;
        end
        if(c1(1)<1 || c1(2)<1 || c1(1)>m || c1(2)>n || a(c1(1),c1(2))==0 || stop==1)
            break;
        end
        a(c1(1),c1(2))=0;
        a(c2(1),c2(2))=a0;
        %如果吃中了食物，则利用伪随机数产生下一个食物的
        %位置并更改相应位置的矩阵元素的值使其显示出食物图像
        if(sum(c1==c)==2)
            stepnumber11 = 1 + str2double(get(number11,'string'));
            set(number11,'string',num2str(stepnumber11));
            d=d+1;cc1=rand(1);cc2=rand(1);
            c(1)=floor((cc1-(cc1-0.5)*0.4)*m)+1;
            c(2)=floor((cc1-(cc1-0.5)*0.4)*n)+1;
            while(a(c(1),c(2))==0)
                cc1=rand(1);cc2=rand(1);
            c(1)=floor((cc1-(cc1-0.5)*0.4)*m)+1;
            c(2)=floor((cc1-(cc1-0.5)*0.4)*n)+1;
            end
            a(c(1),c(2))=0;%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
        else
        %实现贪吃蛇尾的位置更新
%         fff=f(d);
        switch f(d)
            case 1
                c2(1)=c2(1)-1;
            case 2
                c2(2)=c2(2)+1;
            case 3
                c2(1)=c2(1)+1;
            case 4
                c2(2)=c2(2)-1;
        end
        end
        imh = image(cat(3,a,a,a));
        stepnumber = 1 + str2double(get(number,'string'));
        set(number,'string',num2str(stepnumber));
    end
    if (freeze==1)
        run = 0;       
        freeze = 0;   
    end
    drawnow
end