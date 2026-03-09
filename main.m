clear
clc
close all

fprintf('============================================\n');
fprintf('UR5 Trajectory Planning Assignment\n');
fprintf('============================================\n\n');

[d,a,alpha] = dh_parameters;

P1 = [-0.215760 -0.218150 0.096059];
P2 = [ 0.218150 -0.215760 0.096059];
N = 50;

fprintf('Start point P1: [%.6f %.6f %.6f]\n', P1);
fprintf('End point   P2: [%.6f %.6f %.6f]\n', P2);
fprintf('Number of waypoints: %d\n\n', N);

trajectory = generate_trajectory(P1,P2,N);

joint_configs = zeros(N,6);

q_prev = zeros(1,6);

fprintf('Solving inverse kinematics for each waypoint...\n');
for i = 1:N
    fprintf('Waypoint %d/%d\n', i, N);
    target = trajectory(i,:);
    joint_configs(i,:) = inverse_kinematics_numerical(target,d,a,alpha,q_prev);
    q_prev = joint_configs(i,:);
end
fprintf('Inverse kinematics completed.\n\n');

fprintf('Inverse kinematics completed.\n\n');

positions = compute_joint_positions(joint_configs,d,a,alpha);

verify_trajectory(trajectory,joint_configs,d,a,alpha);

visualize_robot(positions,trajectory);

fprintf('\nAll tasks completed successfully.\n');

analyze_aspects(trajectory,d,a,alpha)
%animate_robot(positions,trajectory)
visualize_robot_toolbox_from_trajectory(trajectory)