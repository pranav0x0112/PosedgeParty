`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor"
`include "scoreboard"
class environment;

  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;

  mailbox gen2drive;
  mailbox mon2sb;

  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;

    gen2drive = new();
    mon2sb    = new();

    gen = new(gen2drive);
    drv = new(vif, gen2drive);
    mon = new(vif, mon2sb);
    sb  = new(mon2sb);
  endfunction

  task run;
    fork
      gen.main();
      drv.main();
      mon.main();
      sb.main();
    join
  endtask

endclass