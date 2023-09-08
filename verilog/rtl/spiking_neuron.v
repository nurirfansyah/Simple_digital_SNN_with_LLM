module spiking_neuron (
    input wire clk,
    input wire rst_n,
    input wire [7:0] neuron_input,
    output reg neuron_spike
);

    reg [7:0] accumulator = 8'b0;
    parameter THRESHOLD = 8'b10000000;  // For example, when the accumulator hits 128, the neuron fires

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            accumulator <= 8'b0;
            neuron_spike <= 1'b0;
        end else begin
            if (accumulator + neuron_input >= THRESHOLD) begin
                accumulator <= accumulator + neuron_input - THRESHOLD;
                neuron_spike <= 1'b1;
            end else begin
                accumulator <= accumulator + neuron_input;
                neuron_spike <= 1'b0;
            end
        end
    end

endmodule
