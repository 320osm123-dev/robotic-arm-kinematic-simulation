# Ground-Parallel End-Effector Robotic Arm Simulation

**MATLAB Kinematic Simulation of a Custom 2D Linkage Mechanism**

This project presents a MATLAB-based 2D kinematic simulation of a custom planar robotic linkage mechanism.

---

<table>
<tr>

<td width="50%" align="center">

### CAD Model

<img src="cad_model.png" width="70%">

</td>

<td width="50%" valign="top">

### Key Points

- End-effector is defined as **Link 1–2**
- Maintains a ground-parallel end-effector posture
- Custom linkage mechanism modeled in CAD
- 2D linkage simplification
- Inverse-kinematics-based posture calculation
- MATLAB kinematic simulation
- Designed for a harvesting robot arm

</td>

</tr>
</table>

---

<table>
<tr>

<td width="50%" align="center" valign="top">

<img src="mechanism_1.png" width="48%">
<img src="mechanism_2.png" width="48%">

</td>

<td width="50%" valign="top">

### Inverse Kinematics

$$
r^2 = y^2 + z^2
$$

$$
c_2 = \frac{r^2 - L_1^2 - L_2^2}{2L_1L_2}
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
\beta=\arctan\left(\frac{z}{y}\right)-\arctan\left(\frac{k_2}{k_1}\right)
$$

$$
\theta_1 = \theta_2 - t_2
$$

$$
abs_2 = \beta + \theta_1
$$

</td>

</tr>
</table>

---

## MATLAB Simulation

<p align="center">
<img src="demo.gif" width="55%">
</p>

The MATLAB animation verifies that the modeled robotic arm moves while maintaining the end-effector link parallel to the ground.

---

## Files

- `robotic.m` : Main MATLAB simulation code
- `demo.gif` : MATLAB simulation
- `demo.mp4` : Original video
