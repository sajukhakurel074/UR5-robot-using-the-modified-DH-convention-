function T = forward_kinematics(theta,d,a,alpha)

T = eye(4);

for i = 1:6
    ct = cos(theta(i));
    st = sin(theta(i));
    ca = cos(alpha(i));
    sa = sin(alpha(i));

    A = [ct -st*ca  st*sa  a(i)*ct;
         st  ct*ca -ct*sa  a(i)*st;
         0   sa     ca     d(i);
         0   0      0      1];

    T = T * A;
end

end