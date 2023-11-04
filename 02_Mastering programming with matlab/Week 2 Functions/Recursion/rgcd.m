function d = rgcd(x,y)

    if (~isscalar(x) || ~isscalar(y) || ...
        x ~= fix(x) || y ~= fix(y) || ...
        x < 0 || y < 0)
        error('x and y must be non-negative integers');
    end

    a = max([x y]);
    b = min([x y]);
    fprintf("a = %f, b=%f and d=_\n", a, b)
    if b == 0
        d = a;
        fprintf("a = %f, b=%f and d=%f\n", a, b, d)
    else
        d = rgcd(b,rem(a,b));
        fprintf("a = %f, b=%f and d=%f\n", a, b, d)
    end
end
