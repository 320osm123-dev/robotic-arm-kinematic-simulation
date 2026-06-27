<h1 align="center">Ground-Parallel End-Effector Robotic Arm Simulation</h1>

<p align="center">
  <b>MATLAB Kinematic Simulation of a Custom 2D Linkage Mechanism</b><br>
  A harvesting robot arm mechanism designed to keep the end-effector link parallel to the ground.
</p>

---

<table>
<tr>
<td width="45%" align="center" valign="top">

<img src="cad_model.png" width="55%">

</td>
<td width="55%" valign="top">

### Key Points

- End-effector is defined as **Link 1–2**
- Maintains a ground-parallel end-effector posture during motion
- Custom robotic arm mechanism modeled in CAD
- 2D linkage simplification for kinematic simulation
- Inverse-kinematics-based posture calculation
- MATLAB kinematic simulation and animation
- Designed for a harvesting robot arm mechanism

</td>
</tr>
</table>

---

<table>
<tr>
<td width="58%" align="center" valign="top">

### 2D Linkage Model

<img src="mechanism_1.png" width="48%">
<img src="mechanism_2.png" width="48%">

</td>
<td width="42%" valign="top">

### Principle

The posture of the robotic arm is calculated using inverse kinematics.

- $r^2 = y^2 + z^2$
- $c_2 = \dfrac{r^2 - L_1^2 - L_2^2}{2L_1L_2}$
- $t_2 = \cos^{-1}(c_2)$
- $k_1 = L_1 + L_2c_2$
- $k_2 = L_2\sqrt{1-c_2^2}$
- $\beta=\arctan\left(\dfrac{z}{y}\right)-\arctan\left(\dfrac{k_2}{k_1}\right)$
- $\theta_1 = \theta_2 - t_2$
- $abs_2 = \beta + \theta_1$

</td>
</tr>
</table>

---

<h2 align="center">MATLAB Simulation</h2>

<p align="center">
  <img src="demo.gif" width="60%">
</p>

<p align="center">
The MATLAB animation verifies that the modeled robotic arm moves while maintaining the end-effector link parallel to the ground.
</p>

---

## Files

- `robotic.m` : Main MATLAB simulation code
- `demo.mp4` : MATLAB simulation video
- `cad_model.png` : CAD model image
- `mechanism_1.png`
- `mechanism_2.png`
