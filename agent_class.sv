class mem_agent;
	mem_gen gen;
	mem_bfm bfm;
	mem_monitor mon;
	mem_coverage cov;

	task run();
		$display("AGENT is Running....");
		gen=new();
		bfm=new();
		mon=new();
		cov=new();
		fork
            bfm.run();
			gen.run();	
			mon.run();
			cov.run();
        join
	endtask	

endclass

