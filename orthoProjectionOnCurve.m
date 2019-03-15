function tc = orthoProjectionOnCurve(x0, y0, X, Y, dXdt, dYdt, eps)

%gradient descent
sabse_chota=power(10,10);
tc=0;
t_corr=0;
alpha=0.00001;
for i=[1:100]
    anish_ki_maa=rand;
    no_iter=0;
    change = 1;
    while no_iter<power(10,5) && change > power(10,-10)
        chuna = power(x0 - X(anish_ki_maa),2) + power(y0-Y(anish_ki_maa),2);
        update = 2*(X(anish_ki_maa) - x0)*dXdt(anish_ki_maa) + 2*(Y(anish_ki_maa) - y0)*dYdt(anish_ki_maa);
        anish_ki_maa = anish_ki_maa - alpha*update;
        change=abs(alpha*update);
        no_iter = no_iter+1;
    end
    if sabse_chota > chuna
        t_corr=anish_ki_maa;
        sabse_chota=chuna;
    end
end
disp(sabse_chota);
tc=t_corr;
    

