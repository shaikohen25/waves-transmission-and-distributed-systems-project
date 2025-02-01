
# Wave Transmission and Distributed Systems - MATLAB Project

## Overview
This MATLAB project analyzes wave dynamics along a tapered transmission line and investigates impedance matching techniques. The study employs both numerical and analytical methods to solve the Telegrapher’s equations and optimize broadband matching.

## Features
- **Numerical Simulation:** Discretization of the transmission line and solving for voltage and current.
- **Impedance Matching:** Analysis of transmission line parameters for optimal matching at 10 GHz.
- **Reflection Coefficient Calculation:** Determination of input impedance and plotting of |\u0393_in| vs. frequency.
- **Optimization of Line Parameters:** Variation of inductance and capacitance to achieve broadband matching.

## Usage
  - Enter the number of discretization points (`N`) when prompted.
  - The script constructs and solves the system matrix.
  - Plots voltage and current distributions.
  - Plots the absolute value of the reflection coefficient over a frequency range.
  - Varies inductance and capacitance to improve broadband matching.
  - Generates reflection coefficient plots for different parameter values.

## Results
- Voltage and current distributions along the transmission line.
- Analytical vs. numerical solutions comparison.
- Reflection coefficient plots for impedance matching analysis.
- Optimization results for broadband matching.

