# Kinematic Analysis of a Closed-loop Robot Arm

<p align="center">
  <img src="assets/cad_model.png" width="700">
</p>

<p align="center">
  <b>Closed-loop robot arm for coordinate-based end-effector control</b>
</p>

---

## Abstract

This project presents the kinematic analysis and simulation of a closed-loop robot arm mechanism.  
The goal is to convert a target end-effector coordinate into two motor angles, \(\beta_1\) and \(\beta_2\).

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

The closed-loop linkage also maintains a constant end-effector orientation.

$$
\theta_6=\text{const}\Rightarrow\phi_{EE}=\text{const}
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

For kinematic analysis, the mechanism is simplified using two effective links, \(L_1\) and \(L_2\).  
The target end-effector position is defined in the \(y-z\) plane.

$$
P(y,z)
$$

$$
L_1,\quad L_2
$$

$$
\beta_1,\quad \beta_2
$$

---

## 3. Inverse Kinematics

The target end-effector position is defined as

$$
P(y,z)
$$

The distance from the base joint to the target point is

$$
r^2=y^2+z^2
$$

Using the cosine law,

$$
C=
\frac{r^2-L_1^2-L_2^2}{2L_1L_2}
$$

$$
C=
\frac{y^2+z^2-L_1^2-L_2^2}{2L_1L_2}
$$

Therefore, the relative angle between the two effective links is

$$
t_2=\cos^{-1}(C)
$$

The auxiliary variables are

$$
k_1=L_1+L_2C
$$

$$
k_2=L_2\sqrt{1-C^2}
$$

The first motor angle is obtained as

$$
\beta_1
=
\operatorname{atan2}(z,y)
-
\operatorname{atan2}(k_2,k_1)
$$

Substituting \(k_1\) and \(k_2\),

$$
\beta_1
=
\operatorname{atan2}(z,y)
-
\operatorname{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
$$

---

## 4. Lower Linkage Constraint

<p align="center">
  <img src="assets/lower_angle_definition.png" width="650">
</p>

<p align="center">
  <b>Fig. 3. Lower linkage angle definition</b>
</p>

From the lower linkage geometry,

$$
\theta_2=\text{const}=C_4
$$

The relation between \(\theta_1\), \(\theta_2\), and \(t_2\) is

$$
\theta_1=\theta_2-t_2
$$

Since \(\theta_2=C_4\),

$$
\theta_1=C_4-t_2
$$

The second motor angle is

$$
\beta_2=\beta_1+\theta_1
$$

Therefore,

$$
\beta_2=\beta_1+\theta_2-t_2
$$

$$
\beta_2=\beta_1+C_4-t_2
$$

Substituting \(\beta_1\) and \(t_2\),

$$
\beta_2
=
\operatorname{atan2}(z,y)
-
\operatorname{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
+
C_4
-
\cos^{-1}(C)
$$

Thus, the target coordinate can be converted into two motor angles.

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

---

## 5. Upper Linkage Constraint

<p align="center">
  <img src="assets/upper_angle_definition.png" width="650">
</p>

<p align="center">
  <b>Fig. 4. Upper linkage angle definition</b>
</p>

From the upper linkage geometry,

$$
\theta_4=\text{const}=C_1
$$

The geometric relation of the upper linkage is

$$
\beta_1+(\pi-\theta_3)=\text{const}=C_2
$$

Therefore,

$$
\beta_1=\theta_3+C_2-\pi
$$

and

$$
\theta_3=\beta_1+\pi-C_2
$$

Substituting \(\beta_1\),

$$
\theta_3
=
\operatorname{atan2}(z,y)
-
\operatorname{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
+
\pi-C_2
$$

---

## 6. End-effector Orientation Constraint

From the upper linkage,

$$
\beta_3=\pi-(\pi-\theta_5+\theta_6)
$$

Therefore,

$$
\beta_3=\theta_5-\theta_6
$$

The relative link angle is expressed as

$$
t_2=2\pi-(\theta_3+\theta_4+\theta_5)
$$

The angle sum relation is

$$
\beta_1+\beta_3+t_2=\pi
$$

Substituting the relations,

$$
\beta_1+(\theta_5-\theta_6)+2\pi-(\theta_3+\theta_4+\theta_5)=\pi
$$

$$
\beta_1-\theta_6+2\pi-\theta_3-\theta_4=\pi
$$

Therefore,

$$
\theta_6=\beta_1-\theta_3-\theta_4+\pi
$$

Using

$$
\beta_1=\theta_3+C_2-\pi
$$

and

$$
\theta_4=C_1
$$

we obtain

$$
\theta_6=(\theta_3+C_2-\pi)-\theta_3-C_1+\pi
$$

$$
\theta_6=C_2-C_1
$$

Thus,

$$
\theta_6=\text{const}=C_3
$$

Since the end-effector orientation is determined by \(\theta_6\),

$$
\phi_{EE}=\pi-\theta_6
$$

$$
\phi_{EE}=\pi-C_3
$$

Therefore,

$$
\phi_{EE}=\text{const}
$$

This means that the end-effector maintains a constant orientation during motion.

---

## 7. Relation Between \(\beta_2\) and \(\theta_5\)

Since

$$
\theta_6=C_3
$$

and

$$
\beta_3=\theta_5-\theta_6
$$

we get

$$
\beta_3=\theta_5-C_3
$$

From the lower linkage relation,

$$
\beta_2=\theta_2-\beta_3
$$

Using

$$
\theta_2=C_4
$$

we obtain

$$
\beta_2=C_4-(\theta_5-C_3)
$$

$$
\beta_2=C_4-\theta_5+C_3
$$

Therefore,

$$
\theta_5=C_4+C_3-\beta_2
$$

Substituting

$$
\beta_2=\beta_1+C_4-t_2
$$

gives

$$
\theta_5=C_4+C_3-(\beta_1+C_4-t_2)
$$

$$
\theta_5=C_3-\beta_1+t_2
$$

Substituting \(\beta_1\) and \(t_2\),

$$
\theta_5
=
C_3
-
\left[
\operatorname{atan2}(z,y)
-
\operatorname{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
\right]
+
\cos^{-1}(C)
$$

Therefore,

$$
\theta_5
=
C_3
-
\operatorname{atan2}(z,y)
+
\operatorname{atan2}
\left(
L_2\sqrt{1-C^2},
L_1+L_2C
\right)
+
\cos^{-1}(C)
$$

---

## 8. Simulation

<p align="center">
  <img src="assets/demo.gif" width="700">
</p>

<p align="center">
  <b>Fig. 5. MATLAB simulation of the closed-loop robot arm</b>
</p>

The simulation verifies that the target coordinate can be converted into motor angles while maintaining the end-effector orientation.

$$
(y,z)\rightarrow(\beta_1,\beta_2)\rightarrow\text{Motion}
$$

---

## 9. Result

The target coordinate is converted into motor angles as follows.

$$
(y,z)\rightarrow C\rightarrow t_2
$$

$$
(y,z)\rightarrow\beta_1
$$

$$
(y,z)\rightarrow\beta_2
$$

Therefore,

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

The motor angles can then be used for position control.

$$
(\beta_1,\beta_2)\rightarrow\text{Motor Angle Control}
$$

The end-effector orientation is maintained by the closed-loop constraint.

$$
\theta_6=\text{const}
$$

$$
\phi_{EE}=\text{const}
$$

Therefore,

$$
(y,z)\rightarrow(\beta_1,\beta_2)\rightarrow\text{Motor Angle Control}
$$

and

$$
\theta_6=\text{const}\Rightarrow\phi_{EE}=\text{const}
$$

---

## Conclusion

The closed-loop robot arm mechanism converts the target end-effector coordinate into two motor angles using inverse kinematics and geometric constraints.

$$
(y,z)\rightarrow(\beta_1,\beta_2)
$$

The derived motor angles can be used for position control.

$$
(\beta_1,\beta_2)\rightarrow\text{Motor Angle Control}
$$

In addition, the closed-loop linkage makes \(\theta_6\) constant.

$$
\theta_6=C_2-C_1=\text{const}
$$

Therefore, the end-effector maintains a constant orientation during motion.

$$
\phi_{EE}=\text{const}
$$
