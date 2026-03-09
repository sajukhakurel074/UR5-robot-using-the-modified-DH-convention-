function visualize_robot(positions,trajectory)

fprintf('Opening trajectory visualization...\n');

figure
hold on
grid on
axis equal

plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3),'b--','LineWidth',2)

numPoses = length(positions);
idx = round(linspace(1,numPoses,6));

for k = 1:length(idx)
    pos = positions{idx(k)};
    plot3(pos(:,1),pos(:,2),pos(:,3),'r-o','LineWidth',1.5,'MarkerSize',4)
end

scatter3(trajectory(1,1),trajectory(1,2),trajectory(1,3),80,'g','filled')
scatter3(trajectory(end,1),trajectory(end,2),trajectory(end,3),80,'k','filled')

xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')
title('UR5 Cartesian Trajectory and Selected Robot Configurations')
view(45,25)

fprintf('Visualization complete.\n');

end