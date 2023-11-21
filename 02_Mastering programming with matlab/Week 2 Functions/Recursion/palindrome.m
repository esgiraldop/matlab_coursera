% function result = palindrome(char_vect)
%     %char_vect = char_vect(find(~isspace(char_vect))); %Deleting spaces
%     fprintf(char_vect+"\n");
%     if length(char_vect) == 1
%         result = true;
%     elseif length(char_vect) == 2 % This conditional is not even necessary
%         if char_vect(1) == char_vect(end)
%             result = true;
%         else
%             result = false;
%         end
%     else
%         if char_vect(1) == char_vect(end)
%             if palindrome(char_vect(2:end-1)) == true
%                 result = true;
%             else
%                 result = false;
%             end
%         else
%             result = false;
%         end
%     end
% end

%% A much shorter version
% 
% function result = palindrome(char_vect)
%     if length(char_vect) == 1
%         result = true;
%     else
%         if char_vect(1) == char_vect(end) && palindrome(char_vect(2:end-1)) == true
%             result = true;
%         else
%             result = false;
%         end
%     end
% end

%% An even much shorter version

function result = palindrome(char_vect)
    if length(char_vect) == 1
        result = true;
    else
        result = char_vect(1) == char_vect(end)...
            && palindrome(char_vect(2:end-1));   
    end
end