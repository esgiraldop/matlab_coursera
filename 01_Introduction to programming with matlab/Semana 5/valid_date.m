function valid = valid_date(year, month, day)
    if isscalar(year) == false || isscalar(month) == false || isscalar(day) == false
        valid = false
    else
        if year < 1 || month < 1 || day < 1
            valid = false;
        elseif year ~= fix(year) || month ~= fix(month) || day ~= fix(day)
            valid = false;
        else
            if month == 2 && day == 29 % Check leap year
                valid = leap_year(year);
            else
                % Check days (1-31) and months (1-12) are correct
                if month > 12
                    valid = false;
                else
                    if month == 2 % feb
                        if day < 29
                            valid = true;
                        else
                            valid = false;
                        end
                    elseif sum(month == [4,6,9,11]) == 1 % April, June, September or November
                        if day < 31
                            valid = true;
                        else
                            valid = false;
                        end
                    elseif sum(month == [1,3,5,7, 8, 10, 12]) == 1 % January, March, May, July, August, October or December
                        if day < 32
                            valid = true;
                        else
                            valid = false;
                        end
                    end
                end
            end
        end
    end
end

function leap = leap_year(year)
    if  rem(year,4) == 0
        if rem(year,100) == 0
            if rem(year,400) == 0
                leap = true;
            else
                leap = false;
            end
        else
            leap = true;
        end
    else
        leap = false;
    end
end