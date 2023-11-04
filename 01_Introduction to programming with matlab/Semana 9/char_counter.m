function charnum = char_counter(fname, character)
    % Checking input is valid
    if ~ischar(character)
        charnum = -1
    else
        charnum = 0;    
        fid = fopen(fname, 'r');
        if fid < 0
            fprintf('error opening file\n');
            charnum = -1;
        else
            % Check if "character" is a valid char
            oneline = fgets(fid);
            while ischar(oneline)
                num_chars = length(strfind(oneline, character));
                charnum = charnum + num_chars;
                oneline = fgets(fid);
            end
        end
    end
end