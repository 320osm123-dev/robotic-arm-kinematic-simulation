# robotic-arm-kinematic-simulation
MATLAB simulation of a planar robotic linkage mechanism with circular end-effector trajectory tracking.MATLAB simulation of a planar robotic linkage mechanism with circular end-effector trajectory tracking.
# Robotic Arm Kinematic Simulation

This project presents a MATLAB-based 2D kinematic simulation of a planar robotic linkage mechanism.

The simulation visualizes the motion of a multi-link robotic arm while the end-effector point follows a circular trajectory.

move the end-effector point along a target circular path.  
This project was developed to analyze robotic arm kinematics and visualize linkage motion for a harvesting robot mechanism.
# Ground-Parallel End-Effector Robotic Arm Simulation

**MATLAB Kinematic Simulation of a Custom 2D Linkage Mechanism**

This project simulates a custom robotic arm mechanism in MATLAB.
The end-effector is defined as **Link 1–2**, and the objective is to verify that this link remains parallel to the ground during motion.

---

## CAD Model

<img src="cad_model.png" width="85%">

The robotic arm was first modeled as a custom linkage mechanism.
The MATLAB simulation simplifies this CAD model into a 2D linkage structure for kinematic analysis.

---

## 2D Linkage Model

<table>
<tr>
<td width="50%">
<img src="mechanism_1.png" width="100%">
</td>
<td width="50%">
<img src="mechanism_2.png" width="100%">
</td>
</tr>
</table>

---

## Principle

The posture of the robotic arm is calculated using inverse kinematics.

$$
r_2 = y^2 + z^2
$$

$$
c_2 = \frac{r_2 - L_1^2 - L_2^2}{2L_1L_2}
$$

$$
t_2 = \cos^{-1}(c_2)
$$

$$
k_1 = L_1 + L_2c_2
$$

$$
k_2 = L_2\sqrt{1-c_2^2}
$$

$$
\beta =
\tan^{-1}\left(\frac{z}{y}\right)
---------------------------------

\tan^{-1}\left(\frac{k_2}{k_1}\right)
$$

$$
\theta_1 = \theta_2 - t_2
$$

$$
abs_2 = (\pi - \beta) + \theta_1
$$

---

## Key Points

* **End-effector = Link 1–2**
* Maintains a ground-parallel end-effector posture during motion
* Custom robotic arm mechanism modeled in CAD
* 2D linkage simplification for kinematic simulation
* IK-based posture calculation
* MATLAB kinematic simulation and animation

---

## MATLAB Simulation

<img src="demo.mp4" width="100%">

The MATLAB animation verifies that the modeled robotic arm moves while maintaining the end-effector link parallel to the ground.

---

## File

* `robotic.m` : Main MATLAB simulation code
