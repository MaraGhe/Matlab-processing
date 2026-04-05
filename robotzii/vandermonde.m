function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % Calculate the Vandermonde coefficients
    A = fliplr(vander(x))

    coef = A\(y')

endfunction
