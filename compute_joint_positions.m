function positions = compute_joint_positions(joint_configs,d,a,alpha)

fprintf('Computing robot joint positions for visualization...\n');

N = size(joint_configs,1);
positions = cell(N,1);

for k = 1:N
    theta = joint_configs(k,:);
    T = eye(4);

    pos = zeros(7,3);
    pos(1,:) = [0 0 0];

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
        pos(i+1,:) = T(1:3,4)';
    end

    positions{k} = pos;
end

fprintf('Joint positions computed for %d robot configurations.\n\n', N);

end