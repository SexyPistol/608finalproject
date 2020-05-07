%input the objective funtion f
%start point x0
%presicion in main command
function[ender] = find_min_gradient_descent(f,x0,e)

syms x  ; 
d(x)=diff(f,x);     %take the gradient function by diffentiate
iters=0;            %times of iteration
length = 0.6;       %step length of every iteration
cur_x = x0;         %initialize the starting point
flag = 1;

while(flag)
    prev_x = cur_x;
    cur_x = prev_x - length * feval(d,prev_x);%calculate the next position by gradient
    iters = iters +1;
    %nor = prev_x - cur_x;
    if(abs(double(prev_x - cur_x))<=e)   %when the output is less than the presicion set flag to 0 to stop
        flag = 0;
    end
end
ender= double(cur_x);  %жу╣Ц
end