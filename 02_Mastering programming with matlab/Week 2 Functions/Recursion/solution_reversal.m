function out = solution_reversal(in)
    if length(in) <= 1
        out = in;
    else
        out = [ reversal(in(2:end)) in(1) ];
    end
end
