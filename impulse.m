function impulse=impulse(t,td,A,I)

t1=td-A/2; t2 = td+A/2;

    if t-t1<0 || t-t2>0
        impulse=0;
    else
        impulse=I;
    end


end