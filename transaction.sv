class mem_tx;
	rand bit wr_rd;
	randc bit [`ADDR_WIDTH-1:0] addr;
	rand bit [`WIDTH-1:0] wdata;
	bit [`WIDTH-1:0] rdata;

	function void print(input string str="MEM_TX_RUNNING...");
      $display("%0t:--------------%0s--------------------",$time,str);
      $display("WR_RD: %0d",wr_rd);
      $display("ADDR: %0d",addr);
      $display("W_DATA: %0d ",wdata);
      $display("R_DATA: %0d",rdata);
      $display("....This is the end!!!!!.....");
	endfunction

endclass




