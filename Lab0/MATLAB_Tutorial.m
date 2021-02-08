% Advanced Beginner Skills Tutorial

% If you do not know about splicing, arithmetic, etc..., please come to
% office hours! I am working off the assumption that you saw some MATLAB at
% some point in your career already.

%% For Loops  ("For the next hour, you get to hear my beautiful voice.")
% For loops iterate (repeat) a command or set of commands a specified
% number of times. 

% What does this for loop do? 
for i = 1:3
    disp(i);
end

% What about this one?
end_value = 4;
result = 1;
for j = 1:end_value
    result = j*result;
end

% What about this for loop?
for l = 1.0:0.2:2.0
   disp(l);
end

% What about this for loop?
for w = [1 5 8 17]
   disp(w);
end

% What is this loop doing?
my_sum = 0;
for m = 1:1000
    my_sum = my_sum + m;
end
%% Plotting ("Your AI's have been plotting to teach you MATLAB.")

% Basic Line Plot
t = 0:0.1:24;
theory = 5*cos(t) + 6;
data = 5*cos(t) + 6 + 2.*(rand(size(t)) - 0.5);
% What did I do to make some fake data here?

figure(1)
plot(t, theory, 'b-')
hold on;
plot(t, data, 'k*')
hold off;
xlabel('$t$ (hours)', 'Interpreter', 'latex', 'FontSize', 30);
ylabel('Average Number of Cyclists', ...
    'Interpreter', 'latex', ...
    'FontSize', 30); % Do you know what the '...' means?
title('Cyclical Cyclist Volume','Interpreter', 'latex', 'FontSize', 40);
legend('Model', 'Observed','Interpreter', 'latex', 'FontSize', 20, ...
    'Location', 'eastoutside'); 

% Simple Scatter Plot
figure(2)
x = randn(500,1);
y = randn(500,1);
scatter(x,y,'filled');
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 30);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 30);
title('Modern Art','Interpreter', 'latex', 'FontSize', 40);

% 3D Surface Plot
figure(3)
[X,Y] = meshgrid(1:0.1:10,  1:0.2:20);
Z = sin(X) + 0.1*Y; % What do you think this will look like?
surf(X,Y,Z)
ylabel('Y','Interpreter', 'latex', 'FontSize', 30); 
xlabel('X','Interpreter', 'latex', 'FontSize', 30); 
zlabel('Z','Interpreter', 'latex', 'FontSize', 30);

%% I/O: Reading from Files, Saving Files, Appending Files, and the like.

random_data = rand(10,2);
identity_matrix = eye(5);

% MATLAB save:
save('save_example.mat','random_data','identity_matrix');
save('save_example.txt','random_data','identity_matrix','-ascii');

% It is very easy to load data from .mat files.
load('save_example.mat')

% This is all very well and good. In previous years, some students have...
dlmwrite('dangerous_filename', identity_matrix, '-append');

% How else can we avoid overwriting existing files?
better_filename = ...
    ['writeMatrix_example_' datestr(now,'dd-mm-yyyy-HH-MM-SS') '.txt'];
dlmwrite(better_filename, identity_matrix);
inputMatrix = dlmread(better_filename);

% Recommended over DLMwrite, but doesn't work on my old version of MATLAB.
% writematrix(identity_matrix, better_filename); 
% inputMatrix = readmatrix(better_filename);

%% Reading documentation. 
% Sometimes in life, our teachers do not teach us everything we need to
% know. With patience, the documentation becomes an infinite teacher. 

% Documentation challenge 1.
% Look up the "sound" function. Figure out how to play handel.mat at twice
% the normal speed.
load handel.mat;

% Documentaton challenge 2.
% Go back to the line plot.  Look up the "plot" function. Familiarize
% yourselves with line specs. Then make the theory line thicker.

% Documentation challenge 3.
% Figure out which function to use to find the average, std of a vector of
% values. (Hint, Google "average (or std) in MATLAB" or something similar.) 

% Documentation challenge 4.
% Look up the "errorbar" function. Add vertical error bars to the cyclist
% plot. Make up a reasonable error for this toy example.
