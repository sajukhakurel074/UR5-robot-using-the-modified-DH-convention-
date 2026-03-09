function theta = inverse_kinematics_numerical(target,d,a,alpha,q_prev)

best_cost = inf;
theta = wrap_to_pi(q_prev);

fprintf('  Target position: [%.6f %.6f %.6f]\n', target);

seed_list = [
    q_prev;
    q_prev + [0.05 0 0 0 0 0];
    q_prev - [0.05 0 0 0 0 0];
    q_prev + [0 0.05 0 0 0 0];
    q_prev - [0 0.05 0 0 0 0];
    q_prev + [0 0 0.05 0 0 0];
    q_prev - [0 0 0.05 0 0 0];
    q_prev + [0 0 0 0.05 0 0];
    q_prev - [0 0 0 0.05 0 0];
    q_prev + [0 0 0 0 0.05 0];
    q_prev - [0 0 0 0 0.05 0];
    q_prev + [0 0 0 0 0 0.05];
    q_prev - [0 0 0 0 0 0.05]
];

options = optimset('Display','off','MaxIter',2000,'MaxFunEvals',8000,'TolX',1e-10,'TolFun',1e-10);

for k = 1:size(seed_list,1)
    guess = wrap_to_pi(seed_list(k,:));
    sol = fminsearch(@(x) objective_function(x,target,d,a,alpha,q_prev), guess, options);
    sol = wrap_to_pi(sol);

    cost = objective_function(sol,target,d,a,alpha,q_prev);

    if cost < best_cost
        best_cost = cost;
        theta = sol;
    end
end

T = forward_kinematics(theta,d,a,alpha);
err = norm(T(1:3,4)' - target);

fprintf('  Best IK error: %.8f m\n', err);
fprintf('  Joint solution (deg): [');
fprintf(' %.2f', rad2deg(theta));
fprintf(' ]\n\n');

end

function cost = objective_function(x,target,d,a,alpha,q_prev)
x = wrap_to_pi(x);
T = forward_kinematics(x,d,a,alpha);
pos = T(1:3,4)';
pos_err = norm(pos - target)^2;

dq = wrap_to_pi(x - q_prev);
smooth_err = norm(dq)^2;

cost = 1e6*pos_err + 5*smooth_err;
end

function q = wrap_to_pi(q)
q = mod(q + pi, 2*pi) - pi;
end