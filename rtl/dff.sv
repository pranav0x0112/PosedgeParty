module d_ff(
  input  logic d,
  input  logic clk,
  output logic q
);

  always @(posedge clk)
    q <= d;

endmodule