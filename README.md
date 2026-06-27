# Ground-Parallel End-Effector Robotic Arm Simulation

**MATLAB Kinematic Simulation of a Custom 2D Linkage Mechanism**

This project presents a MATLAB-based kinematic simulation of a custom planar robotic linkage mechanism for a harvesting robot arm.  
The main objective is to verify whether the end-effector link remains parallel to the ground during motion.

---

## Overview

<p align="center">
<img src="cad_model.png" width="40%">
</p>

<p align="center">
<sub>Custom robotic arm CAD model</sub>
</p>

The robotic arm was first modeled as a custom linkage mechanism.  
The MATLAB simulation simplifies this CAD model into a 2D linkage structure for kinematic analysis.

---

## Project Objectives

- Design a custom robotic arm mechanism for harvesting applications
- Define the end-effector as **Link 1–2**
- Maintain a ground-parallel end-effector posture during motion
- Simplify the CAD model into a 2D linkage model
- Calculate the linkage posture using inverse kinematics
- Verify the mechanism behavior through MATLAB animation

---

## Method

### 1. CAD-Based Mechanism Design

The robotic arm was designed as a custom linkage mechanism for a harvesting robot arm.

### 2. 2D Linkage Simplification

<p align="center">
<img src="mechanism_1.png" width="40%">
&nbsp;&nbsp;&nbsp;
<img src="mechanism_2.png" width="40%">
</p>

The CAD model was simplified into a 2D linkage structure while preserving the main geometric behavior of the mechanism.

### 3. Inverse Kinematics

The posture of the robotic arm is calculated using inverse kinematics.

$$
r^2=y^2+z^2
$$

$$
c_2=\frac{r^2-L_1^2-L_2^2}{2L_1L_2}
$$

$$
t_2=\cos^{-1}(c_2)
$$

$$
k_1=L_1+L_2c_2
$$

$$
k_2=L_2\sqrt{1-c_2^2}
$$

$$
\beta=\arctan\left(\frac{z}{y}\right)-\arctan\left(\frac{k_2}{k_1}\right)
$$

$$
\theta_1=\theta_2-t_2
$$

$$
\beta_2=\beta_1+\theta_1
$$

### Variable Definitions

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

---

## Results

<p align="center">
<img src="demo.gif" width="60%">
</p>

<p align="center">
<sub>MATLAB simulation of the ground-parallel end-effector mechanism</sub>
</p>

The MATLAB animation verifies that the modeled robotic arm moves while maintaining the end-effector link parallel to the ground.

---

## Repository Structure

```text
robotic.m
demo.gif
demo.mp4
cad_model.png
mechanism_1.png
mechanism_2.png
