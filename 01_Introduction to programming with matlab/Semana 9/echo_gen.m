function output = echo_gen(input, fs, delay, amp)
    echo = input * amp;

    vect_delay = zeros(round(fs*delay),1);
    input = [input; vect_delay];
    echo = [vect_delay; echo];
    
    if max(abs(input)) > 1
         echo = echo/max(abs(echo));
    end
    % Merging both audios
    output = (input + echo);
    if max(abs(output)) > 1
         output = output/max(abs(output));
    end
end

%% Test cases
% y = [-0.5; 0; 0.5; 0];
% fs = 1;
% delay= 0;
% amp = 0.5;

% load splat
% fs = 8192;
% delay= 0.1;
% amp = 0.0;

% load splat
% fs = 8192;
% delay= 0.3;
% amp = 0.5;


% format long g
%% Call this function
% % Load splat which adds y and Fs to the workspace
% load splat
% % Call echo_gen to create the new audio data
% output = echo_gen(y, Fs, 0.25, 0.6);
% % The time between points is 1/Fs;
% dt = 1/Fs;
% % Plot the original sound
% plot(0:dt:dt*(length(y)-1), y)
% % Plot the new data to see visualize the echo
% figure
% plot(0:dt:dt*(length(output)-1), output)
% 
% % sound (output, Fs) % Uncomment in MATLAB to listen to the new sound data