function W = RandInit(L_in, L_out)

W = zeros(L_out, 1 + L_in);

epsilon.init = sqrt(6)/sqrt(L_in + L_out);
W = rand(L_out, 1 + L_in) * 2 * epsilon.init - epsilon.init;

end
