function [d,a,alpha] = dh_parameters

fprintf('Loading UR5 DH parameters...\n');

d = [0.089159 0 0 0.13585 0.08916 0.0823];
a = [0 -0.13585 -0.1197 0 0 0];
alpha = [pi/2 0 0 pi/2 -pi/2 0];

fprintf('DH parameters loaded.\n');
fprintf('d     = [');
fprintf(' %.6f', d);
fprintf(' ]\n');

fprintf('a     = [');
fprintf(' %.6f', a);
fprintf(' ]\n');

fprintf('alpha = [');
fprintf(' %.4f', alpha);
fprintf(' ]\n\n');

end