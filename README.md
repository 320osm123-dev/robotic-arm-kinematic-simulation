# Kinematic Analysis of a Closed-loop Robot Arm

<p align="center">
  <img src="assets/cad_model.png" width="700">
</p>

<p align="center">
  <b>Closed-loop robot arm mechanism for coordinate-based end-effector control</b>
</p>

---

## Abstract

This project presents the design, kinematic analysis, and simulation of a closed-loop robot arm mechanism.
The target end-effector position in the (y-z) plane is converted into two motor angles, (\beta_1) and (\beta_2).

[
(y,z)\rightarrow(\beta_1,\beta_2)
]

The closed-loop linkage also keeps the end-effector orientation constant.

[
\theta_6 = const \Rightarrow \phi_{EE}=const
]

---

## Demo

<p align="center">
  <img src="assets/demo.gif" width="700">
</p>

<p align="center">
  <b>Fig. 1. MATLAB simulation of the closed-loop robot arm</b>
</p>

---

## Mechanical Design

<p align="center">
  <img src="assets/cad_model.png" width="700">
</p>

<p align="center">
  <b>Fig. 2. CAD model of the robot arm</b>
</p>

The robot arm was designed as a closed-loop linkage mechanism with an end-effector module.

---

## Mechanism Structure

<p align="center">
  <img src="assets/linkage_structure.png" width="600">
</p>

<p align="center">
  <b>Fig. 3. Closed-loop linkage structure</b>
</p>

For kinematic analysis, the mechanism is simplified using two effective links, (L_1) and (L_2).

[
P(y,z),\quad L_1,\quad L_2,\quad \beta_1,\quad \beta_2
]

---

## Kinematic Modeling

The target end-effector position is defined as

[
P(y,z)
]

[
r^2=y^2+z^2
]

[
C=
\frac{y^2+z^2-L_1^2-L_2^2}{2L_1L_2}
]

[
t_2=\cos^{-1}(C)
]

The first motor angle is obtained from inverse kinematics.

[
\beta_1
=======

## \operatorname{atan2}(z,y)

\operatorname{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
]

From the closed-loop constraint,

[
\theta_2=const=C_4
]

[
\beta_2=\beta_1+C_4-t_2
]

Therefore,

[
(y,z)\rightarrow(\beta_1,\beta_2)
]

---

## Angle Definition

<p align="center">
  <img src="assets/upper_angle_definition.png" width="600">
</p>

<p align="center">
  <b>Fig. 4. Upper linkage angle definition</b>
</p>

<p align="center">
  <img src="assets/lower_angle_definition.png" width="600">
</p>

<p align="center">
  <b>Fig. 5. Lower linkage angle definition</b>
</p>

From the upper linkage constraint,

[
\theta_4=const=C_1
]

[
\beta_1+(\pi-\theta_3)=const=C_2
]

[
\theta_6=C_2-C_1
]

Thus,

[
\theta_6=const
]

Since the end-effector orientation is determined by (\theta_6),

[
\phi_{EE}=const
]

---

## Result

The target coordinate can be converted into motor angles for position control.

[
(y,z)\rightarrow(\beta_1,\beta_2)\rightarrow Motor\ Angle\ Control
]

The end-effector maintains a constant orientation during motion.

[
\theta_6=const \Rightarrow \phi_{EE}=const
]

---

## Conclusion

The proposed closed-loop robot arm converts the target end-effector coordinate into motor angles using inverse kinematics and geometric constraints.
The simulation confirms that coordinate-based position control is possible while maintaining a constant end-effector orientation.

---

## File Structure

```text
Closed-loop-Robot-Arm/
├── README.md
├── assets/
│   ├── cad_model.png
│   ├── demo.gif
│   ├── linkage_structure.png
│   ├── upper_angle_definition.png
│   └── lower_angle_definition.png
└── matlab/
    └── robot_kinematics_simulation.m
```
