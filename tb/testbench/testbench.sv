`include "interface.sv"
`include "test"
module testbench;

  intf i_intf();

  d_ff dut(
    .d(i_intf.d),
    .clk(i_intf.clk),
    .q(i_intf.q)
  );

  test t1(i_intf);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule