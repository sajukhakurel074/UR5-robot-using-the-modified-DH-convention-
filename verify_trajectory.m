function verify_trajectory(trajectory,joint_configs,d,a,alpha)

fprintf('Verifying trajectory using forward kinematics...\n');

N = size(trajectory,1);
errors = zeros(N,1);

for i = 1:N
    T = forward_kinematics(joint_configs(i,:),d,a,alpha);
    fk_pos = T(1:3,4)';
    errors(i) = norm(fk_pos - trajectory(i,:));
end

fprintf('Verification completed.\n');
fprintf('Maximum position error : %.8f m\n', max(errors));
fprintf('Mean position error    : %.8f m\n', mean(errors));
fprintf('Minimum position error : %.8f m\n\n', min(errors));

end