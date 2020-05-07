%% Initialization
%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
%data = load('HappinessAlcoholConsumption.csv');
%X = data(:, 5:9);
%y = data(:, 4);
T = readtable('HappinessAlcoholConsumption.csv');
train  = T(:,4:9);
X = [train{:,'HDI'} train{:,'GDP_PerCapita'} train{:,'Beer_PerCapita'} train{:,'Spirit_PerCapita'} train{:,'Wine_PerCapita'}];
y = [train{:,'HappinessScore'}];
%X  %test
%y  %test

m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf('[HDI,GDP_PerCapita,BeerLitesPerYear,SpiritLitesPerYear,WineLitesPerYear]=[HappinessScore] \n');
fprintf(' x = [%.0f %.0f %.0f %.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.03;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(6, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('error');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate 
fprintf('its a linear refgression so predict \n');
nomalize_x = ([906 44.731 200 0 150] - mu) ./ sigma                                      %<--------------
HappinessScore = [1 nomalize_x] * theta % You should change this


fprintf(['Predicted an American Beer:200 Spirit:0 Wine:150 ' ...
         '(using gradient descent):\n ** %f ** \n'],HappinessScore);

