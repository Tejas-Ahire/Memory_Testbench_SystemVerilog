class mem_sbd;
	mem_tx tx;
	int asso[int];

	task run();
		$display("SBD is Running...");
		forever begin
			mem_common::mon2sbd.get(tx);
			if(tx.wr_rd==1) asso[tx.addr]=tx.wdata;
			else begin
				if(asso[tx.addr]==tx.rdata) mem_common::matching++;
				else mem_common::misMatching++;
			end
            tx.print("MEM SBD Got it..");
		end
	endtask
endclass

