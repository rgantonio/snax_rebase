//--------------------------------
// Importing packages
//--------------------------------

import snitch_tcdm_pkg::*;
import reqrsp_pkg::*;

//--------------------------------
// Task Module
//--------------------------------
module tcdm_tasks;


    //--------------------------------
    // Requests from a single core
    //--------------------------------
    task core_request(
        // Main clock
        input  logic       clk_i,
        // Main inputs to use
        input  tcdm_addr_t addr_i,    
        input  logic       write_i,
        input  data_t      data_i,
        input  strb_t      strb_i,
        input  tcdm_user_t user_i,
        // Signals to TCDM
        output tcdm_req_t  task_req_o,
        input  tcdm_rsp_t  task_rsp_i,
    );
        

        begin
            @(clk_i); #1;
            task_req_o.q.addr  = wr_req_i[i].q.addr;
            task_req_oq.write  = 1'b1;
            task_req_o.amo     = AMONone;
            task_req_o.data    = wr_req_i[i].q.data;
            task_req_o.strb    = wr_req_i[i].q.strb;
            task_req_o.user    = wr_req_i[i].q.user;
            task_req_o.q_valid = wr_req_i[i].q_valid;
            @(task_rsp_i.q_ready); #1;
            

        end

    endtask


endmodule


req[i].q.addr  = wr_req_i[i].q.addr;
      req[i].q.write = 1'b1;
      req[i].q.amo   = wr_req_i[i].q.amo;
      req[i].q.data  = wr_req_i[i].q.data;
      req[i].q.strb  = wr_req_i[i].q.strb;
      req[i].q.user  = wr_req_i[i].q.user;
      req[i].q_valid = wr_req_i[i].q_valid;