# Ground-Parallel End-Effector Robotic Arm Simulation

**MATLAB Kinematic Simulation of a Custom 2D Linkage Mechanism**

This project presents a MATLAB-based 2D kinematic simulation of a custom planar robotic linkage mechanism for a harvesting robot arm. The main objective is to verify whether the end-effector link remains parallel to the ground during motion.

---

## CAD Model

<p align="center">
  <img src="cad_model.png" width="28%">
</p>

The robotic arm was first modeled as a custom linkage mechanism. The MATLAB simulation simplifies this CAD model into a 2D linkage structure for kinematic analysis.

---

## 2D Linkage Model and Inverse Kinematics

<table>
<tr>
<td width="52%" align="center" valign="top">

<img src="mechanism_1.png" width="62%"><br>
<img src="mechanism_2.png" width="62%">

</td>
<td width="48%" valign="top">

The posture of the robotic arm is calculated using inverse kinematics.

$$r^2 = y^2 + z^2$$

$$c_2 = \frac{r^2 - L_1^2 - L_2^2}{2L_1L_2}$$

$$t_2 = \cos^{-1}(c_2)$$

$$k_1 = L_1 + L_2c_2$$

$$k_2 = L_2\sqrt{1-c_2^2}$$

$$\beta=\arctan\left(\frac{z}{y}\right)-\arctan\left(\frac{k_2}{k_1}\right)$$

$$\theta_1 = \theta_2 - t_2$$

$$abs_2 = \beta + \theta_1$$

</td>
</tr>
</table>

---

## MATLAB Simulation

<p align="center">
  <img src="demo_compact.gif" width="45%">
</p>

The MATLAB animation verifies that the modeled robotic arm moves while maintaining the end-effector link parallel to the ground.

---

## Key Points

* End-effector is defined as **Link 1–2**
* Maintains a ground-parallel end-effector posture during motion
* Custom robotic arm mechanism modeled in CAD
* 2D linkage simplification for kinematic simulation
* Inverse-kinematics-based posture calculation
* MATLAB kinematic simulation and animation
* Designed for a harvesting robot arm mechanism

---

## Files

* `robotic.m` : Main MATLAB simulation code
* `demo_compact.gif` : MATLAB simulation GIF
* `demo.mp4` : MATLAB simulation video
* `cad_model.png` : CAD model image
* `mechanism_1.png`, `mechanism_2.png` : 2D linkage model images
