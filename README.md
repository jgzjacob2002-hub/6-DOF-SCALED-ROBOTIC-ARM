# 6-DOF Scaled Robotic Arm 🤖🦾

![Robotics](https://img.shields.io/badge/Robotics-6%20DOF-blue)
![MATLAB](https://img.shields.io/badge/MATLAB-Simulation%20%26%20Kinematics-orange)
![Arduino](https://img.shields.io/badge/Arduino-Hardware%20Control-00979D)

## 📖 About the Project
This repository contains the development, mathematical calculation, and control of a 6 Degree of Freedom (6-DOF) scaled articulated robotic arm. The project operates as a **Digital Twin**, featuring a co-simulation environment: motion calculation and visualization are executed in a virtual MATLAB environment, while instructions are transmitted in real-time to replicate the exact movement on the physical hardware.

The main objective of this project is to demonstrate the practical application of robotic control theory, ranging from forward and inverse kinematics to complex trajectory planning.

## ✨ Key Features

* **Forward Kinematics:** Positional mathematical modeling implementing the **Denavit-Hartenberg (D-H)** parameter convention to establish the reference frames for each link.
* **Inverse Kinematics:** Resolution of the spatial position and orientation of the end-effector using matrix algebra and **Jacobian** matrix calculations, enabling smooth and precise motion transitions.
* **Trajectory Planning:** Programming algorithms to generate paths within the workspace. The system can execute anything from simple geometries (like circles defined in Cartesian space) to highly complex, dynamic, and chaotic trajectories.
* **Digital Twin (Simulation vs. Reality):** A graphical interface developed in MATLAB that renders the robot in 3D, allowing the visualization of the calculated trajectory simultaneously with the physical execution of the robotic arm.

## 🛠️ Technologies & Hardware

**Software & Algorithms:**
* **MATLAB:** Matrix calculation engine, Jacobian resolution, D-H parameters, and 3D simulation environment.
* **SolidWorks / CAD:** 3D kinematic modeling and mechanical part design.
* **C++ (Arduino IDE):** Serial data frame reception and PWM signal translation.

**Physical Hardware:**
* 1x **Arduino** microcontroller board (Control intermediary).
* 6x **Servomotors** (Actuators corresponding to each degree of freedom).
* Scaled 3D printed/assembled mechanical structure.

## 🚀 System Architecture & Workflow

1. **PC Calculation:** MATLAB receives the desired coordinates from the user or the mathematical trajectory function to follow.
2. **Kinematic Processing:** The MATLAB script processes the inverse kinematics using the Jacobian to determine the required joint angles ($\theta_1$ to $\theta_6$) at each time instance.
3. **3D Simulation:** The MATLAB plot updates, showing the robot's kinematic skeleton moving towards the target in the virtual space.
4. **Serial Communication:** The calculated angles are packaged and transmitted via Serial port (USB) to the microcontroller.
5. **Physical Action:** The Arduino receives the angle array, maps them to the corresponding PWM pulses, and synchronously drives the 6 servomotors, accurately replicating the simulated motion in the real world.

## 📂 Repository Structure
* `/src_matlab/`: D-H, Jacobian, and trajectory generation scripts.
* `/src_arduino/`: `.ino` source code for data reception and servo control.


---
*Developed as an industrial robotics integration project, combining mathematical calculation, computational simulation, and hardware control.*
