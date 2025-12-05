class scoreboard;
  mailbox mon2sb;
  
  function new(mailbox mon2sb);
    this.mon2sb= mon2sb;
  endfunction
  
task main;
  repeat(3
) begin
    transaction trans;
    mon2sb.get(trans);

    if (trans.q == trans.d)
      $display("result is as expected");
    else
      $error("Wrong Result");

    trans.display("scoreboard");
  end
endtask

endclass