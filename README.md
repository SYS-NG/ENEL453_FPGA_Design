# FPGA Distance Sensor Design (ENEL 453)

Lab team: [Aaron](https://github.com/aaron-born), [Bianca](https://github.com/biancaberselli), and [Steven](https://github.com/SYS-NG)

## Requirements
Utilizes Altera MAX 10 based FPGA board (DE10-Lite), piezoelectronic buzzer (TDK_PS1240P02Bt), and sharp distance sensor (GP2Y0A41SK0F).

## Running Final Project
1. Access project file `enel453/lab4/Lab4.qpf` on Quartus
2. Import assignments from `DE10_LITE.qsf`
3. Compile Design
4. Upload design on the board

## Design Criteria
- Display ouputs in voltage or distance on seven segment displays
- Output averager can be turned OFF or ON
- Measures distance between 4.00cm to 32.99cm (Regular Mode), and 0.00cm to 4.00cm (Short Distance Mode) 
- Requires to clk's Restricted Fmax to be above 50MHz

Within regular mode range:
- Outputs audio noise to indicate distance from sensor (increases frequency at closer range)

## Device Inputs
- switch 0: reset
- switch 7: short-distance mode
- switch 8: distance mode (as oppose to voltage mode)
- switch 9: averager on (to stablize output)
