function trajectory = generate_trajectory(P1,P2,N)

fprintf('Generating linear Cartesian trajectory...\n');

trajectory = zeros(N,3);

for i = 1:N
    s = (i-1)/(N-1);
    trajectory(i,:) = P1 + s*(P2-P1);
end

fprintf('Trajectory generated with %d waypoints.\n', N);
fprintf('First waypoint: [%.6f %.6f %.6f]\n', trajectory(1,:));
fprintf('Last waypoint : [%.6f %.6f %.6f]\n\n', trajectory(end,:));

end