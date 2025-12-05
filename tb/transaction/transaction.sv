class transaction;
  
  rand bit d;
  bit clk;
  
  bit q;
  
  function void display(string name);
    $display("-------------------------");
    $display(" %s ", name);
    $display("-------------------------");
    $display("d = %0d, clk = %0d", d, clk);
    $display("q = %0d", q);
    $display("-------------------------");
  endfunction
  
endclass