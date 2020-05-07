clc; clear all

 %% load data
 
 T = readtable('HappinessAlcoholConsumption.csv');
train  = T(:,4:9);

x1 = [train{:,'Beer_PerCapita'}];
x2 = [train{:,'Spirit_PerCapita'}];
x3 = [train{:,'Wine_PerCapita'}];
y = [train{:,'HappinessScore'}];

% x =[-2.8 -1.8 -0.8 0 0.8 1.8 2.8]';
% y = [-0.2278 0.7965 -1.5674 3.4786 3.0127 4.8952 3.9784]

%% Determine Happiness with beer using 4 kind of polynomial
figure(1);
 [x1, i] = sort(x1);
 y = y(i);
 xi = min(x1) + [0:100]/100*(max(x1)-min(x1));
 for i = 1:4
     N = 2*i -1 ;
     [h, err, yi] = WeiLs(x1,y,N,xi);
     
     subplot(220+i);
     plot(x1,y,'r+');
     hold on;
     plot(xi, yi, 'b:');
     title(['The', num2str(N), 'h polynomial fitting'])
     xlabel('Consumption of Beer/Liters Per Year');ylabel('HappinessScore');
     grid on;
 end
 f1 = h;
 %% Determine Happiness with spirit using 4 kind of polynomial
 figure(2);
 [x2, i] = sort(x2);
 y = y(i);
 xi = min(x2) + [0:100]/100*(max(x2)-min(x2));
 for i = 1:4
     N = 2*i -1 ;
     [h, err, yi] = WeiLs(x2,y,N,xi);

     subplot(220+i);
     plot(x2,y,'r+');
      hold on;
     plot(xi, yi, 'b:');
     title(['The', num2str(N), 'h polynomial fitting'])
     xlabel('Consumption of Spirit/Liters Per Year');ylabel('HappinessScore');
     grid on;
 end
 
 f2 = h ;
 
 %% Determine Happiness with wine using 4 kind of polynomial
  figure(3);
 [x3, i] = sort(x3);
 y = y(i);
 xi = min(x3) + [0:100]/100*(max(x3)-min(x3));
 for i = 1:4
     N = 2*i -1 ;
     [h, err, yi] = WeiLs(x3,y,N,xi);
     
     subplot(220+i);
     plot(x3,y,'r+');
      hold on;
     plot(xi, yi, 'b:');
     title(['The', num2str(N), 'h polynomial fitting'])
     xlabel('Consumption of Wine/Liters Per Year');ylabel('HappinessScore');
     grid on;
 end
      f3 = h;
 
 
 %% maximize the happiness score by gradient descent
 F1 = poly2sym(f1);
 F2 = poly2sym(f2);
 F3 = poly2sym(f3);
 
 ff1 =matlabFunction(F1);
 X1 = find_min_gradient_descent(-F1,295, (10)^-1 );
fprintf(['the optimal consumption of BEER liter per year to maximize the HappinessScore is  ' ...
         '(using gradient descent):\n ** %f ** \n'],X1);
     
 ff2 =matlabFunction(F2);
 X2 = find_min_gradient_descent(-F2,273, (10)^-1 );
fprintf(['the optimal consumption of SPIRIT liter per year to maximize the HappinessScore is  ' ...
         '(using gradient descent):\n ** %f ** \n'],X2);
  
 ff3 =matlabFunction(F3);
 X3 = find_min_gradient_descent(-F3,132, (10)^-1 );
fprintf(['the optimal consumption of WINE liter per year to maximize the HappinessScore is  ' ...
         '(using gradient descent):\n ** %f ** \n'],X3);
%%

 
 
 
 
 
 
 
 
 
 