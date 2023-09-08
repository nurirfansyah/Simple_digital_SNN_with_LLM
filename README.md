# Caravel User Project : Exploring the use of ChatGPT to design and implement a simple digital spiking neural network

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: Important Note            |
|-----------------------------------------|

This is an AI-generated design. Most parts of the documentation are also AI-generated, as seen below. The prompts leading to the system design, verilog code, and documentation can be seen from: docs/Simple SNN Verilog Implementation.pdf. (https://github.com/nurirfansyah/Simple_digital_SNN_with_LLM/blob/main/docs/Simple%20SNN%20Verilog%20Implementation.pdf)

Here's a brief documentation of the system and its modules:

---
### System Overview
The designed system integrates a simple Spiking Neural Network (SNN) into a generic user project wrapper (`user_project_wrapper`). This wrapper is typically used to bridge user-designed modules with a larger system-on-chip (SoC) environment that could include items like CPU cores, memory, and other peripherals.

![mermaid-diagram-2023-09-08-101024](https://github.com/nurirfansyah/Simple_digital_SNN_with_LLM/assets/40015347/cb550d81-d6f6-4644-ad0e-64ec4e6a40f5)


#### Modules:
1. `user_project_wrapper`: The top-level module that integrates the SNN with the SoC environment.
2. `SNN`: The Spiking Neural Network module that takes in neuron inputs and generates neuron outputs based on the inputs and the internal neural architecture.
3. `spiking_neuron`: Represents an individual neuron within the SNN. 

---
### `user_project_wrapper`
#### Description:
This is the primary interface between the user-designed hardware (in this case, the SNN) and the overall SoC or system environment. It provides a range of connection points including power, Wishbone bus interface, logic analyzer signals, and generic I/O.

#### Ports:
- Power Pins: For supplying power to the user project.
- `wb_clk_i`, `wb_rst_i`: Wishbone bus clock and reset inputs.
- Wishbone Slave ports (`wbs_stb_i`, `wbs_cyc_i`, etc.): For communication with the larger SoC environment.
- Logic Analyzer signals: For debugging and monitoring.
- `io_in`, `io_out`, `io_oeb`: Generic I/O for interfacing with external world.
- `user_clock2`: Independent clock source.
- `user_irq`: User interrupt outputs.

---
### `SNN` (Spiking Neural Network)
#### Description:
This is a neural network composed of spiking neurons. For the purpose of this design, the SNN contains an input layer with 9 neurons and an output layer with 3 neurons. All neurons are fully connected via synapses. The SNN can be trained to classify input patterns.

#### Ports:
- `clk`: Clock input.
- `rst_n`: Active low reset.
- `input_signal`: Array of signals representing input to the 9 neurons.
- `output_signal`: Array of signals representing the output of the 3 output neurons.

---
### `spiking_neuron`
#### Description:
A model of a spiking neuron, which accumulates input and produces a spike once a certain threshold is reached.

#### Ports:
- `clk`: Clock input.
- `rst_n`: Active low reset.
- `neuron_input`: The accumulated input to the neuron.
- `neuron_spike`: A signal that goes high when the neuron produces a spike.

#### Operation:
The neuron has an accumulator that sums up its inputs. When the total input over time crosses a preset threshold (`THRESHOLD`), the neuron "fires" or "spikes". After spiking, the accumulator resets by the threshold amount, and the process continues.

---
### Usage Guide:
1. Integrate the `user_project_wrapper` into your system.
2. Connect the appropriate power, clock, reset, and I/O pins as per your system's requirements.
3. Provide input patterns to the `SNN` via the `io_in` pins.
4. Observe the neuron spikes on the `io_out` pins.

---
### Conclusion:
This document provides a brief overview of the designed system, focusing on the Spiking Neural Network and its integration with the `user_project_wrapper`. It outlines the primary modules and their functions, allowing for easy integration and usage within a larger SoC environment.

Refer to [README](docs/source/index.rst#section-quickstart) for a quickstart of how to use caravel_user_project

Refer to [README](docs/source/index.rst) for this sample project documentation. 

Refer to the following [readthedocs](https://caravel-sim-infrastructure.readthedocs.io/en/latest/index.html) for how to add cocotb tests to your project. 
