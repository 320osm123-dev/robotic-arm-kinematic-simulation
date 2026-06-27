<div align="center">

# Ground-Parallel End-Effector Robotic Arm Simulation

**MATLAB Kinematic Simulation of a Custom 2D Linkage Mechanism**

*Ground-parallel end-effector mechanism for a harvesting robot arm.*

</div>

---

<table>
<tr>
<td width="45%" align="center" valign="middle" style="padding: 18px;">

<h3 align="center">CAD Model</h3>

<img src="cad_model.png" width="55%">

</td>
<td width="55%" valign="middle" style="padding: 18px;">

<h3>Key Features</h3>

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

<p align="center">
The mechanism was designed for a harvesting robot arm, and the main objective of this simulation is to verify whether the end-effector link remains parallel to the ground during motion.
</p>

---

<table>
<tr>
<td width="60%" align="center" valign="middle" style="padding: 18px;">

<h3 align="center">2D Linkage Model</h3>

<img src="mechanism_1.png" width="49%">
&nbsp;
<img src="mechanism_2.png" width="49%">

</td>
<td width="40%" valign="middle" style="padding: 18px;">

<h3 align="center">Inverse Kinematics</h3>

<div style="font-size: 90%; line-height: 1.35;">

- $r^2=y^2+z^2$
- $c_2=\dfrac{r^2-L_1^2-L_2^2}{2L_1L_2}$
- $t_2=\cos^{-1}(c_2)$
- $k_1=L_1+L_2c_2$
- $k_2=L_2\sqrt{1-c_2^2}$
- $\beta=\arctan\left(\dfrac{z}{y}\right)-\arctan\left(\dfrac{k_2}{k_1}\right)$
- $\theta_1=\theta_2-t_2$
- $abs_2=\beta+\theta_1$

</div>

</td>
</tr>
</table>

---

<h2 align="center">MATLAB Simulation</h2>

<p align="center">
<img src="demo.gif" width="58%">
</p>

<p align="center">
The MATLAB animation verifies that the modeled robotic arm moves while maintaining the end-effector link parallel to the ground.
</p>

---

## Files

- `robotic.m` : Main MATLAB simulation code
- `demo.mp4` : MATLAB simulation video
- `cad_model.png` : CAD model image
- `mechanism_1.png`, `mechanism_2.png` : 2D linkage model images
