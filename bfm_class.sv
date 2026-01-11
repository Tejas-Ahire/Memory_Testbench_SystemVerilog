class mem_bfm;
	
	mem_tx tx;
    virtual mem_interface vif;

	task run();
		vif=top.pif;
		$display("BFM is Running...");
		forever begin
			mem_common::gen2bfm.get(tx);
			drive_tx(tx);
			tx.print("MEM_BFM Got it...");
			mem_common::bfmCount++;
		end
	endtask

	task drive_tx(mem_tx tx);
		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd<=tx.wr_rd;
		vif.bfm_cb.addr<=tx.addr;
        if(vif.bfm_cb.wr_rd==1)vif.bfm_cb.wdata<=tx.wdata;
		else vif.bfm_cb.wdata<=0;
		vif.bfm_cb.valid<=1;
		wait(vif.bfm_cb.ready==1);
		if(tx.wr_rd==0) begin
          	@(vif.bfm_cb);
			tx.rdata=vif.bfm_cb.rdata;
		end
		else tx.rdata=0;

		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd<=0;
		vif.bfm_cb.addr<=0;
		vif.bfm_cb.wdata<=0;
		vif.bfm_cb.valid<=0;
	endtask
endclass


