function visualize_robot_toolbox_from_trajectory(trajectory)

fprintf('Opening 3D UR5 visualization from Cartesian trajectory...\n');

robot = loadrobot('universalUR5','DataFormat','row');
ik = inverseKinematics('RigidBodyTree',robot);
weights = [1 1 1 1 1 1];

N = size(trajectory,1);
joint_configs_tb = zeros(N,6);
ee_positions = zeros(N,3);

initialguess = zeros(1,6);

for k = 1:N
    target = trvec2tform(trajectory(k,:));
    [configSol,~] = ik('tool0',target,weights,initialguess);
    joint_configs_tb(k,:) = configSol;
    initialguess = configSol;

    T = getTransform(robot,configSol,'tool0');
    ee_positions(k,:) = tform2trvec(T);
end

figure
ax = axes;
hold(ax,'on')
grid(ax,'on')
axis(ax,'equal')
xlabel(ax,'X (m)')
ylabel(ax,'Y (m)')
zlabel(ax,'Z (m)')
title(ax,'UR5 Motion in 3D using Robotics System Toolbox')
view(ax,45,25)

for k = 1:N
    show(robot,joint_configs_tb(k,:),'Parent',ax,'PreservePlot',false,'Frames','off');
    hold(ax,'on')
    plot3(ax,ee_positions(:,1),ee_positions(:,2),ee_positions(:,3),'b--','LineWidth',2)
    scatter3(ax,ee_positions(1,1),ee_positions(1,2),ee_positions(1,3),70,'g','filled')
    scatter3(ax,ee_positions(end,1),ee_positions(end,2),ee_positions(end,3),70,'k','filled')
    view(ax,45,25)
    drawnow
    pause(0.4)
end

fprintf('3D toolbox trajectory animation finished.\n');

end