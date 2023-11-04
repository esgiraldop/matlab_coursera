function res = solution_digit_sum(n)
    if n < 10
        res = n;
    else
        res = solution_digit_sum(floor(n/10)) + rem(n,10);
    end
end