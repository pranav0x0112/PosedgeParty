class monitor;
  virtual intf vif;
  mailbox mon2sb;
  
  function new(virtual intf vif, mailbox mon2sb);
    this.vif     = vif;
    this.mon2sb  = mon2sb;
  endfunction
  
 task main;
    repeat(3) begin
      transaction trans;     
      
      @(posedge vif.clk);
      #1; 
      
      trans = new();         
      trans.d   = vif.d;
      trans.clk = vif.clk;
      trans.q   = vif.q;
      mon2sb.put(trans);
      trans.display("monitor");
    end
  endtask

endclass