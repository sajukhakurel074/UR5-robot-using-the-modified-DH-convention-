# UR5 Cartesian Trajectory Planning (MATLAB)

This project implements **Cartesian trajectory planning and inverse kinematics for the UR5 robot** using MATLAB.

The robot moves its end-effector along a **linear path between two Cartesian positions**, while computing the corresponding joint angles for each waypoint. The motion is verified using **forward kinematics** and visualized in 3D.

---

## Features
- UR5 robot model using **Denavit–Hartenberg parameters**
- Linear **Cartesian trajectory generation**
- Numerical **inverse kinematics solver**
- **Forward kinematics verification**
- Evaluation of multiple **IK configuration aspects**
- Selection of optimal trajectory based on **minimum joint motion**
- Visualization using **MATLAB Robotics System Toolbox**

---

## Trajectory

Start point:

```
P1 = [-0.215760 -0.218150 0.096059]
```

End point:

```
P2 = [0.218150 -0.215760 0.096059]
```

10 waypoints are generated between these points and solved using inverse kinematics.

---

## Results

Forward kinematics verification:

```
Maximum error : 0.00002304 m
Mean error    : 0.00001524 m
Minimum error : 0.00000517 m
```

Aspect comparison:

| Aspect | Joint Motion (rad) |
|------|------|
| 1 | 2.7115 |
| 2 | 2.9569 |
| 3 | 2.7896 |
| 4 | 3.5687 |
| 5 | 2.8222 |

**Best aspect:** 1 (minimum joint motion)

---

## Visualizations

### Cartesian trajectory and robot configurations

![Robot trajectory](trajectory_configurations.png)

### UR5 motion using Robotics System Toolbox

![UR5 motion](toolbox_motion.png)

---

## How to Run

Run the main script in MATLAB:

```
Main
```

The program will:

1. Generate the Cartesian trajectory  
2. Solve inverse kinematics  
3. Verify using forward kinematics  
4. Visualize the robot motion  
5. Analyze IK aspects

---

## Requirements

- MATLAB
- Robotics System Toolbox

<img width="594" height="453" alt="image" src="https://github.com/user-attachments/assets/f90bd4d3-0b3c-47c7-b4c6-d3014173bedb" />

<img width="579" height="469" alt="image" src="https://github.com/user-attachments/assets/598ed7ad-6470-4781-8252-586aa9e3fe4c" />
