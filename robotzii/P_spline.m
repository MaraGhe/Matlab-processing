function y_interp = P_spline(coef, x, x_interp)
    % si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	
    n = length(coef)
    a = [coef(1:4:n)' 0]
    b = [coef(2:4:n+1)' 0]
    c = [coef(3:4:n+2)' 0]
    d = [coef(4:4:n+3)' 0]

    % creates xi and connects a coefficient to each element in it
    h = histc(x_interp, x)
    xi = repelem(x, h)
    a = repelem(a, h)
    b = repelem(b, h)
    c = repelem(c, h)
    d = repelem(d, h)

    dif = x_interp - xi
    y_interp = a + b .* dif + c .* dif.^2 + d .* dif.^3
    [s s] = size(y_interp)
    y_interp(:, s) = y_interp(:, s-1)   % the last column was just zeros
    y_interp = diag(y_interp)'
endfunction
