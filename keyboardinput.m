%%
%ʾ��1
function keyboardinput()
%����figure��KeyPressFcn�ص�����������Ӧ���̰��µ��¼�
figure('KeyPressFcn',@keypress);
    function keypress(hobj,event)
        %ȡ��figure��CurrentCharacter����ֵ�������������ʾ
        key=get(hobj,'CurrentCharacter');
        disp(key);key1=key;
        disp(key1);
    end
end

%%
%ʾ��2
% function keyboardinput
% figure('KeyPressFcn',@keypress);
%     function keypress(hobj,event)
%         keyChar=event.Character;
%         keyModifier=event.Modifier;
%         key=event.Key;
%         disp(keyChar);
%         disp(keyModifier);
%         disp(key);
%     end
% end

% key=event.Key;disp(key);


%%
% function key2=keyboardinput()
% figure('KeyPressFcn',@keypress);
% %     function key1=keypress(hobj,event)
% %         keyChar=event.Character;
% %         keyModifier=event.Modifier;
% %         key=event.Key;aa=1;
% %         switch aa
% %             case 1
% %                 key1=2;disp('hgfeugdsbdh');
% %             case 'downarrow'
% %                 key1=3;
% %             case 'leftarrow'
% %                 key1=4;
% %             case 'rightarrow'
% %                 key1=2;
% %         end;
% %         disp(keyChar);
% %         disp(keyModifier);
% %         disp(key);
% %     end
% key1=keypress(hobj,event);
% key1=3;
% key2=key1;
% end