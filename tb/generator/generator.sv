class generator;
  mailbox gen2drive;
  transaction trans;
  
  function new(mailbox gen2drive);
    this.gen2drive=gen2drive;
  endfunction
  
  task main();
    repeat(3)
      begin 
        trans=new();
        trans.randomize();
        trans.display("generator");
        gen2drive.put(trans);
      end
  endtask
endclass