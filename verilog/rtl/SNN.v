module SNN (
    input clk,
    input rst,
    input [8:0] io_in,      // 9 input neurons
    output [2:0] io_out     // 3 output neurons
);

    // Define the Input Neurons
    reg [8:0] spike_in = io_in; // Spike signals for the 9 input neurons

    // Define the Output Neurons
    wire neuron10_spike, neuron11_spike, neuron12_spike;

    // Synaptic weights for each neuron connection
    reg [8:0] weights_neuron10, weights_neuron11, weights_neuron12;

    // Output Neurons
    spiking_neuron #(.threshold(3)) neuron10 (.clk(clk), .rst(rst), .input({spike_in[8] & weights_neuron10[8], spike_in[7] & weights_neuron10[7], spike_in[6] & weights_neuron10[6], spike_in[5] & weights_neuron10[5], spike_in[4] & weights_neuron10[4], spike_in[3] & weights_neuron10[3], spike_in[2] & weights_neuron10[2], spike_in[1] & weights_neuron10[1], spike_in[0] & weights_neuron10[0]}), .spike(neuron10_spike));

    spiking_neuron #(.threshold(3)) neuron11 (.clk(clk), .rst(rst), .input({spike_in[8] & weights_neuron11[8], spike_in[7] & weights_neuron11[7], spike_in[6] & weights_neuron11[6], spike_in[5] & weights_neuron11[5], spike_in[4] & weights_neuron11[4], spike_in[3] & weights_neuron11[3], spike_in[2] & weights_neuron11[2], spike_in[1] & weights_neuron11[1], spike_in[0] & weights_neuron11[0]}), .spike(neuron11_spike));

    spiking_neuron #(.threshold(3)) neuron12 (.clk(clk), .rst(rst), .input({spike_in[8] & weights_neuron12[8], spike_in[7] & weights_neuron12[7], spike_in[6] & weights_neuron12[6], spike_in[5] & weights_neuron12[5], spike_in[4] & weights_neuron12[4], spike_in[3] & weights_neuron12[3], spike_in[2] & weights_neuron12[2], spike_in[1] & weights_neuron12[1], spike_in[0] & weights_neuron12[0]}), .spike(neuron12_spike));

    assign io_out[0] = neuron10_spike;
    assign io_out[1] = neuron11_spike;
    assign io_out[2] = neuron12_spike;

    // STDP learning for neuron10
    STDP stdp_neuron10_0 (.clk(clk), .rst(rst), .pre_spike(spike_in[0]), .post_spike(neuron10_spike), .weight(weights_neuron10[0]));
    STDP stdp_neuron10_1 (.clk(clk), .rst(rst), .pre_spike(spike_in[1]), .post_spike(neuron10_spike), .weight(weights_neuron10[1]));
    STDP stdp_neuron10_2 (.clk(clk), .rst(rst), .pre_spike(spike_in[2]), .post_spike(neuron10_spike), .weight(weights_neuron10[2]));
    STDP stdp_neuron10_3 (.clk(clk), .rst(rst), .pre_spike(spike_in[3]), .post_spike(neuron10_spike), .weight(weights_neuron10[3]));
    STDP stdp_neuron10_4 (.clk(clk), .rst(rst), .pre_spike(spike_in[4]), .post_spike(neuron10_spike), .weight(weights_neuron10[4]));
    STDP stdp_neuron10_5 (.clk(clk), .rst(rst), .pre_spike(spike_in[5]), .post_spike(neuron10_spike), .weight(weights_neuron10[5]));
    STDP stdp_neuron10_6 (.clk(clk), .rst(rst), .pre_spike(spike_in[6]), .post_spike(neuron10_spike), .weight(weights_neuron10[6]));
    STDP stdp_neuron10_7 (.clk(clk), .rst(rst), .pre_spike(spike_in[7]), .post_spike(neuron10_spike), .weight(weights_neuron10[7]));
    STDP stdp_neuron10_8 (.clk(clk), .rst(rst), .pre_spike(spike_in[8]), .post_spike(neuron10_spike), .weight(weights_neuron10[8]));

// STDP learning for neuron11
STDP stdp_neuron11_0 (.clk(clk), .rst(rst), .pre_spike(spike_in[0]), .post_spike(neuron11_spike), .weight(weights_neuron11[0]));
STDP stdp_neuron11_1 (.clk(clk), .rst(rst), .pre_spike(spike_in[1]), .post_spike(neuron11_spike), .weight(weights_neuron11[1]));
STDP stdp_neuron11_2 (.clk(clk), .rst(rst), .pre_spike(spike_in[2]), .post_spike(neuron11_spike), .weight(weights_neuron11[2]));
STDP stdp_neuron11_3 (.clk(clk), .rst(rst), .pre_spike(spike_in[3]), .post_spike(neuron11_spike), .weight(weights_neuron11[3]));
STDP stdp_neuron11_4 (.clk(clk), .rst(rst), .pre_spike(spike_in[4]), .post_spike(neuron11_spike), .weight(weights_neuron11[4]));
STDP stdp_neuron11_5 (.clk(clk), .rst(rst), .pre_spike(spike_in[5]), .post_spike(neuron11_spike), .weight(weights_neuron11[5]));
STDP stdp_neuron11_6 (.clk(clk), .rst(rst), .pre_spike(spike_in[6]), .post_spike(neuron11_spike), .weight(weights_neuron11[6]));
STDP stdp_neuron11_7 (.clk(clk), .rst(rst), .pre_spike(spike_in[7]), .post_spike(neuron11_spike), .weight(weights_neuron11[7]));
STDP stdp_neuron11_8 (.clk(clk), .rst(rst), .pre_spike(spike_in[8]), .post_spike(neuron11_spike), .weight(weights_neuron11[8]));

// STDP learning for neuron12
STDP stdp_neuron12_0 (.clk(clk), .rst(rst), .pre_spike(spike_in[0]), .post_spike(neuron12_spike), .weight(weights_neuron12[0]));
STDP stdp_neuron12_1 (.clk(clk), .rst(rst), .pre_spike(spike_in[1]), .post_spike(neuron12_spike), .weight(weights_neuron12[1]));
STDP stdp_neuron12_2 (.clk(clk), .rst(rst), .pre_spike(spike_in[2]), .post_spike(neuron12_spike), .weight(weights_neuron12[2]));
STDP stdp_neuron12_3 (.clk(clk), .rst(rst), .pre_spike(spike_in[3]), .post_spike(neuron12_spike), .weight(weights_neuron12[3]));
STDP stdp_neuron12_4 (.clk(clk), .rst(rst), .pre_spike(spike_in[4]), .post_spike(neuron12_spike), .weight(weights_neuron12[4]));
STDP stdp_neuron12_5 (.clk(clk), .rst(rst), .pre_spike(spike_in[5]), .post_spike(neuron12_spike), .weight(weights_neuron12[5]));
STDP stdp_neuron12_6 (.clk(clk), .rst(rst), .pre_spike(spike_in[6]), .post_spike(neuron12_spike), .weight(weights_neuron12[6]));
STDP stdp_neuron12_7 (.clk(clk), .rst(rst), .pre_spike(spike_in[7]), .post_spike(neuron12_spike), .weight(weights_neuron12[7]));
STDP stdp_neuron12_8 (.clk(clk), .rst(rst), .pre_spike(spike_in[8]), .post_spike(neuron12_spike), .weight(weights_neuron12[8]));

initial begin
    weights_neuron10 = 9'b1_1_1_1_1_1_1_1_1; // Initializing weights to ones
    weights_neuron11 = 9'b1_1_1_1_1_1_1_1_1; // Initializing weights to ones
    weights_neuron12 = 9'b1_1_1_1_1_1_1_1_1; // Initializing weights to ones
end

endmodule