function vect = fibor(n)
    if n == 1
        vect = 1;
    elseif n==2
        vect = [1 1];
    else
        fibon2 = fibor(n-2)
        fibon1 = fibor(n-1)
        newVect = fibon2() + fibor(n-1);
        Cuando n=4          
        fibo(2) + fibo(3)
        [1 1] + fibo(1) + fibo(2)
        [1 1] + [1] + [1 1]
        [1 1 2 3]
        vect = [vect newVect];
    end
end