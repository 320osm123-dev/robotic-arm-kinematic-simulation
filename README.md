# Kinematic Analysis of a Closed-loop Robot Arm

![CAD Model](assets/cad_model.png)

## Abstract

This project presents the design and kinematic analysis of a closed-loop robot arm.
The target end-effector position in the (y-z) plane is converted into two motor angles, (\beta_1) and (\beta_2).

[
(y,z)\rightarrow(\beta_1,\beta_2)
]

The closed-loop linkage also maintains a constant end-effector orientation.

[
\theta_6=const \Rightarrow \phi_{EE}=const
]

---

## 1. Mechanical Design

The robot arm was designed as a closed-loop linkage mechanism with an end-effector module.

![CAD Model](assets/cad_model.png)

---

## 2. Mechanism Structure

The mechanism is simplified using two effective links, (L_1) and (L_2), for planar kinematic analysis.

![Linkage Structure](assets/linkage_points.png)

[
P(y,z)
]

[
L_1,\ L_2
]

[
\beta_1,\ \beta_2
]

---

## 3. Kinematic Modeling

The target position is defined as

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

## 4. End-effector Orientation

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

## 5. Simulation

The MATLAB simulation verifies the motion of the closed-loop robot arm.

![Simulation Demo](assets/demo.gif)

---

## 6. Result

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

The proposed closed-loop robot arm converts the desired end-effector coordinate into motor angles using inverse kinematics and geometric constraints.
The simulation confirms that coordinate-based position control is possible while maintaining a constant end-effector orientation.
