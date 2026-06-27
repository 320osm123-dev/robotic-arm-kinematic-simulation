# Kinematic Analysis of a Closed-loop Robot Arm

<p align="center">
  <img src="assets/cad_model.png" width="700">
</p>

<p align="center">
  <b>Closed-loop robot arm for coordinate-based end-effector control</b>
</p>

## Abstract

This project presents the kinematic analysis and simulation of a closed-loop robot arm mechanism.  
The goal is to convert a target end-effector coordinate into two motor angles.

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

The closed-loop structure also maintains a constant end-effector orientation.

$$
\theta_6=\text{const}\Rightarrow \phi_{EE}=\text{const}
$$

---

## 1. Mechanical Design

<p align="center">
  <img src="assets/cad_model.png" width="650">
</p>

<p align="center">
  <b>Fig. 1. CAD model of the robot arm</b>
</p>

The robot arm was designed as a closed-loop linkage mechanism with an end-effector module.

---

## 2. Mechanism Structure

<p align="center">
  <img src="assets/linkage_structure.png" width="650">
</p>

<p align="center">
  <b>Fig. 2. Closed-loop linkage structure</b>
</p>

For kinematic analysis, the mechanism is simplified using two effective links, $L_1$ and $L_2$.

$$
P(y,z),\quad L_1,\quad L_2,\quad \beta_1,\quad \beta_2
$$

---

## 3. Kinematic Modeling

The target end-effector position is defined as

$$
P(y,z)
$$

$$
r^2=y^2+z^2
$$

$$
C=\frac{y^2+z^2-L_1^2-L_2^2}{2L_1L_2}
$$

$$
t_2=\cos^{-1}(C)
$$

The first motor angle is obtained from inverse kinematics.

$$
\beta_1=
\mathrm{atan2}(z,y)
-
\mathrm{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
$$

From the closed-loop constraint,

$$
\theta_2=\text{const}=C_4
$$

$$
\beta_2=\beta_1+C_4-t_2
$$

Therefore,

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

---

## 4. Angle Definition

<p align="center">
  <img src="assets/upper_angle_definition.png" width="650">
</p>

<p align="center">
  <b>Fig. 3. Upper linkage angle definition</b>
</p>

<p align="center">
  <img src="assets/lower_angle_definition.png" width="650">
</p>

<p align="center">
  <b>Fig. 4. Lower linkage angle definition</b>
</p>

From the upper linkage constraint,

$$
\theta_4=\text{const}=C_1
$$

$$
\beta_1+(\pi-\theta_3)=\text{const}=C_2
$$

$$
\theta_6=C_2-C_1
$$

Thus,

$$
\theta_6=\text{const}
$$

Since the end-effector orientation is determined by $\theta_6$,

$$
\phi_{EE}=\text{const}
$$

---

## 5. Simulation

<p align="center">
  <img src="assets/demo.gif" width="700">
</p>

<p align="center">
  <b>Fig. 5. MATLAB simulation of the closed-loop robot arm</b>
</p>

The simulation verifies that the target coordinate can be converted into motor angles while maintaining the end-effector orientation.

---

## 6. Result

The desired end-effector coordinate can be converted into motor angles for position control.

$$
(y,z)\rightarrow(\beta_1,\beta_2)\rightarrow \text{Motor Angle Control}
$$

The end-effector maintains a constant orientation during motion.

$$
\theta_6=\text{const}\Rightarrow \phi_{EE}=\text{const}
$$

---

## Conclusion

The proposed closed-loop robot arm converts the target coordinate into motor angles using inverse kinematics and geometric constraints.  
The simulation confirms that coordinate-based position control is possible while maintaining a constant end-effector orientation.
