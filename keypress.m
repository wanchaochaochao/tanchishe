    function keypress(hobj,event)
figure('KeyPressFcn',@keypress);% function KEY=keyboardinput()
global KEY;
%����figure��KeyPressFcn�ص�����������Ӧ���̰��µ��¼�
% figure('KeyPressFcn',@keypress);
%     function  keypress(hobj,event)
        %ȡ��figure��CurrentCharacter����ֵ�������������ʾ
%         key=get(hobj,'CurrentCharacter');
KEY=0;
        switch event.Key
            case 'uparrow'
                KEY=1;
            case 'downarrow'
                KEY=3;
            case 'leftarrow'
                KEY=4;
            case 'rightarrow'
                KEY=2;
        end;close;
        disp(KEY);
disp('bhjfdkg');end
%     end
% end

%  key1=key;





% % figure('KeyPressFcn',@keypress);
% keypress();
% % function keypress()
% %         keyChar=event.Character;
% %         keyModifier=event.Modifier;
%         key=event.Key;
%         aa=1;
%         switch aa
%             case 1
%                 key1=2;disp('hgfeugdsbdh');
%             case 'downarrow'
%                 key1=3;
%             case 'leftarrow'
%                 key1=4;
%             case 'rightarrow'
%                 key1=2;
%         end;
% %         disp(keyChar);
% %         disp(keyModifier);
% %         disp(key);
% %     end