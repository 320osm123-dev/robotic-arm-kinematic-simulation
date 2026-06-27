# Kinematic Analysis of a Parallelogram Linkage Robot Arm

<p align="center">
  <img src="assets/cad_model.png" width="700">
</p>

<p align="center">
  <b>Coordinate-based control of a 2-DOF robot arm extended with a parallelogram linkage</b>
</p>

---

## Abstract

This project extends a conventional 2-DOF robot arm with a parallelogram linkage structure, enabling the end-effector to maintain a constant orientation while converting a target coordinate into motor angles through kinematic analysis.

The main objective is:

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

The parallelogram linkage constraint keeps the end-effector orientation constant:

$$
\theta_6=\mathrm{const}
\quad\Rightarrow\quad
\phi_{EE}=\mathrm{const}
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

The robot arm is based on a 2-DOF planar arm.  
A parallelogram linkage is added to maintain the end-effector orientation during motion.

---

## Part 2. Kinematic Analysis

### Mechanism Structure

<p align="center">
  <img src="assets/mechanism_geometry.png" width="650">
</p>

<p align="center">
  <b>Fig. 2. Parallelogram linkage structure</b>
</p>

For kinematic analysis, the mechanism is represented using an equivalent two-link model.

<p align="center">
  <img src="assets/two_link_model.png" width="600">
</p>

<p align="center">
  <b>Fig. 3. Equivalent two-link model</b>
</p>

The target end-effector position is defined in the y-z plane:

$$
P(y,z)
$$

The goal is to calculate the two motor angles:

$$
\beta_1,\quad \beta_2
$$

---

### Inverse Kinematics

The distance from the base joint to the target point is:

$$
r^2=y^2+z^2
$$

Using the cosine law:

$$
C=
\frac{y^2+z^2-L_1^2-L_2^2}
{2L_1L_2}
$$

The relative angle between the two effective links is:

$$
t_2=\cos^{-1}(C)
$$

The auxiliary terms are:

$$
k_1=L_1+L_2C
$$

$$
k_2=L_2\sqrt{1-C^2}
$$

Therefore, the first motor angle is:

$$
\beta_1=
\mathrm{atan2}(z,y)
-
\mathrm{atan2}(k_2,k_1)
$$

By substituting \(k_1\) and \(k_2\):

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

---

### Closed-loop Constraint for Second Motor Angle

<p align="center">
  <img src="assets/lower_angle_definition.png" width="620">
</p>

<p align="center">
  <b>Fig. 4. Lower linkage angle definition</b>
</p>

From the lower linkage geometry, \(\theta_2\) is constant:

$$
\theta_2=C_4
$$

The internal angle relation is:

$$
\theta_1=\theta_2-t_2
$$

Therefore:

$$
\theta_1=C_4-t_2
$$

The second motor angle is defined as:

$$
\beta_2=\beta_1+\theta_1
$$

Thus:

$$
\beta_2=\beta_1+C_4-t_2
$$

Substituting \(\beta_1\) and \(t_2\):

$$
\beta_2=
\mathrm{atan2}(z,y)
-
\mathrm{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
+
C_4
-
\cos^{-1}(C)
$$

Therefore, the target coordinate can be converted into motor angles:

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

---

### End-effector Orientation Constraint

<p align="center">
  <img src="assets/upper_angle_definition.png" width="620">
</p>

<p align="center">
  <b>Fig. 5. Upper linkage angle definition</b>
</p>

From the upper linkage geometry:

$$
\theta_4=C_1
$$

$$
\beta_1+(\pi-\theta_3)=C_2
$$

Therefore:

$$
\beta_1=\theta_3+C_2-\pi
$$

The other linkage relation is:

$$
\beta_3=\theta_5-\theta_6
$$

The relative link angle is:

$$
t_2=2\pi-(\theta_3+\theta_4+\theta_5)
$$

The angle sum relation is:

$$
\beta_1+\beta_3+t_2=\pi
$$

Substituting the above relations:

$$
\beta_1+(\theta_5-\theta_6)+2\pi-(\theta_3+\theta_4+\theta_5)=\pi
$$

After simplification:

$$
\theta_6=\beta_1-\theta_3-\theta_4+\pi
$$

Using:

$$
\beta_1=\theta_3+C_2-\pi
$$

$$
\theta_4=C_1
$$

we obtain:

$$
\theta_6=C_2-C_1
$$

Thus:

$$
\theta_6=C_3=\mathrm{const}
$$

Since the end-effector orientation is determined by \(\theta_6\):

$$
\phi_{EE}=\pi-\theta_6
$$

$$
\phi_{EE}=\pi-C_3
$$

Therefore:

$$
\phi_{EE}=\mathrm{const}
$$

This means that the end-effector maintains a constant orientation during motion.

---

## Part 3. Simulation Verification

<p align="center">
  <img src="assets/demo.gif" width="700">
</p>

<p align="center">
  <b>Fig. 6. MATLAB simulation of the robot arm motion</b>
</p>

The simulation verifies that the target coordinate can be converted into motor angles while maintaining a constant end-effector orientation.

---

## Result

The target coordinate is converted into two motor angles:

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

The calculated motor angles are used for position control:

$$
(\beta_1,\beta_2)\rightarrow \mathrm{Motor\ Angle\ Control}
$$

The end-effector orientation remains constant due to the parallelogram linkage constraint:

$$
\theta_6=\mathrm{const}
\quad\Rightarrow\quad
\phi_{EE}=\mathrm{const}
$$

---

## Conclusion

This project demonstrates that a conventional 2-DOF robot arm can be extended with a parallelogram linkage to maintain a constant end-effector orientation.

Through inverse kinematics and closed-loop geometric constraints, the target end-effector coordinate can be converted into motor angles:

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

The MATLAB simulation confirms that coordinate-based motor angle control is possible while maintaining a constant end-effector orientation.
