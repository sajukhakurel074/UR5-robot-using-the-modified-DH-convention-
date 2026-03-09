function animate_robot(positions,trajectory)

fprintf('Starting robot animation...\n');

figure
hold on
grid on
axis equal

xlabel('X')
ylabel('Y')
zlabel('Z')

plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3),'b--','LineWidth',2)

for k = 1:length(positions)

    pos = positions{k};

    cla

    plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3),'b--','LineWidth',2)
    plot3(pos(:,1),pos(:,2),pos(:,3),'r-o','LineWidth',2)

    scatter3(trajectory(1,1),trajectory(1,2),trajectory(1,3),80,'g','filled')
    scatter3(trajectory(end,1),trajectory(end,2),trajectory(end,3),80,'k','filled')

    drawnow
    pause(0.4)

end

fprintf('Animation finished.\n');

end