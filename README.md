<div align="center">

# Ground-Parallel End-Effector Robotic Arm Simulation

<b>MATLAB Kinematic Simulation of a Custom 2D Linkage Mechanism</b>

<sub>Ground-parallel end-effector mechanism for a harvesting robot arm</sub>

</div>

---

<table>
<tr>
<td width="38%" align="center" valign="top">

<h3 align="center">CAD Model</h3>

<img src="cad_model.png" width="40%">

</td>
<td width="62%" valign="top">

<h3 align="center">Key Features</h3>

<small>

- End-effector is defined as **Link 1–2**
- Maintains a ground-parallel end-effector posture during motion
- Custom robotic arm mechanism modeled in CAD
- 2D linkage simplification for kinematic simulation
- Inverse-kinematics-based posture calculation
- MATLAB kinematic simulation and animation
- Designed for a harvesting robot arm mechanism

</small>

</td>
</tr>
</table>

<p align="center">
<sub>
The mechanism was designed for a harvesting robot arm, and the main objective of this simulation is to verify whether the end-effector link remains parallel to the ground during motion.
</sub>
</p>

---

<h2 align="center">2D Linkage Model</h2>

<p align="center">
<img src="mechanism_1.png" width="40%">
&nbsp;&nbsp;&nbsp;&nbsp;
<img src="mechanism_2.png" width="40%">
</p>

---

<h2 align="center">Kinematic Analysis</h2>

<table>
<tr>
<td width="45%" align="center" valign="top">

<h3 align="center">Inverse Kinematics</h3>

$$r^2=y^2+z^2$$

$$c_2=\frac{r^2-L_1^2-L_2^2}{2L_1L_2}$$

$$t_2=\cos^{-1}(c_2)$$

$$k_1=L_1+L_2c_2$$

$$k_2=L_2\sqrt{1-c_2^2}$$

$$\beta=\arctan\left(\frac{z}{y}\right)-\arctan\left(\frac{k_2}{k_1}\right)$$

$$\theta_1=\theta_2-t_2$$

$$abs_2=\beta+\theta_1$$

</td>
<td width="55%" valign="top">

<h3 align="center">Variable Definitions</h3>

<small>

| Symbol | Description |
|:---:|---|
| $y$ | End-effector horizontal position |
| $z$ | End-effector vertical position |
| $r^2$ | Squared distance from the base to the target position |
| $L_1$ | Shoulder link length |
| $L_2$ | Elbow link length |
| $c_2$ | Cosine of the angle between shoulder and elbow links |
| $t_2$ | Relative angle between shoulder and elbow links |
| $k_1$ | Auxiliary inverse kinematics parameter |
| $\beta$ | Actual shoulder angle measured from the ground |
| $\theta_1$ | Parallelogram compensation angle |
| $\theta_2$ | Fixed structural link angle |
| $abs_2$ | Absolute elbow angle |

</small>

</td>
</tr>
</table>

---

<h2 align="center">MATLAB Simulation</h2>

<p align="center">
<img src="demo.gif" width="60%">
</p>

<p align="center">
<sub>
The MATLAB animation verifies that the modeled robotic arm moves while maintaining the end-effector link parallel to the ground.
</sub>
</p>

---

## Files

<small>

- `robotic.m` : Main MATLAB simulation code
- `demo.mp4` : MATLAB simulation video
- `cad_model.png` : CAD model image
- `mechanism_1.png`, `mechanism_2.png` : 2D linkage model images

</small>
