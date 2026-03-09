function analyze_aspects(trajectory,d,a,alpha)

fprintf('Analyzing different trajectory aspects...\n');

initial_seeds = [
     0    0    0    0    0    0;
     pi/2 -pi/4  pi/3   0    0    0;
    -pi/2  pi/4 -pi/3   0    0    0;
     pi/3  pi/3 -pi/2  pi/4  0    0;
    -pi/3 -pi/3  pi/2 -pi/4  0    0
];

num_seeds = size(initial_seeds,1);
N = size(trajectory,1);

motion_cost = zeros(num_seeds,1);

for s = 1:num_seeds
    fprintf('\nAspect %d\n',s);

    joint_configs = zeros(N,6);
    q_prev = initial_seeds(s,:);

    for i = 1:N
        target = trajectory(i,:);
        joint_configs(i,:) = inverse_kinematics_numerical(target,d,a,alpha,q_prev);
        q_prev = joint_configs(i,:);
    end

    total_motion = 0;
    for i = 2:N
        dq = wrap_to_pi(joint_configs(i,:) - joint_configs(i-1,:));
        total_motion = total_motion + norm(dq);
    end

    motion_cost(s) = total_motion;

    fprintf('Total joint motion: %.4f rad\n', total_motion);
end

[best_cost,best_index] = min(motion_cost);

fprintf('\nBest aspect found: %d\n', best_index);
fprintf('Minimum motion cost: %.4f rad\n\n', best_cost);

end

function q = wrap_to_pi(q)
q = mod(q + pi, 2*pi) - pi;
end