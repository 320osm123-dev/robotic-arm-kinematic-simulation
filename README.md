# Ground-Parallel End-Effector Robotic Arm Simulation

> MATLAB kinematic simulation of a custom planar robotic arm that maintains a ground-parallel end-effector.

---

<table>
<tr>

<td width="50%" align="center">

### CAD Model

<img src="cad_model.png" width="70%">

</td>

<td width="50%" valign="top">

### Key Points

- Ground-parallel end-effector
- Custom linkage mechanism
- CAD-based design
- Inverse kinematics
- MATLAB animation
- Designed for harvesting robots

</td>

</tr>
</table>

---

<table>
<tr>

<td width="50%" align="center">

<img src="mechanism_1.png" width="48%">
<img src="mechanism_2.png" width="48%">

</td>

<td width="50%" valign="top">

### Inverse Kinematics

$$
r^2=y^2+z^2
$$

$$
c_2=\frac{r^2-L_1^2-L_2^2}{2L_1L_2}
$$

$$
\beta=\arctan\left(\frac{z}{y}\right)-\arctan\left(\frac{k_2}{k_1}\right)
$$

$$
\theta_1=\theta_2-t_2
$$

</td>

</tr>
</table>

---

## MATLAB Simulation

<p align="center">
<img src="demo.gif" width="65%">
</p>

The simulation verifies that the end-effector remains parallel to the ground throughout the motion.

---

## Files

- `robotic.m` — MATLAB simulation
- `demo.gif` — Simulation animation
