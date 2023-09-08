module STDP(
    input clk,
    input rst,
    input pre_spike,  // Pre-synaptic spike
    input post_spike, // Post-synaptic spike
    inout weight      // Synaptic weight
);

    // Timing constants
    parameter POTENTIATE_DELAY = 10; // Example delay for potentiation
    parameter DEPRESS_DELAY = 20;    // Example delay for depression

    reg [31:0] potentiate_timer = 0;
    reg [31:0] depress_timer = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            potentiate_timer <= 0;
            depress_timer <= 0;
        end else begin
            if (pre_spike) begin
                if (post_spike & (potentiate_timer > 0)) begin
                    weight <= weight + 1'b1; // Potentiate
                end
                potentiate_timer <= POTENTIATE_DELAY;
            end else if (post_spike) begin
                if (pre_spike & (depress_timer > 0)) begin
                    weight <= weight - 1'b1; // Depress
                end
                depress_timer <= DEPRESS_DELAY;
            end else begin
                if (potentiate_timer > 0) potentiate_timer <= potentiate_timer - 1'b1;
                if (depress_timer > 0) depress_timer <= depress_timer - 1'b1;
            end
        end
    end

endmodule
