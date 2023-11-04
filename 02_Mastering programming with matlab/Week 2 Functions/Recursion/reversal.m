function v = reversal(vect)
    if length(vect) == 1
        v = vect(1);
    else
        v = [reversal(vect(2:end)) vect(1)];
    end
end