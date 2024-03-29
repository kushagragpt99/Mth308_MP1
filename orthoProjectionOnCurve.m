function tc = orthoProjectionOnCurve(x0, y0, X, Y, dXdt, dYdt, eps)

format long;
f = @(t) (((X(t)-x0)^2)+((Y(t)-y0)^2)); % square of distance function
dfdt = @(t) ((X(t)-x0)*dXdt(t))+((Y(t)-y0)*dYdt(t)); % first derivative of f
 % Finding the double derivative of f
%syms t
%d2fdt2 = diff(((X(t)-x0)*dXdt(t))+((Y(t)-y0)*dYdt(t)),1);
%d2fdt2 = matlabFunction(d2fdt2); % second derivative of f
%gradient descent
smallest=power(10,10);
tc=0;
t_corr=0;
alpha=0.001;
 
  for i=[1:1000]
      t_trial=rand;
      no_iter=0;
      change = 1;
      while no_iter<power(10,5) && change > power(10,-14)
          loss = f(t_trial);
          update = 2*dfdt(t_trial);
          t_trial = t_trial - alpha*update;
          change=abs(alpha*update);
          no_iter = no_iter+1;
      end
      if smallest > loss
          t_corr=t_trial;
          smallest=loss;
      end
      tc=t_corr;
      
  end
  
  t=t_corr;
  no_iter=0;
  old_t=t_corr+change;
  change=power(10,10);
  
  while no_iter<power(10,4) && change > power(10,-15)
      t=t-(dfdt(t)*(t-old_t)/(dfdt(t)-dfdt(old_t)));
      old_t=t+(dfdt(t)*(t-old_t)/(dfdt(t)-dfdt(old_t)));
      change=abs(old_t-t);
      no_iter=no_iter+1;
  end
  tc=t;
  %disp(f(tc));
end
  