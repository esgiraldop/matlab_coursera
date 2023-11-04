function sum = digit_sum(num)
    if (num/10 - fix(num/10))*10 == num
        sum = num;
    else
        % Note: Use "format shortG" for not using scientific notation in the command window
        lastDigit = (num/10 - fix(num/10))*10;
        newNum = fix(num/10);
        sum = lastDigit + digit_sum(newNum);
    end
end