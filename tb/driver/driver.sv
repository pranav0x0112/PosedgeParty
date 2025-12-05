class driver;
  mailbox gen2drive;
  virtual intf vif;
  
  function new(virtual intf vif,mailbox gen2drive); 
    this.vif = vif;
    this.gen2drive = gen2drive;
  endfunction
  
  task main;
    repeat(3)
      
      begin
        
        transaction trans;
        
        gen2drive.get(trans);
        
        vif.d <= trans.d;
        
        vif.clk <=0;
        #5;
        vif.clk<=1;
        #5;
        
        
        trans.display("Driver");
      end
  endtask
  
endclass