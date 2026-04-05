function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n

	p = flip(coef)
    y_interp = polyval(p, x_interp)'
end
