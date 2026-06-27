# Ground-Parallel End-Effector Robotic Arm Simulation

> MATLAB simulation of a custom planar robotic arm that maintains a ground-parallel end-effector using inverse kinematics.

---

<table>
<tr>
<td align="center" width="50%">

### CAD Model

<img src="cad_model.png" width="70%">

</td>

<td align="center" width="50%">

### MATLAB Simulation

<img src="demo.gif" width="70%">

</td>
</tr>
</table>

---

<table>
<tr>

<td align="center" width="50%">

### Linkage Model

<img src="mechanism_1.png" width="85%">

</td>

<td align="center" width="50%">

### Motion

<img src="mechanism_2.png" width="85%">

</td>

</tr>
</table>

---

<table>
<tr>

<td valign="top" width="50%">

## Key Features

- Ground-parallel end-effector
- Custom linkage mechanism
- CAD-based design
- Inverse kinematics
- MATLAB animation

</td>

<td valign="top" width="50%">

## Inverse Kinematics

$$r^2=y^2+z^2$$

$$
c_2=\frac{r^2-L_1^2-L_2^2}{2L_1L_2}
$$

$$
t_2=\cos^{-1}(c_2)
$$

$$
\beta=\arctan\left(\frac{z}{y}\right)-\arctan\left(\frac{k_2}{k_1}\right)
$$

</td>

</tr>
</table>

---

## Files

- `robotic.m`
- `demo.gif`
