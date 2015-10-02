function result = dot3(x,y)
    % result = dot3(x,y)
    % x and y are column vector of the same length.
    % result is a 3-digit representation of the inner product of x and y.
    
    result = 0;
    
    for i = 1:length(x)
        x3 = Represent(x(i));
        y3 = Represent(y(i));
        result = result + Convert(Float(x3,y3,'*'));
    end
    
    result = Represent(result);
end