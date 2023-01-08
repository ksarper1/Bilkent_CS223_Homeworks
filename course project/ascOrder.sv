`timescale 1ns / 1ps

module ascOrder(
  input logic [2:0] r,
  input logic [2:0] c,
  input logic [2:0] w,
  input logic [3:0] R [5:0],
  input logic clk,
  output reg [3:0] R_sorted [5:0]
);
  reg [3:0] mem [5:0];

  integer i, j;

  // Read values from consecutive registers
  always @(*) begin
    for (i = 0; i < c; i++) begin
      mem[i] <= R[r + i];
    end
  end

  // Sort values in ascending order
  always @(*) begin
    for (i = 0; i < c; i++) begin
      for (j = i + 1; j < c; j++) begin
        if (mem[j] < mem[i]) begin
          reg temp = mem[i];
          mem[i] <= mem[j];
          mem[j] <= temp;
        end
      end
    end
  end

  // Write sorted values to consecutive registers
  always @(*) begin
    for (i = 0; i < c; i++) begin
      R_sorted[w + i] <= mem[i];
    end
  end

endmodule