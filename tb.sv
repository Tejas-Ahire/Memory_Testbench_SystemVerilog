//typedef class mem_common;
//typedef class mem_gen;
//typedef class mem_tx;
//typedef class mem_bfm;
//typedef class mem_coverage;
//typedef class mem_monitor;
//typedef class mem_agent;
//typedef class mem_sbd;
//typedef class mem_env;

//`include "common_class.sv"
//`include "memory.sv"
//`include "transaction.sv"
//`include "gen_class.sv"
//`include "interface_class.sv"
//`include "bfm_class.sv"
//`include "coverage_class.sv"
//`include "monitor_class.sv"
//`include "agent_class.sv"
//`include "scoreBoard_class.sv"
//`include "env_class.sv"

`include "list.svh"

module top;
	mem_env env;
  	reg clk,rst;
	mem_interface pif(clk,rst);
	memory dut(.clk(pif.clk),
			   .rst(pif.rst),
			   .wr_rd(pif.wr_rd),
               .addr(pif.addr),
			   .wdata(pif.wdata),
			   .rdata(pif.rdata),
			   .valid(pif.valid),
			   .ready(pif.ready));

	always #5 clk=~clk;
  
	initial begin
		clk=0;
		rst=1;
		repeat(2)@(posedge clk);
		rst=0;
		$value$plusargs("test_name=%s",mem_common::test_name);
		$value$plusargs("N=%d",mem_common::N);
        env=new();
		env.run();
		
	end
	initial begin
		#20;
		wait(mem_common::genCount == mem_common::bfmCount);
		#50;
		if(mem_common::matching!=0 && mem_common::misMatching==0)begin
			$display("Test Passed!!!!");
			$display("Matching_Count:%0d || MisMatching_Count:%0d",mem_common::matching,mem_common::misMatching);
		end
		else begin
			$display("Test Failed!!!!");
			$display("Matching_Count:%0d || MisMatching_Count:%0d",mem_common::matching,mem_common::misMatching);	
		end
		$finish;
	end
//	initial begin
//		$dumpfile("tb.vcd");
//		$dumpvars;
//	end
endmodule



