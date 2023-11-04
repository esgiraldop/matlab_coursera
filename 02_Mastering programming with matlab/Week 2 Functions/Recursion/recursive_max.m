function maxNum = recursive_max(vect)
    % Base case
    if length(vect) == 1
        maxNum = vect(1);
    else
        maxOther = recursive_max(vect(2:end));
        if vect(1) > maxOther
            maxNum = vect(1);
        else
            maxNum = maxOther;
        end
    end
end