%% this version only returns the last number
% function vect = fibor(n)
%     if n < 3
%         vect = 1;
%     else
%         vect = fibor(n-2) + fibor(n-1);
%         %vect = [vect newNum]
%     end
% end

%% This version returns the whole vector
function vect = fibor(n)
    if n == 1
        vect = 1
    else if n == 2
        vect = [1 1];
    else
        vect = fibor(n-1);
        crrntFibo = vect(end-1) + vect(end);
        vect = [vect crrntFibo];
    end
end