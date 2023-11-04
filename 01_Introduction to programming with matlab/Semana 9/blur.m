function output = blur(img,w)
    img = double(img);
    [m,n] = size(img);
    output = zeros(m,n);
    for i = 1:m
        for j = 1:n
            rows = i-w:i+w;
            rows = rows(rows > 0 & rows < m + 1);
            cols = j-w:j+w;
            cols = cols(cols > 0 & cols < n + 1);
            output(i,j) = mean(mean(img(rows, cols)));
        end
    end
    output = uint8(output);
end

%%
% Call this function
% img = imread('vandy.png');
% output = blur(img,2);
% imshow(output);