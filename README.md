# Kinematic Analysis of a Parallelogram Linkage Robot Arm

<p align="center">
  <img src="assets/cad_model.png" width="700">
</p>

<p align="center">
  <b>Coordinate-based control of a 2-DOF robot arm extended with a parallelogram linkage</b>
</p>

---

## Abstract

This project extends a conventional 2-DOF robot arm with a parallelogram linkage structure.  
The linkage allows the end-effector to maintain a constant orientation while the target coordinate is converted into motor angles through kinematic analysis.

The main objective is to convert the target position into two motor angles.

$$
(y,z) \rightarrow (\beta_1,\beta_2)
$$

The parallelogram linkage keeps the end-effector orientation constant.

$$
\theta_6 = const
$$

$$
\phi_{EE} = const
$$

---

## Project Overview

This project consists of three parts.

1. **Mechanical Design**  
   Design of a 2-DOF robot arm extended with a parallelogram linkage.

2. **Kinematic Analysis**  
   Derivation of motor angles from the target end-effector coordinate.

3. **Simulation Verification**  
   MATLAB simulation to verify the derived kinematic model.

---

## Part 1. Mechanical Design

<p align="center">
  <img src="assets/cad_model.png" width="650">
</p>

<p align="center">
  <b>Fig. 1. CAD model of the robot arm</b>
</p>

The robot arm is based on a conventional 2-DOF planar robot arm.  
A parallelogram linkage is added so that the end-effector can maintain its orientation during motion.

---

## Part 2. Kinematic Analysis

The kinematic analysis is performed to convert the target coordinate in the y-z plane into the motor angles beta1 and beta2.

$$
(y,z) \rightarrow (\beta_1,\beta_2)
$$

The angle definitions used for the kinematic derivation are shown below.

<p align="center">
  <img src="assets/front_left_angle_definition.png" width="620">
</p>

<p align="center">
  <b>Fig. 2. Angle definition in the front-left configuration</b>
</p>

<p align="center">
  <img src="assets/front_right_angle_definition.png" width="620">
</p>

<p align="center">
  <b>Fig. 3. Angle definition in the front-right configuration</b>
</p>

---

### Inverse Kinematics

The target end-effector position is defined as

$$
P(y,z)
$$

The distance from the base joint to the target point is

$$
r^2 = y^2 + z^2
$$

Using the cosine law, the relative configuration of the two effective links is expressed as

$$
C = {y^2 + z^2 - L_1^2 - L_2^2 \over 2L_1L_2}
$$

The relative angle between the two effective links is

$$
t_2 = cos^{-1}(C)
$$

The auxiliary terms are defined as

$$
k_1 = L_1 + L_2C
$$

$$
k_2 = L_2\sqrt{1-C^2}
$$

Therefore, the first motor angle is obtained as

$$
\beta_1 = atan2(z,y) - atan2(k_2,k_1)
$$

Substituting k1 and k2 gives

$$
\beta_1 = atan2(z,y) - atan2(L_2\sqrt{1-C^2},L_1+L_2C)
$$

---

### Closed-loop Constraint for Motor Angle beta2

From the front-left configuration, the angle theta2 is constant.

$$
\theta_2 = C_4
$$

The internal angle relation is

$$
\theta_1 = \theta_2 - t_2
$$

Therefore,

$$
\theta_1 = C_4 - t_2
$$

The second motor angle is defined as

$$
\beta_2 = \beta_1 + \theta_1
$$

Thus,

$$
\beta_2 = \beta_1 + C_4 - t_2
$$

Substituting beta1 and t2 gives

$$
\beta_2 = atan2(z,y) - atan2(L_2\sqrt{1-C^2},L_1+L_2C) + C_4 - cos^{-1}(C)
$$

Therefore, the target coordinate can be converted into the two motor angles.

$$
(y,z) \rightarrow (\beta_1,\beta_2)
$$

---

### End-effector Orientation Constraint

From the front-right configuration, the angle theta4 is constant.

$$
\theta_4 = C_1
$$

The geometric relation between beta1 and theta3 is

$$
\beta_1 + (\pi - \theta_3) = C_2
$$

Therefore,

$$
\beta_1 = \theta_3 + C_2 - \pi
$$

The other linkage relation is

$$
\beta_3 = \theta_5 - \theta_6
$$

The relative link angle is

$$
t_2 = 2\pi - (\theta_3 + \theta_4 + \theta_5)
$$

The angle sum relation is

$$
\beta_1 + \beta_3 + t_2 = \pi
$$

Substituting the above relations gives

$$
\beta_1 + (\theta_5 - \theta_6) + 2\pi - (\theta_3 + \theta_4 + \theta_5) = \pi
$$

After simplification,

$$
\theta_6 = \beta_1 - \theta_3 - \theta_4 + \pi
$$

Using

$$
\beta_1 = \theta_3 + C_2 - \pi
$$

and

$$
\theta_4 = C_1
$$

theta6 becomes

$$
\theta_6 = (\theta_3 + C_2 - \pi) - \theta_3 - C_1 + \pi
$$

Therefore,

$$
\theta_6 = C_2 - C_1
$$

Since C1 and C2 are constants,

$$
\theta_6 = C_3 = const
$$

The end-effector orientation is determined by theta6.

$$
\phi_{EE} = \pi - \theta_6
$$

Substituting theta6 gives

$$
\phi_{EE} = \pi - C_3
$$

Therefore, the end-effector orientation remains constant.

$$
\phi_{EE} = const
$$

---

## Part 3. Simulation Verification

The MATLAB simulation was constructed using the linkage points and geometric constraints of the mechanism.  
The numbered points represent the joints used in the simulation model.

<p align="center">
  <img src="assets/simulation_structure_left.png" width="620">
</p>

<p align="center">
  <b>Fig. 4. Simulation linkage structure in the front-left configuration</b>
</p>

<p align="center">
  <img src="assets/simulation_structure_right.png" width="620">
</p>

<p align="center">
  <b>Fig. 5. Simulation linkage structure in the front-right configuration</b>
</p>

The simulation verifies that the target coordinate can be converted into motor angles while maintaining a constant end-effector orientation.

<p align="center">
  <img src="assets/demo.gif" width="700">
</p>

<p align="center">
  <b>Fig. 6. MATLAB simulation result</b>
</p>

---

## Result

The target coordinate is converted into two motor angles.

$$
(y,z) \rightarrow (\beta_1,\beta_2)
$$

The calculated motor angles are used for position control.

$$
(\beta_1,\beta_2) \rightarrow Motor\ Angle\ Control
$$

The end-effector orientation remains constant due to the parallelogram linkage constraint.

$$
\theta_6 = const
$$

$$
\phi_{EE} = const
$$

---

## Conclusion

This project demonstrates that a conventional 2-DOF robot arm can be extended with a parallelogram linkage to maintain a constant end-effector orientation.

Through inverse kinematics and closed-loop geometric constraints, the target end-effector coordinate can be converted into motor angles.

$$
(y,z) \rightarrow (\beta_1,\beta_2)
$$

The MATLAB simulation confirms that coordinate-based motor angle control is possible while maintaining a constant end-effector orientation.

$$
(y,z) \rightarrow (\beta_1,\beta_2) \rightarrow Motor\ Angle\ Control
$$

$$
\theta_6 = const
$$

$$
\phi_{EE} = const
$$

---

## File Structure

```text
Parallelogram-Linkage-Robot-Arm/
├── README.md
├── assets/
│   ├── cad_model.png
│   ├── front_left_angle_definition.png
│   ├── front_right_angle_definition.png
│   ├── simulation_structure_left.png
│   ├── simulation_structure_right.png
│   └── demo.gif
└── matlab/
    └── robot_kinematics_simulation.m
```
