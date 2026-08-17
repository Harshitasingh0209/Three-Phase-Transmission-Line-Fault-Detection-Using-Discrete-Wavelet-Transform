## Project Title: 
Three Phase Transmission Line Fault Detection Using Discrete Wavelet Transform.   

## Description:
Designed and simulated a transmission line fault detection system using MATLAB and Simulink.
The project utilized Discrete Wavelet Transform (DWT) to analyze three-phase fault currents and extract critical transient features. 
By conducting a comparative analysis of six different mother wavelets (including Haar, db4, and sym4), the system's performance .
Evaluation based on detection speed, maximum detail coefficients, and overall wavelet energy.
Ultimately, a threshold-based logic was implementedto automatically identify and classify network faults, ensuring stable and reliable
operation of the modeled power system.

## Tools & Technologies

- MATLAB
- Simulink
- Discrete Wavelet Transform (DWT)
- Power Systems
- Signal Processing

	## MATLAB/Simulink Model

The Simulink model used for transmission-line fault analysis is provided below.
[Download MATLAB/Simulink Model](wavelet_transform.slx)

## MATLAB Code

The MATLAB script used for wavelet-based fault detection is available here:

[View MATLAB Code](mother_wavelet_faultdetection.m)

## Circuit Diagram

The transmission-line model and circuit diagram will be added here.
(Circuit.png)
## Results

The simulation results and fault-current waveforms will be added here.

## Methodology

The three-phase transmission-line system is modeled in MATLAB/Simulink. Fault conditions are introduced into the transmission system, and the resulting phase-current transients are analyzed.

The Discrete Wavelet Transform is then applied to the transient signals to extract high-frequency components associated with fault disturbances. The resulting wavelet coefficients are used to identify and analyze fault conditions.
