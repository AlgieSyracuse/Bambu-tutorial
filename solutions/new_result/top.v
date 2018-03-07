// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.6-dev - Revision 54160dd7ca3a036f97300344dc772a94036db10f-master - Date 2018-Mar-07 07:48:02
// bambu executed with: bambu -v2 -O2 --generate-tb=/home/ubuntu/PandA-bambu/documentation/tutorial_fpl_2017/lab5/solutions/5.1/test.xml --evaluation=CYCLES --simulator=VERILATOR --pretty-print=a.c --experimental-setup=BAMBU --target-file=/home/ubuntu/PandA-bambu/documentation/tutorial_fpl_2017/lab5/solutions/5.1/xc7z045-2ffg900-VVD.xml /home/ubuntu/PandA-bambu/documentation/tutorial_fpl_2017/lab5/solutions/5.1/module.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1, value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock, reset, in1, wenable, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_SDS_BUS_BASE(clock, reset, in1, in2, in3, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, S_data_ram_size, Sin_DataRdy, out1, Sout_Rdata_ram, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_in3=1, BITSIZE_out1=1, BITSIZE_S_addr_ram=1, BITSIZE_S_Wdata_ram=8, BITSIZE_Sin_Rdata_ram=8, BITSIZE_Sout_Rdata_ram=8, BITSIZE_S_data_ram_size=1, MEMORY_INIT_file="array.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, USE_SPARSE_MEMORY=1, HIGH_LATENCY=0, BITSIZE_proxy_in1=1, BITSIZE_proxy_in2=1, BITSIZE_proxy_in3=1, BITSIZE_proxy_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  input sel_LOAD;
  input sel_STORE;
  input S_oe_ram;
  input S_we_ram;
  input [BITSIZE_S_addr_ram-1:0] S_addr_ram;
  input [BITSIZE_S_Wdata_ram-1:0] S_Wdata_ram;
  input [BITSIZE_Sin_Rdata_ram-1:0] Sin_Rdata_ram;
  input [BITSIZE_S_data_ram_size-1:0] S_data_ram_size;
  input Sin_DataRdy;
  input [BITSIZE_proxy_in1-1:0] proxy_in1;
  input [BITSIZE_proxy_in2-1:0] proxy_in2;
  input [BITSIZE_proxy_in3-1:0] proxy_in3;
  input proxy_sel_LOAD;
  input proxy_sel_STORE;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  output [BITSIZE_Sout_Rdata_ram-1:0] Sout_Rdata_ram;
  output Sout_DataRdy;
  output [BITSIZE_proxy_out1-1:0] proxy_out1;
  
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  parameter n_bytes = n_elements*(BRAM_BITSIZE/8);
  parameter n_byte_on_databus = BRAM_BITSIZE/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes%(n_byte_on_databus) == 0 ? 0 : 1);
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_elements == 1 ? 1 : $clog2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : $clog2(n_byte_on_databus);
    parameter nbits_address_space_rangesize = $clog2(address_space_rangesize);
  `else
    parameter nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : log2(n_byte_on_databus);
    parameter nbits_address_space_rangesize = log2(address_space_rangesize);
  `endif
    
  wire [nbit_read_addr-1:0] memory_addr_a;
  wire [nbit_read_addr-1:0] memory_addr_a_mem;
  reg [nbit_read_addr-1:0] memory_addr_a1 =0;
  
  wire bram_write;
  wire bram_write_mem;
  reg bram_write1 =0;
  reg [data_size-1:0] dout_a =0;
  reg [data_size-1:0] dout_a_registered =0;
  wire cs, oe_ram_cs, we_ram_cs;
  reg we_ram_cs_delayed =0;
  reg oe_ram_cs_delayed =0;
  reg oe_ram_cs_delayed_registered =0;
  reg oe_ram_cs_delayed_registered1 =0;
  wire [nbit_addr-1:0] relative_addr;
  wire [nbit_addr-1:0] tmp_addr;
  wire [data_size-1:0] din_a;
  wire [data_size-1:0] din_a_mem;
  reg [data_size-1:0] din_a1 =0;
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_elements-1);
  end
  
  assign din_a = proxy_sel_STORE ? proxy_in1 : sel_STORE ? in1 : S_Wdata_ram;
  assign bram_write = sel_STORE || proxy_sel_STORE || we_ram_cs;
  generate
    if(HIGH_LATENCY==2)
    begin
      always @ (posedge clock)
      begin
         memory_addr_a1 <= memory_addr_a;
         bram_write1 <= bram_write;
         din_a1 <= din_a;
      end
      assign memory_addr_a_mem = memory_addr_a1;
      assign bram_write_mem = bram_write1;
      assign din_a_mem = din_a1;
    end
    else
    begin
      assign memory_addr_a_mem = memory_addr_a;
      assign bram_write_mem = bram_write;
      assign din_a_mem = din_a;
    end
  endgenerate
  
  always @(posedge clock)
  begin
    if (bram_write_mem)
    begin
      memory[memory_addr_a_mem] <= din_a_mem;
    end
    if(HIGH_LATENCY==0)
    begin
      dout_a <= memory[memory_addr_a_mem];
    end
    else if(HIGH_LATENCY==1)
    begin
      dout_a_registered <= memory[memory_addr_a_mem];
      dout_a <= dout_a_registered;
    end
    else
    begin
      dout_a_registered <= memory[memory_addr_a_mem];
      dout_a <= dout_a_registered;
    end
  end
  
  assign tmp_addr = (proxy_sel_LOAD||proxy_sel_STORE) ? proxy_in2 : in2;
  
  generate
    if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0)
      assign cs = (S_addr_ram >= (address_space_begin)) && (S_addr_ram < (address_space_begin+address_space_rangesize));
    else if(PRIVATE_MEMORY==0)
      assign cs = S_addr_ram[nbit_addr-1:nbits_address_space_rangesize] == address_space_begin[nbit_addr-1:nbits_address_space_rangesize];
    else
      assign cs = 1'b0;
  endgenerate
  
  assign oe_ram_cs = S_oe_ram && cs;
  assign we_ram_cs = S_we_ram && cs;
  
  generate
    if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0)
      assign relative_addr = (sel_STORE===1'b1 || sel_LOAD===1'b1 || proxy_sel_STORE===1'b1 || proxy_sel_LOAD===1'b1) ? tmp_addr-address_space_begin[nbit_addr-1:0] : S_addr_ram-address_space_begin[nbit_addr-1:0];
    else if(PRIVATE_MEMORY==0)
      assign relative_addr = (sel_STORE===1'b1 || sel_LOAD===1'b1 || proxy_sel_STORE===1'b1 || proxy_sel_LOAD===1'b1) ? tmp_addr[nbits_address_space_rangesize-1:0] : S_addr_ram[nbits_address_space_rangesize-1:0];
    else if(USE_SPARSE_MEMORY==1)
      assign relative_addr = tmp_addr[nbits_address_space_rangesize-1:0];
    else
      assign relative_addr = tmp_addr-address_space_begin[nbit_addr-1:0];
  endgenerate
  
  generate
    if (n_elements==1)
      assign memory_addr_a = {nbit_read_addr{1'b0}};
    else
      assign memory_addr_a = relative_addr[nbit_read_addr+nbits_byte_offset-1:nbits_byte_offset];
  endgenerate
  
  assign out1 = dout_a;
  assign proxy_out1 = dout_a;
  always @(posedge clock )
  begin
    if(reset == 1'b0)
      begin
        oe_ram_cs_delayed <= 1'b0;
        if(HIGH_LATENCY != 0) oe_ram_cs_delayed_registered <= 1'b0;
        if(HIGH_LATENCY == 2) oe_ram_cs_delayed_registered1 <= 1'b0;
      end
    else
      begin
        if(HIGH_LATENCY==0)
          oe_ram_cs_delayed <= oe_ram_cs & (!oe_ram_cs_delayed | BUS_PIPELINED);
        else if(HIGH_LATENCY==1)
        begin
          oe_ram_cs_delayed_registered <= oe_ram_cs & ((!oe_ram_cs_delayed_registered & !oe_ram_cs_delayed) | BUS_PIPELINED);
          oe_ram_cs_delayed <= oe_ram_cs_delayed_registered;
        end
        else
        begin
          oe_ram_cs_delayed_registered1 <= oe_ram_cs & ((!oe_ram_cs_delayed_registered1 & !oe_ram_cs_delayed_registered) | BUS_PIPELINED);
          oe_ram_cs_delayed_registered <= oe_ram_cs_delayed_registered1;
          oe_ram_cs_delayed <= oe_ram_cs_delayed_registered;
        end
      end
  end
    
  always @(posedge clock )
  begin
    if(reset == 1'b0)
      we_ram_cs_delayed <= 1'b0;
    else
      we_ram_cs_delayed <= we_ram_cs & !we_ram_cs_delayed;
  end
  
  generate
    if(PRIVATE_MEMORY==1)
      assign Sout_Rdata_ram =Sin_Rdata_ram;
    else if (BITSIZE_Sout_Rdata_ram <= data_size)
      assign Sout_Rdata_ram = oe_ram_cs_delayed ? dout_a[BITSIZE_Sout_Rdata_ram-1:0] : Sin_Rdata_ram;
    else
      assign Sout_Rdata_ram = oe_ram_cs_delayed ? {{BITSIZE_Sout_Rdata_ram-data_size{1'b0}}, dout_a} : Sin_Rdata_ram;
  endgenerate
  
  generate
    if(PRIVATE_MEMORY==1)
      assign Sout_DataRdy = Sin_DataRdy;
    else
      assign Sout_DataRdy = oe_ram_cs_delayed | Sin_DataRdy | we_ram_cs_delayed;
  endgenerate
  
  // Add assertion here
  // psl default clock = (posedge clock);
  // psl ERROR_SDS_data_ram_size: assert never {(BRAM_BITSIZE != in3 && (sel_LOAD || sel_STORE)) || (BRAM_BITSIZE != proxy_in3 && (proxy_sel_LOAD || proxy_sel_STORE))};
  // psl ERROR_SDS_alignment: assert never {(((in2-address_space_begin) %(BRAM_BITSIZE/8) != 0) && (sel_LOAD || sel_STORE)) || (((proxy_in2-address_space_begin) %(BRAM_BITSIZE/8) != 0) && (proxy_sel_LOAD || proxy_sel_STORE))};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_SDS_BUS(clock, reset, in1, in2, in3, in4, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, S_data_ram_size, Sin_DataRdy, out1, Sout_Rdata_ram, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_in3=1, BITSIZE_out1=1, BITSIZE_S_addr_ram=1, BITSIZE_S_Wdata_ram=8, BITSIZE_Sin_Rdata_ram=8, BITSIZE_Sout_Rdata_ram=8, BITSIZE_S_data_ram_size=1, MEMORY_INIT_file="array.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, USE_SPARSE_MEMORY=1, BITSIZE_proxy_in1=1, BITSIZE_proxy_in2=1, BITSIZE_proxy_in3=1, BITSIZE_proxy_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  input in4;
  input sel_LOAD;
  input sel_STORE;
  input S_oe_ram;
  input S_we_ram;
  input [BITSIZE_S_addr_ram-1:0] S_addr_ram;
  input [BITSIZE_S_Wdata_ram-1:0] S_Wdata_ram;
  input [BITSIZE_Sin_Rdata_ram-1:0] Sin_Rdata_ram;
  input [BITSIZE_S_data_ram_size-1:0] S_data_ram_size;
  input Sin_DataRdy;
  input [BITSIZE_proxy_in1-1:0] proxy_in1;
  input [BITSIZE_proxy_in2-1:0] proxy_in2;
  input [BITSIZE_proxy_in3-1:0] proxy_in3;
  input proxy_sel_LOAD;
  input proxy_sel_STORE;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  output [BITSIZE_Sout_Rdata_ram-1:0] Sout_Rdata_ram;
  output Sout_DataRdy;
  output [BITSIZE_proxy_out1-1:0] proxy_out1;
  ARRAY_1D_STD_BRAM_SDS_BUS_BASE #(.BITSIZE_in1(BITSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .BITSIZE_out1(BITSIZE_out1), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .MEMORY_INIT_file(MEMORY_INIT_file), .n_elements(n_elements), .data_size(data_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .HIGH_LATENCY(0), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .BITSIZE_proxy_out1(BITSIZE_proxy_out1)) ARRAY_1D_STD_BRAM_instance (.out1(out1), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .proxy_out1(proxy_out1), .clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .sel_LOAD(sel_LOAD & in4), .sel_STORE(sel_STORE & in4), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1, out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Alessandro Nacci <alenacci@gmail.com>, Gianluca Durelli <durellinux@gmail.com>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module PRINTF_VECTOR_BOOL32_INT8_INT32(clock, reset, start_port, in1, in2, in3, sel_printf, sel___builtin_printf, Min_oe_ram, Min_we_ram, Min_addr_ram, M_Rdata_ram, Min_Wdata_ram, Min_data_ram_size, M_DataRdy, done_port, out1, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size);
  parameter BITSIZE_out1=1, BITSIZE_Min_addr_ram=1, BITSIZE_Mout_addr_ram=1, BITSIZE_M_Rdata_ram=8, BITSIZE_Min_Wdata_ram=8, BITSIZE_Mout_Wdata_ram=8, BITSIZE_Min_data_ram_size=1, BITSIZE_Mout_data_ram_size=1, BITSIZE_in1=32, BITSIZE_in2=8, BITSIZE_in3=32;
  // IN
  input clock;
  input reset;
  input start_port;
  input [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  input sel_printf;
  input sel___builtin_printf;
  input Min_oe_ram;
  input Min_we_ram;
  input [BITSIZE_Min_addr_ram-1:0] Min_addr_ram;
  input [BITSIZE_M_Rdata_ram-1:0] M_Rdata_ram;
  input [BITSIZE_Min_Wdata_ram-1:0] Min_Wdata_ram;
  input [BITSIZE_Min_data_ram_size-1:0] Min_data_ram_size;
  input M_DataRdy;
  // OUT
  output done_port;
  output signed [BITSIZE_out1-1:0] out1;
  output Mout_oe_ram;
  output Mout_we_ram;
  output [BITSIZE_Mout_addr_ram-1:0] Mout_addr_ram;
  output [BITSIZE_Mout_Wdata_ram-1:0] Mout_Wdata_ram;
  output [BITSIZE_Mout_data_ram_size-1:0] Mout_data_ram_size;
  // synthesis translate_off
  function real bits32_to_real64;
    input [31:0] fin1;
    reg [7:0] exponent1;
    reg is_exp_zero;
    reg is_all_ones;
    reg [10:0] exp_tmp;
    reg [63:0] fout1;
  begin
    exponent1 = fin1[30:23];
    is_exp_zero = exponent1 == 8'd0;
    is_all_ones = exponent1 == {8{1'b1}};
    exp_tmp = {3'd0, exponent1} + 11'd896;
    fout1[63] = fin1[31];
    fout1[62:52] = is_exp_zero ? 11'd0 : (is_all_ones ? {11{1'b1}} : exp_tmp);
    fout1[51:29] = fin1[22:0];
    fout1[28:0] = 29'd0;
    bits32_to_real64 = $bitstoreal(fout1);
  end
  endfunction
  // synthesis translate_on
  reg [BITSIZE_Mout_addr_ram-1:0] _present_pointer =0;
  reg [BITSIZE_Mout_addr_ram-1:0] _next_pointer;
  reg [BITSIZE_Mout_addr_ram-1:0] _present_pointer1 =0;
  reg [BITSIZE_Mout_addr_ram-1:0] _next_pointer1;
  reg done_port;
  reg Mout_oe_ram;
  reg Mout_we_ram;
  reg [BITSIZE_Mout_addr_ram-1:0] Mout_addr_ram;
  reg [BITSIZE_Mout_Wdata_ram-1:0] Mout_Wdata_ram;
  reg [BITSIZE_Mout_data_ram_size-1:0] Mout_data_ram_size;
  
  parameter [2:0] S_0 = 3'd0,
    S_1 = 3'd1,
    S_2 = 3'd2,
    S_3 = 3'd3,
    S_4 = 3'd4,
    S_5 = 3'd5,
    S_6 = 3'd6,
    S_7 = 3'd7;
  reg [2:0] _present_state =0;
  reg [2:0] _next_state;
  reg [2:0] _present_selector =0;
  reg [2:0] _next_selector;
  reg [63:0] data1;
  reg [7:0] _present_data2 =0;
  reg [7:0] _next_data2;
  reg [7:0] data1_size;
  reg write_done;
  
    always @(posedge clock )
      if (reset == 1'b0)
        begin
          _present_state <= S_0;
          _present_pointer <= {BITSIZE_Mout_addr_ram{1'b0}};
          _present_pointer1 <= {BITSIZE_Mout_addr_ram{1'b0}};
          _present_selector <=3'd0;
          _present_data2 <= 8'b0;
        end
      else
        begin
          _present_state <= _next_state;
          _present_pointer <= _next_pointer;
          _present_pointer1 <= _next_pointer1;
          _present_selector <= _next_selector;
          _present_data2 <= _next_data2;
        end
  
    always @(_present_state or _present_pointer or _present_pointer1 or _present_selector or start_port or M_DataRdy or Min_we_ram or Min_oe_ram or Min_Wdata_ram or Min_addr_ram or Min_data_ram_size or in1 or in2 or in3 or _present_data2 or M_Rdata_ram)
        begin
          Mout_we_ram = Min_we_ram;
          Mout_Wdata_ram = Min_Wdata_ram;
          Mout_oe_ram=Min_oe_ram;
          Mout_addr_ram=Min_addr_ram;
          Mout_data_ram_size=Min_data_ram_size;
          done_port = 1'b0;
          _next_state = _present_state;
          _next_pointer = _present_pointer;
          _next_pointer1 = _present_pointer1;
          _next_selector = _present_selector;
          _next_data2 = _present_data2;
          case (_present_selector)
              3'd1:
               begin
                 data1=in1;
                 data1_size=BITSIZE_in1;
               end
              3'd2:
               begin
                 data1=in2;
                 data1_size=BITSIZE_in2;
               end
              3'd4:
               begin
                 data1=in3;
                 data1_size=BITSIZE_in3;
               end
              default:
               begin
                 data1 = 64'b0;
                 data1_size = 8'b0;
               end
            endcase
          case (_present_state)
            S_0:
              if(start_port)
                begin
                  _next_pointer=0;
                  _next_pointer1=0;
                  _next_state=S_1;  
                  _next_selector=3'd2;
                 end
              
           S_1:
             begin
               Mout_addr_ram[BITSIZE_Mout_addr_ram-1:0]=in1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer;
               Mout_data_ram_size={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram=1'b1;
               if(M_DataRdy)
               begin
                  _next_data2 = M_Rdata_ram[7:0];
                  _next_state=S_2;
  // synthesis translate_off
                  write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_2:
             begin
               _next_pointer=_present_pointer+1'd1;
               if((_present_data2!=8'd0)&&(_present_data2!=8'd37))
               begin
  // synthesis translate_off
                 if(!write_done)
                 begin
                   $write("%c",_present_data2);
                 write_done=1'b1;
                 end
  // synthesis translate_on
                 _next_state=S_1;
               end
               else if(_present_data2==8'd37)
                 _next_state=S_3;
               else if(_present_data2==8'd0)
               begin
                 done_port = 1'b1;
                 _next_state=S_0;
               end
             end
           S_3:
             begin
               Mout_addr_ram=in1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer;
               Mout_data_ram_size={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram=1'b1;
               if(M_DataRdy)
               begin
                  _next_data2 = M_Rdata_ram[7:0];
                  _next_state=S_5;
  // synthesis translate_off
                  write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_5 :
             begin
               _next_state=S_6;
               _next_pointer=_present_pointer+1'd1;
               case(_present_data2)
                 8'd37: //%%
                 begin
                   _next_state=S_1;
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("%c",8'd37);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd99: //Char
                 begin
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("%c",data1[7:0]);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd100: //Decimal %d
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Decimal precision not supported (d) %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd105: //Decimal %i
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Decimal precision not supported (i) %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd101: //Exponential %e
                 begin
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd69: //Exponential %E
                 begin
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd102: //Float %f
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd70: //Float %F
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd103: //Float %g
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd71: //Float %G
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd111: //Octal
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Octal precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd112: //%p
                   begin
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("0x%0h",data1);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd115: //String
                 begin
                   _next_state=S_7;
                   _next_pointer1=0;
                 end
                 8'd117: //unsigned int %u TO BE FIXED
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Unsigned precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd120: //Hex %x
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd88: //Hex %X
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd97: //Hex float %a
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 default:
                   _next_state=S_3;
               endcase
             end
           S_6:
             begin
               _next_selector=_present_selector<<1;
               _next_state=S_1;
             end
           S_7:
             begin
               Mout_addr_ram=data1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer1;
               Mout_data_ram_size={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram=1'b1;
               if(M_DataRdy)
               begin
                 _next_data2 = M_Rdata_ram[7:0];
                 _next_state=S_4;
  // synthesis translate_off
                 write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_4:
             begin
               _next_pointer1=_present_pointer1+1'd1;
               if(_present_data2!=8'd0)
               begin
  // synthesis translate_off
                 if(!write_done)
                 begin
                   $write("%c",_present_data2);
                   write_done=1'b1;
                 end
  // synthesis translate_on
                 _next_state=S_7;
               end
               else
                 _next_state=S_6;
             end
        endcase
     end
  

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Alessandro Nacci <alenacci@gmail.com>, Gianluca Durelli <durellinux@gmail.com>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module PRINTF_VECTOR_BOOL32_INT8_INT8(clock, reset, start_port, in1, in2, in3, sel_printf, sel___builtin_printf, Min_oe_ram, Min_we_ram, Min_addr_ram, M_Rdata_ram, Min_Wdata_ram, Min_data_ram_size, M_DataRdy, done_port, out1, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size);
  parameter BITSIZE_out1=1, BITSIZE_Min_addr_ram=1, BITSIZE_Mout_addr_ram=1, BITSIZE_M_Rdata_ram=8, BITSIZE_Min_Wdata_ram=8, BITSIZE_Mout_Wdata_ram=8, BITSIZE_Min_data_ram_size=1, BITSIZE_Mout_data_ram_size=1, BITSIZE_in1=32, BITSIZE_in2=8, BITSIZE_in3=8;
  // IN
  input clock;
  input reset;
  input start_port;
  input [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  input sel_printf;
  input sel___builtin_printf;
  input Min_oe_ram;
  input Min_we_ram;
  input [BITSIZE_Min_addr_ram-1:0] Min_addr_ram;
  input [BITSIZE_M_Rdata_ram-1:0] M_Rdata_ram;
  input [BITSIZE_Min_Wdata_ram-1:0] Min_Wdata_ram;
  input [BITSIZE_Min_data_ram_size-1:0] Min_data_ram_size;
  input M_DataRdy;
  // OUT
  output done_port;
  output signed [BITSIZE_out1-1:0] out1;
  output Mout_oe_ram;
  output Mout_we_ram;
  output [BITSIZE_Mout_addr_ram-1:0] Mout_addr_ram;
  output [BITSIZE_Mout_Wdata_ram-1:0] Mout_Wdata_ram;
  output [BITSIZE_Mout_data_ram_size-1:0] Mout_data_ram_size;
  // synthesis translate_off
  function real bits32_to_real64;
    input [31:0] fin1;
    reg [7:0] exponent1;
    reg is_exp_zero;
    reg is_all_ones;
    reg [10:0] exp_tmp;
    reg [63:0] fout1;
  begin
    exponent1 = fin1[30:23];
    is_exp_zero = exponent1 == 8'd0;
    is_all_ones = exponent1 == {8{1'b1}};
    exp_tmp = {3'd0, exponent1} + 11'd896;
    fout1[63] = fin1[31];
    fout1[62:52] = is_exp_zero ? 11'd0 : (is_all_ones ? {11{1'b1}} : exp_tmp);
    fout1[51:29] = fin1[22:0];
    fout1[28:0] = 29'd0;
    bits32_to_real64 = $bitstoreal(fout1);
  end
  endfunction
  // synthesis translate_on
  reg [BITSIZE_Mout_addr_ram-1:0] _present_pointer =0;
  reg [BITSIZE_Mout_addr_ram-1:0] _next_pointer;
  reg [BITSIZE_Mout_addr_ram-1:0] _present_pointer1 =0;
  reg [BITSIZE_Mout_addr_ram-1:0] _next_pointer1;
  reg done_port;
  reg Mout_oe_ram;
  reg Mout_we_ram;
  reg [BITSIZE_Mout_addr_ram-1:0] Mout_addr_ram;
  reg [BITSIZE_Mout_Wdata_ram-1:0] Mout_Wdata_ram;
  reg [BITSIZE_Mout_data_ram_size-1:0] Mout_data_ram_size;
  
  parameter [2:0] S_0 = 3'd0,
    S_1 = 3'd1,
    S_2 = 3'd2,
    S_3 = 3'd3,
    S_4 = 3'd4,
    S_5 = 3'd5,
    S_6 = 3'd6,
    S_7 = 3'd7;
  reg [2:0] _present_state =0;
  reg [2:0] _next_state;
  reg [2:0] _present_selector =0;
  reg [2:0] _next_selector;
  reg [63:0] data1;
  reg [7:0] _present_data2 =0;
  reg [7:0] _next_data2;
  reg [7:0] data1_size;
  reg write_done;
  
    always @(posedge clock )
      if (reset == 1'b0)
        begin
          _present_state <= S_0;
          _present_pointer <= {BITSIZE_Mout_addr_ram{1'b0}};
          _present_pointer1 <= {BITSIZE_Mout_addr_ram{1'b0}};
          _present_selector <=3'd0;
          _present_data2 <= 8'b0;
        end
      else
        begin
          _present_state <= _next_state;
          _present_pointer <= _next_pointer;
          _present_pointer1 <= _next_pointer1;
          _present_selector <= _next_selector;
          _present_data2 <= _next_data2;
        end
  
    always @(_present_state or _present_pointer or _present_pointer1 or _present_selector or start_port or M_DataRdy or Min_we_ram or Min_oe_ram or Min_Wdata_ram or Min_addr_ram or Min_data_ram_size or in1 or in2 or in3 or _present_data2 or M_Rdata_ram)
        begin
          Mout_we_ram = Min_we_ram;
          Mout_Wdata_ram = Min_Wdata_ram;
          Mout_oe_ram=Min_oe_ram;
          Mout_addr_ram=Min_addr_ram;
          Mout_data_ram_size=Min_data_ram_size;
          done_port = 1'b0;
          _next_state = _present_state;
          _next_pointer = _present_pointer;
          _next_pointer1 = _present_pointer1;
          _next_selector = _present_selector;
          _next_data2 = _present_data2;
          case (_present_selector)
              3'd1:
               begin
                 data1=in1;
                 data1_size=BITSIZE_in1;
               end
              3'd2:
               begin
                 data1=in2;
                 data1_size=BITSIZE_in2;
               end
              3'd4:
               begin
                 data1=in3;
                 data1_size=BITSIZE_in3;
               end
              default:
               begin
                 data1 = 64'b0;
                 data1_size = 8'b0;
               end
            endcase
          case (_present_state)
            S_0:
              if(start_port)
                begin
                  _next_pointer=0;
                  _next_pointer1=0;
                  _next_state=S_1;  
                  _next_selector=3'd2;
                 end
              
           S_1:
             begin
               Mout_addr_ram[BITSIZE_Mout_addr_ram-1:0]=in1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer;
               Mout_data_ram_size={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram=1'b1;
               if(M_DataRdy)
               begin
                  _next_data2 = M_Rdata_ram[7:0];
                  _next_state=S_2;
  // synthesis translate_off
                  write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_2:
             begin
               _next_pointer=_present_pointer+1'd1;
               if((_present_data2!=8'd0)&&(_present_data2!=8'd37))
               begin
  // synthesis translate_off
                 if(!write_done)
                 begin
                   $write("%c",_present_data2);
                 write_done=1'b1;
                 end
  // synthesis translate_on
                 _next_state=S_1;
               end
               else if(_present_data2==8'd37)
                 _next_state=S_3;
               else if(_present_data2==8'd0)
               begin
                 done_port = 1'b1;
                 _next_state=S_0;
               end
             end
           S_3:
             begin
               Mout_addr_ram=in1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer;
               Mout_data_ram_size={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram=1'b1;
               if(M_DataRdy)
               begin
                  _next_data2 = M_Rdata_ram[7:0];
                  _next_state=S_5;
  // synthesis translate_off
                  write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_5 :
             begin
               _next_state=S_6;
               _next_pointer=_present_pointer+1'd1;
               case(_present_data2)
                 8'd37: //%%
                 begin
                   _next_state=S_1;
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("%c",8'd37);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd99: //Char
                 begin
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("%c",data1[7:0]);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd100: //Decimal %d
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Decimal precision not supported (d) %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd105: //Decimal %i
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$signed(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Decimal precision not supported (i) %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd101: //Exponential %e
                 begin
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd69: //Exponential %E
                 begin
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%e",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd102: //Float %f
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd70: //Float %F
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20f",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd103: //Float %g
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd71: //Float %G
                 begin
                   if(data1_size==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",$bitstoreal(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%20.20g",bits32_to_real64(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Floating point precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 end
                 8'd111: //Octal
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0o",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Octal precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd112: //%p
                   begin
  // synthesis translate_off
                   if(!write_done)
                   begin
                     $write("0x%0h",data1);
                     write_done=1'b1;
                   end
  // synthesis translate_on
                 end
                 8'd115: //String
                 begin
                   _next_state=S_7;
                   _next_pointer1=0;
                 end
                 8'd117: //unsigned int %u TO BE FIXED
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[31:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[15:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0d",$unsigned(data1[7:0]));
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Unsigned precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd120: //Hex %x
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd88: //Hex %X
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 8'd97: //Hex float %a
                   if(data1_size ==8'd64)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd32)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[31:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd16)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[15:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else if(data1_size ==8'd8)
                   begin
  // synthesis translate_off
                     if(!write_done)
                     begin
                       $write("%0h",data1[7:0]);
                       write_done=1'b1;
                     end
  // synthesis translate_on
                   end
                   else
                   begin
  // synthesis translate_off
                     $display("ERROR - Hex precision not supported %d", data1_size);
                     $finish;
  // synthesis translate_on
                   end
                 default:
                   _next_state=S_3;
               endcase
             end
           S_6:
             begin
               _next_selector=_present_selector<<1;
               _next_state=S_1;
             end
           S_7:
             begin
               Mout_addr_ram=data1[BITSIZE_Mout_addr_ram-1:0]+_present_pointer1;
               Mout_data_ram_size={{BITSIZE_Mout_data_ram_size-4{1'b0}}, 4'd8};
               Mout_oe_ram=1'b1;
               if(M_DataRdy)
               begin
                 _next_data2 = M_Rdata_ram[7:0];
                 _next_state=S_4;
  // synthesis translate_off
                 write_done=1'b0;
  // synthesis translate_on
               end
             end
           S_4:
             begin
               _next_pointer1=_present_pointer1+1'd1;
               if(_present_data2!=8'd0)
               begin
  // synthesis translate_off
                 if(!write_done)
                 begin
                   $write("%c",_present_data2);
                   write_done=1'b1;
                 end
  // synthesis translate_on
                 _next_state=S_7;
               end
               else
                 _next_state=S_6;
             end
        endcase
     end
  

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module eq_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module mult_expr_FU(clock, in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, PIPE_PARAMETER=0;
  // IN
  input clock;
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg signed [BITSIZE_in1-1:0] in1_in;
      reg signed [BITSIZE_in2-1:0] in2_in;
      wire signed [BITSIZE_out1-1:0] mult_res;
      reg signed [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ne_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IIdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRL(clock, in1, in2, in3, in4, sel_LOAD, sel_STORE, out1, Min_oe_ram, Mout_oe_ram, Min_we_ram, Mout_we_ram, Min_addr_ram, Mout_addr_ram, M_Rdata_ram, Min_Wdata_ram, Mout_Wdata_ram, Min_data_ram_size, Mout_data_ram_size, M_DataRdy);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_in3=1, BITSIZE_out1=1, BITSIZE_Min_addr_ram=1, BITSIZE_Mout_addr_ram=1, BITSIZE_M_Rdata_ram=8, BITSIZE_Min_Wdata_ram=8, BITSIZE_Mout_Wdata_ram=8, BITSIZE_Min_data_ram_size=1, BITSIZE_Mout_data_ram_size=1;
  // IN
  input clock;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  input in4;
  input sel_LOAD;
  input sel_STORE;
  input Min_oe_ram;
  input Min_we_ram;
  input [BITSIZE_Min_addr_ram-1:0] Min_addr_ram;
  input [BITSIZE_M_Rdata_ram-1:0] M_Rdata_ram;
  input [BITSIZE_Min_Wdata_ram-1:0] Min_Wdata_ram;
  input [BITSIZE_Min_data_ram_size-1:0] Min_data_ram_size;
  input M_DataRdy;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  output Mout_oe_ram;
  output Mout_we_ram;
  output [BITSIZE_Mout_addr_ram-1:0] Mout_addr_ram;
  output [BITSIZE_Mout_Wdata_ram-1:0] Mout_Wdata_ram;
  output [BITSIZE_Mout_data_ram_size-1:0] Mout_data_ram_size;
  
  wire  [BITSIZE_in2-1:0] tmp_addr;
  wire int_sel_LOAD;
  wire int_sel_STORE;
  assign tmp_addr = in2;
  assign Mout_addr_ram = (int_sel_LOAD || int_sel_STORE) ? tmp_addr : Min_addr_ram;
  assign Mout_oe_ram = int_sel_LOAD ? 1'b1 : Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE ? 1'b1 : Min_we_ram;
  assign out1 = M_Rdata_ram[BITSIZE_out1-1:0];
  assign Mout_Wdata_ram = int_sel_STORE ? in1 : Min_Wdata_ram;
  assign Mout_data_ram_size = int_sel_STORE || int_sel_LOAD ? in3[BITSIZE_in3-1:0] : Min_data_ram_size;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  // Add assertion here
  // psl default clock = (posedge clock);
  // psl ERROR_LOAD_Min_oe_ram: assert never {sel_LOAD && Min_oe_ram};
  // psl ERROR_STORE_Min_we_ram: assert never {sel_STORE && Min_we_ram};
  // psl ERROR_STORE_LOAD: assert never {sel_STORE && sel_LOAD};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module __builtin_putchar(clock, start_port, c, sel_putchar, sel___builtin_putchar, done_port, return_port);
  // IN
  input clock;
  input start_port;
  input signed [31:0] c;
  input sel_putchar;
  input sel___builtin_putchar;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  reg done_port;
  // synthesis translate_off
  always @(posedge clock)
    if(start_port == 1'b1)
    begin
      $write("%c",c[7:0]);
    end
  // synthesis translate_on
  always @(posedge clock) done_port <= start_port;
  assign return_port=c;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ne_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bus_merger(in1, out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  function [BITSIZE_out1-1:0] merge;
    input [BITSIZE_in1*PORTSIZE_in1-1:0] m;
    reg [BITSIZE_out1-1:0] res;
    integer i1;
  begin
    res={BITSIZE_in1{1'b0}};
    for(i1 = 0; i1 < PORTSIZE_in1; i1 = i1 + 1)
    begin
      res = res | m[i1*BITSIZE_in1 +:BITSIZE_in1];
    end
    merge = res;
  end
  endfunction
  
  assign out1 = merge(in1);
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel, in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL descrition for __builtin_puts
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___builtin_puts(clock, reset, in_port_s, return_port, M_Rdata_ram, M_DataRdy, Min_oe_ram, Min_we_ram, Min_addr_ram, Min_Wdata_ram, Min_data_ram_size, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size, fuselector_BMEMORY_CTRL_10_i0_LOAD, fuselector_BMEMORY_CTRL_10_i0_STORE, selector_IN_UNBOUNDED___builtin_puts_2112_2157, selector_IN_UNBOUNDED___builtin_puts_2112_2161, selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0, selector_MUX_16_reg_1_0_0_0, selector_MUX_7___builtin_putchar_11_i1_0_0_0, fuselector___builtin_putchar_11_i0_putchar, fuselector___builtin_putchar_11_i0___builtin_putchar, fuselector___builtin_putchar_11_i1_putchar, fuselector___builtin_putchar_11_i1___builtin_putchar, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, OUT_CONDITION___builtin_puts_2112_2145, OUT_CONDITION___builtin_puts_2112_2193, OUT_UNBOUNDED___builtin_puts_2112_2157, OUT_UNBOUNDED___builtin_puts_2112_2161);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_s;
  input [7:0] M_Rdata_ram;
  input M_DataRdy;
  input Min_oe_ram;
  input Min_we_ram;
  input [7:0] Min_addr_ram;
  input [7:0] Min_Wdata_ram;
  input [3:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRL_10_i0_LOAD;
  input fuselector_BMEMORY_CTRL_10_i0_STORE;
  input selector_IN_UNBOUNDED___builtin_puts_2112_2157;
  input selector_IN_UNBOUNDED___builtin_puts_2112_2161;
  input selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0;
  input selector_MUX_16_reg_1_0_0_0;
  input selector_MUX_7___builtin_putchar_11_i1_0_0_0;
  input fuselector___builtin_putchar_11_i0_putchar;
  input fuselector___builtin_putchar_11_i0___builtin_putchar;
  input fuselector___builtin_putchar_11_i1_putchar;
  input fuselector___builtin_putchar_11_i1___builtin_putchar;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  // OUT
  output signed [31:0] return_port;
  output Mout_oe_ram;
  output Mout_we_ram;
  output [7:0] Mout_addr_ram;
  output [7:0] Mout_Wdata_ram;
  output [3:0] Mout_data_ram_size;
  output OUT_CONDITION___builtin_puts_2112_2145;
  output OUT_CONDITION___builtin_puts_2112_2193;
  output OUT_UNBOUNDED___builtin_puts_2112_2157;
  output OUT_UNBOUNDED___builtin_puts_2112_2161;
  // Component and signal declarations
  wire [7:0] out_BMEMORY_CTRL_10_i0_BMEMORY_CTRL_10_i0;
  wire signed [7:0] out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167;
  wire [7:0] out_MUX_0_BMEMORY_CTRL_10_i0_1_0_0;
  wire [31:0] out_MUX_16_reg_1_0_0_0;
  wire [31:0] out_MUX_7___builtin_putchar_11_i1_0_0_0;
  wire out_const_0;
  wire [4:0] out_const_1;
  wire [4:0] out_const_2;
  wire out_const_3;
  wire [7:0] out_conv_in_port_s_32_8;
  wire signed [31:0] out_conv_out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167_I_8_I_32;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [3:0] out_conv_out_const_1_5_4;
  wire signed [31:0] out_conv_out_const_2_I_5_I_32;
  wire [7:0] out_conv_out_reg_1_reg_1_32_8;
  wire signed [31:0] out_conv_out_reg_2_reg_2_I_8_I_32;
  wire out_ne_expr_FU_8_0_8_12_i0_fu___builtin_puts_2112_25622;
  wire out_ne_expr_FU_8_0_8_12_i1_fu___builtin_puts_2112_25624;
  wire out_read_cond_FU_2_i0_fu___builtin_puts_2112_2145;
  wire out_read_cond_FU_9_i0_fu___builtin_puts_2112_2193;
  wire [7:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire [7:0] out_reg_2_reg_2;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_13_i0_fu___builtin_puts_2112_2179;
  wire s_done_fu___builtin_puts_2112_2157;
  wire s_done_fu___builtin_puts_2112_2161;
  wire [7:0] sig_in_bus_mergerMout_Wdata_ram2_0;
  wire [7:0] sig_in_bus_mergerMout_addr_ram4_0;
  wire [3:0] sig_in_bus_mergerMout_data_ram_size3_0;
  wire sig_in_bus_mergerMout_oe_ram0_0;
  wire sig_in_bus_mergerMout_we_ram1_0;
  wire [7:0] sig_out_bus_mergerMout_Wdata_ram2_;
  wire [7:0] sig_out_bus_mergerMout_addr_ram4_;
  wire [3:0] sig_out_bus_mergerMout_data_ram_size3_;
  wire sig_out_bus_mergerMout_oe_ram0_;
  wire sig_out_bus_mergerMout_we_ram1_;
  
  BMEMORY_CTRL #(.BITSIZE_in1(1), .BITSIZE_in2(8), .BITSIZE_in3(4), .BITSIZE_out1(8), .BITSIZE_Min_addr_ram(8), .BITSIZE_Mout_addr_ram(8), .BITSIZE_M_Rdata_ram(8), .BITSIZE_Min_Wdata_ram(8), .BITSIZE_Mout_Wdata_ram(8), .BITSIZE_Min_data_ram_size(4), .BITSIZE_Mout_data_ram_size(4)) BMEMORY_CTRL_10_i0 (.out1(out_BMEMORY_CTRL_10_i0_BMEMORY_CTRL_10_i0), .Mout_oe_ram(sig_in_bus_mergerMout_oe_ram0_0), .Mout_we_ram(sig_in_bus_mergerMout_we_ram1_0), .Mout_addr_ram(sig_in_bus_mergerMout_addr_ram4_0), .Mout_Wdata_ram(sig_in_bus_mergerMout_Wdata_ram2_0), .Mout_data_ram_size(sig_in_bus_mergerMout_data_ram_size3_0), .clock(clock), .in1(1'b0), .in2(out_MUX_0_BMEMORY_CTRL_10_i0_1_0_0), .in3(out_conv_out_const_1_5_4), .in4(out_const_3), .sel_LOAD(fuselector_BMEMORY_CTRL_10_i0_LOAD), .sel_STORE(fuselector_BMEMORY_CTRL_10_i0_STORE), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .M_Rdata_ram(M_Rdata_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size), .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_out1(8)) MUX_0_BMEMORY_CTRL_10_i0_1_0_0 (.out1(out_MUX_0_BMEMORY_CTRL_10_i0_1_0_0), .sel(selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0), .in1(out_conv_out_reg_1_reg_1_32_8), .in2(out_conv_in_port_s_32_8));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_16_reg_1_0_0_0 (.out1(out_MUX_16_reg_1_0_0_0), .sel(selector_MUX_16_reg_1_0_0_0), .in1(in_port_s), .in2(out_ui_pointer_plus_expr_FU_32_0_32_13_i0_fu___builtin_puts_2112_2179));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_7___builtin_putchar_11_i1_0_0_0 (.out1(out_MUX_7___builtin_putchar_11_i1_0_0_0), .sel(selector_MUX_7___builtin_putchar_11_i1_0_0_0), .in1(out_conv_out_reg_2_reg_2_I_8_I_32), .in2(out_conv_out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167_I_8_I_32));
  bus_merger #(.BITSIZE_in1(8), .PORTSIZE_in1(1), .BITSIZE_out1(8)) bus_mergerMout_Wdata_ram2_ (.out1(sig_out_bus_mergerMout_Wdata_ram2_), .in1({sig_in_bus_mergerMout_Wdata_ram2_0}));
  bus_merger #(.BITSIZE_in1(8), .PORTSIZE_in1(1), .BITSIZE_out1(8)) bus_mergerMout_addr_ram4_ (.out1(sig_out_bus_mergerMout_addr_ram4_), .in1({sig_in_bus_mergerMout_addr_ram4_0}));
  bus_merger #(.BITSIZE_in1(4), .PORTSIZE_in1(1), .BITSIZE_out1(4)) bus_mergerMout_data_ram_size3_ (.out1(sig_out_bus_mergerMout_data_ram_size3_), .in1({sig_in_bus_mergerMout_data_ram_size3_0}));
  bus_merger #(.BITSIZE_in1(1), .PORTSIZE_in1(1), .BITSIZE_out1(1)) bus_mergerMout_oe_ram0_ (.out1(sig_out_bus_mergerMout_oe_ram0_), .in1({sig_in_bus_mergerMout_oe_ram0_0}));
  bus_merger #(.BITSIZE_in1(1), .PORTSIZE_in1(1), .BITSIZE_out1(1)) bus_mergerMout_we_ram1_ (.out1(sig_out_bus_mergerMout_we_ram1_), .in1({sig_in_bus_mergerMout_we_ram1_0}));
  constant_value #(.BITSIZE_out1(1), .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(5), .value(5'b01000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(5), .value(5'b01010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(1), .value(1'b1)) const_3 (.out1(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(8)) conv_in_port_s_32_8 (.out1(out_conv_in_port_s_32_8), .in1(in_port_s));
  IIdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167_I_8_I_32 (.out1(out_conv_out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167_I_8_I_32), .in1(out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167));
  IIdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32), .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(4)) conv_out_const_1_5_4 (.out1(out_conv_out_const_1_5_4), .in1(out_const_1));
  IIdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(32)) conv_out_const_2_I_5_I_32 (.out1(out_conv_out_const_2_I_5_I_32), .in1(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(8)) conv_out_reg_1_reg_1_32_8 (.out1(out_conv_out_reg_1_reg_1_32_8), .in1(out_reg_1_reg_1));
  IIdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_reg_2_reg_2_I_8_I_32 (.out1(out_conv_out_reg_2_reg_2_I_8_I_32), .in1(out_reg_2_reg_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu___builtin_puts_2112_2145 (.out1(out_read_cond_FU_2_i0_fu___builtin_puts_2112_2145), .in1(out_ne_expr_FU_8_0_8_12_i0_fu___builtin_puts_2112_25622));
  __builtin_putchar fu___builtin_puts_2112_2157 (.done_port(s_done_fu___builtin_puts_2112_2157), .clock(clock), .start_port(selector_IN_UNBOUNDED___builtin_puts_2112_2157), .c(out_conv_out_const_2_I_5_I_32), .sel_putchar(fuselector___builtin_putchar_11_i0_putchar), .sel___builtin_putchar(fuselector___builtin_putchar_11_i0___builtin_putchar));
  __builtin_putchar fu___builtin_puts_2112_2161 (.done_port(s_done_fu___builtin_puts_2112_2161), .clock(clock), .start_port(selector_IN_UNBOUNDED___builtin_puts_2112_2161), .c(out_MUX_7___builtin_putchar_11_i1_0_0_0), .sel_putchar(fuselector___builtin_putchar_11_i1_putchar), .sel___builtin_putchar(fuselector___builtin_putchar_11_i1___builtin_putchar));
  IIdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) fu___builtin_puts_2112_2167 (.out1(out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167), .in1(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(32), .LSB_PARAMETER(0)) fu___builtin_puts_2112_2179 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_13_i0_fu___builtin_puts_2112_2179), .in1(out_reg_1_reg_1), .in2(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu___builtin_puts_2112_2193 (.out1(out_read_cond_FU_9_i0_fu___builtin_puts_2112_2193), .in1(out_ne_expr_FU_8_0_8_12_i1_fu___builtin_puts_2112_25624));
  ne_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu___builtin_puts_2112_25622 (.out1(out_ne_expr_FU_8_0_8_12_i0_fu___builtin_puts_2112_25622), .in1(out_BMEMORY_CTRL_10_i0_BMEMORY_CTRL_10_i0), .in2(out_const_0));
  ne_expr_FU #(.BITSIZE_in1(8), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu___builtin_puts_2112_25624 (.out1(out_ne_expr_FU_8_0_8_12_i1_fu___builtin_puts_2112_25624), .in1(out_BMEMORY_CTRL_10_i0_BMEMORY_CTRL_10_i0), .in2(out_const_0));
  register_SE #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_0 (.out1(out_reg_0_reg_0), .clock(clock), .reset(reset), .in1(out_BMEMORY_CTRL_10_i0_BMEMORY_CTRL_10_i0), .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1), .clock(clock), .reset(reset), .in1(out_MUX_16_reg_1_0_0_0), .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(8), .BITSIZE_out1(8)) reg_2 (.out1(out_reg_2_reg_2), .clock(clock), .reset(reset), .in1(out_IIdata_converter_FU_8_i0_fu___builtin_puts_2112_2167), .wenable(wrenable_reg_2));
  // io-signal post fix
  assign return_port = out_conv_out_const_0_I_1_I_32;
  assign Mout_oe_ram = sig_out_bus_mergerMout_oe_ram0_;
  assign Mout_we_ram = sig_out_bus_mergerMout_we_ram1_;
  assign Mout_addr_ram = sig_out_bus_mergerMout_addr_ram4_;
  assign Mout_Wdata_ram = sig_out_bus_mergerMout_Wdata_ram2_;
  assign Mout_data_ram_size = sig_out_bus_mergerMout_data_ram_size3_;
  assign OUT_CONDITION___builtin_puts_2112_2145 = out_read_cond_FU_2_i0_fu___builtin_puts_2112_2145;
  assign OUT_CONDITION___builtin_puts_2112_2193 = out_read_cond_FU_9_i0_fu___builtin_puts_2112_2193;
  assign OUT_UNBOUNDED___builtin_puts_2112_2157 = s_done_fu___builtin_puts_2112_2157;
  assign OUT_UNBOUNDED___builtin_puts_2112_2161 = s_done_fu___builtin_puts_2112_2161;

endmodule

// FSM based controller descrition for __builtin_puts
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___builtin_puts(done_port, fuselector_BMEMORY_CTRL_10_i0_LOAD, fuselector_BMEMORY_CTRL_10_i0_STORE, selector_IN_UNBOUNDED___builtin_puts_2112_2157, selector_IN_UNBOUNDED___builtin_puts_2112_2161, selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0, selector_MUX_16_reg_1_0_0_0, selector_MUX_7___builtin_putchar_11_i1_0_0_0, fuselector___builtin_putchar_11_i0_putchar, fuselector___builtin_putchar_11_i0___builtin_putchar, fuselector___builtin_putchar_11_i1_putchar, fuselector___builtin_putchar_11_i1___builtin_putchar, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, OUT_CONDITION___builtin_puts_2112_2145, OUT_CONDITION___builtin_puts_2112_2193, OUT_UNBOUNDED___builtin_puts_2112_2157, OUT_UNBOUNDED___builtin_puts_2112_2161, clock, reset, start_port);
  // IN
  input OUT_CONDITION___builtin_puts_2112_2145;
  input OUT_CONDITION___builtin_puts_2112_2193;
  input OUT_UNBOUNDED___builtin_puts_2112_2157;
  input OUT_UNBOUNDED___builtin_puts_2112_2161;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRL_10_i0_LOAD;
  output fuselector_BMEMORY_CTRL_10_i0_STORE;
  output selector_IN_UNBOUNDED___builtin_puts_2112_2157;
  output selector_IN_UNBOUNDED___builtin_puts_2112_2161;
  output selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0;
  output selector_MUX_16_reg_1_0_0_0;
  output selector_MUX_7___builtin_putchar_11_i1_0_0_0;
  output fuselector___builtin_putchar_11_i0_putchar;
  output fuselector___builtin_putchar_11_i0___builtin_putchar;
  output fuselector___builtin_putchar_11_i1_putchar;
  output fuselector___builtin_putchar_11_i1___builtin_putchar;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  parameter [8:0] S_0 = 9'b000000001,
    S_1 = 9'b000000010,
    S_5 = 9'b000100000,
    S_6 = 9'b001000000,
    S_7 = 9'b010000000,
    S_8 = 9'b100000000,
    S_2 = 9'b000000100,
    S_3 = 9'b000001000,
    S_4 = 9'b000010000;
  reg [8:0] _present_state, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRL_10_i0_LOAD;
  reg fuselector_BMEMORY_CTRL_10_i0_STORE;
  reg selector_IN_UNBOUNDED___builtin_puts_2112_2157;
  reg selector_IN_UNBOUNDED___builtin_puts_2112_2161;
  reg selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0;
  reg selector_MUX_16_reg_1_0_0_0;
  reg selector_MUX_7___builtin_putchar_11_i1_0_0_0;
  reg fuselector___builtin_putchar_11_i0_putchar;
  reg fuselector___builtin_putchar_11_i0___builtin_putchar;
  reg fuselector___builtin_putchar_11_i1_putchar;
  reg fuselector___builtin_putchar_11_i1___builtin_putchar;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRL_10_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRL_10_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED___builtin_puts_2112_2157 = 1'b0;
    selector_IN_UNBOUNDED___builtin_puts_2112_2161 = 1'b0;
    selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0 = 1'b0;
    selector_MUX_16_reg_1_0_0_0 = 1'b0;
    selector_MUX_7___builtin_putchar_11_i1_0_0_0 = 1'b0;
    fuselector___builtin_putchar_11_i0_putchar = 1'b0;
    fuselector___builtin_putchar_11_i0___builtin_putchar = 1'b0;
    fuselector___builtin_putchar_11_i1_putchar = 1'b0;
    fuselector___builtin_putchar_11_i1___builtin_putchar = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          fuselector_BMEMORY_CTRL_10_i0_LOAD = 1'b1;
          _next_state = S_1;
        end
        else
          _next_state = S_0;
      
      S_1 :
        begin
          selector_MUX_16_reg_1_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          if (OUT_CONDITION___builtin_puts_2112_2145 == 1'b1)
            begin
              _next_state = S_5;
            end
          else
            begin
              _next_state = S_2;
              selector_MUX_16_reg_1_0_0_0 = 1'b0;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
        end
      S_5 :
        begin
          selector_IN_UNBOUNDED___builtin_puts_2112_2161 = 1'b1;
          fuselector___builtin_putchar_11_i1___builtin_putchar = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_UNBOUNDED___builtin_puts_2112_2161 == 1'b0)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_7;
            end
        end
      S_6 :
        begin
          selector_MUX_7___builtin_putchar_11_i1_0_0_0 = 1'b1;
          fuselector___builtin_putchar_11_i1___builtin_putchar = 1'b1;
          if (OUT_UNBOUNDED___builtin_puts_2112_2161 == 1'b0)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_7;
            end
        end
      S_7 :
        begin
          fuselector_BMEMORY_CTRL_10_i0_LOAD = 1'b1;
          selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          wrenable_reg_0 = 1'b1;
          if (OUT_CONDITION___builtin_puts_2112_2193 == 1'b1)
            begin
              _next_state = S_5;
            end
          else
            begin
              _next_state = S_2;
              wrenable_reg_0 = 1'b0;
            end
        end
      S_2 :
        begin
          selector_IN_UNBOUNDED___builtin_puts_2112_2157 = 1'b1;
          fuselector___builtin_putchar_11_i0___builtin_putchar = 1'b1;
          if (OUT_UNBOUNDED___builtin_puts_2112_2157 == 1'b0)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_4;
              done_port = 1'b1;
            end
        end
      S_3 :
        begin
          fuselector___builtin_putchar_11_i0___builtin_putchar = 1'b1;
          if (OUT_UNBOUNDED___builtin_puts_2112_2157 == 1'b0)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_4;
              done_port = 1'b1;
            end
        end
      S_4 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
          done_port = 1'bX;
          fuselector_BMEMORY_CTRL_10_i0_LOAD = 1'bX;
          fuselector_BMEMORY_CTRL_10_i0_STORE = 1'bX;
          selector_IN_UNBOUNDED___builtin_puts_2112_2157 = 1'bX;
          selector_IN_UNBOUNDED___builtin_puts_2112_2161 = 1'bX;
          selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0 = 1'bX;
          selector_MUX_16_reg_1_0_0_0 = 1'bX;
          selector_MUX_7___builtin_putchar_11_i1_0_0_0 = 1'bX;
          fuselector___builtin_putchar_11_i0_putchar = 1'bX;
          fuselector___builtin_putchar_11_i0___builtin_putchar = 1'bX;
          fuselector___builtin_putchar_11_i1_putchar = 1'bX;
          fuselector___builtin_putchar_11_i1___builtin_putchar = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_2 = 1'bX;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock, reset, in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for __builtin_puts
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __builtin_puts(clock, reset, start_port, done_port, s, return_port, M_Rdata_ram, M_DataRdy, Min_oe_ram, Min_we_ram, Min_addr_ram, Min_Wdata_ram, Min_data_ram_size, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] s;
  input [7:0] M_Rdata_ram;
  input M_DataRdy;
  input Min_oe_ram;
  input Min_we_ram;
  input [7:0] Min_addr_ram;
  input [7:0] Min_Wdata_ram;
  input [3:0] Min_data_ram_size;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output Mout_oe_ram;
  output Mout_we_ram;
  output [7:0] Mout_addr_ram;
  output [7:0] Mout_Wdata_ram;
  output [3:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION___builtin_puts_2112_2145;
  wire OUT_CONDITION___builtin_puts_2112_2193;
  wire OUT_UNBOUNDED___builtin_puts_2112_2157;
  wire OUT_UNBOUNDED___builtin_puts_2112_2161;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRL_10_i0_LOAD;
  wire fuselector_BMEMORY_CTRL_10_i0_STORE;
  wire fuselector___builtin_putchar_11_i0___builtin_putchar;
  wire fuselector___builtin_putchar_11_i0_putchar;
  wire fuselector___builtin_putchar_11_i1___builtin_putchar;
  wire fuselector___builtin_putchar_11_i1_putchar;
  wire selector_IN_UNBOUNDED___builtin_puts_2112_2157;
  wire selector_IN_UNBOUNDED___builtin_puts_2112_2161;
  wire selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0;
  wire selector_MUX_16_reg_1_0_0_0;
  wire selector_MUX_7___builtin_putchar_11_i1_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  
  controller___builtin_puts Controller_i (.done_port(done_delayed_REG_signal_in), .fuselector_BMEMORY_CTRL_10_i0_LOAD(fuselector_BMEMORY_CTRL_10_i0_LOAD), .fuselector_BMEMORY_CTRL_10_i0_STORE(fuselector_BMEMORY_CTRL_10_i0_STORE), .selector_IN_UNBOUNDED___builtin_puts_2112_2157(selector_IN_UNBOUNDED___builtin_puts_2112_2157), .selector_IN_UNBOUNDED___builtin_puts_2112_2161(selector_IN_UNBOUNDED___builtin_puts_2112_2161), .selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0(selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0), .selector_MUX_16_reg_1_0_0_0(selector_MUX_16_reg_1_0_0_0), .selector_MUX_7___builtin_putchar_11_i1_0_0_0(selector_MUX_7___builtin_putchar_11_i1_0_0_0), .fuselector___builtin_putchar_11_i0_putchar(fuselector___builtin_putchar_11_i0_putchar), .fuselector___builtin_putchar_11_i0___builtin_putchar(fuselector___builtin_putchar_11_i0___builtin_putchar), .fuselector___builtin_putchar_11_i1_putchar(fuselector___builtin_putchar_11_i1_putchar), .fuselector___builtin_putchar_11_i1___builtin_putchar(fuselector___builtin_putchar_11_i1___builtin_putchar), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2), .OUT_CONDITION___builtin_puts_2112_2145(OUT_CONDITION___builtin_puts_2112_2145), .OUT_CONDITION___builtin_puts_2112_2193(OUT_CONDITION___builtin_puts_2112_2193), .OUT_UNBOUNDED___builtin_puts_2112_2157(OUT_UNBOUNDED___builtin_puts_2112_2157), .OUT_UNBOUNDED___builtin_puts_2112_2161(OUT_UNBOUNDED___builtin_puts_2112_2161), .clock(clock), .reset(reset), .start_port(start_port));
  datapath___builtin_puts Datapath_i (.return_port(return_port), .Mout_oe_ram(Mout_oe_ram), .Mout_we_ram(Mout_we_ram), .Mout_addr_ram(Mout_addr_ram), .Mout_Wdata_ram(Mout_Wdata_ram), .Mout_data_ram_size(Mout_data_ram_size), .OUT_CONDITION___builtin_puts_2112_2145(OUT_CONDITION___builtin_puts_2112_2145), .OUT_CONDITION___builtin_puts_2112_2193(OUT_CONDITION___builtin_puts_2112_2193), .OUT_UNBOUNDED___builtin_puts_2112_2157(OUT_UNBOUNDED___builtin_puts_2112_2157), .OUT_UNBOUNDED___builtin_puts_2112_2161(OUT_UNBOUNDED___builtin_puts_2112_2161), .clock(clock), .reset(reset), .in_port_s(s), .M_Rdata_ram(M_Rdata_ram), .M_DataRdy(M_DataRdy), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size), .fuselector_BMEMORY_CTRL_10_i0_LOAD(fuselector_BMEMORY_CTRL_10_i0_LOAD), .fuselector_BMEMORY_CTRL_10_i0_STORE(fuselector_BMEMORY_CTRL_10_i0_STORE), .selector_IN_UNBOUNDED___builtin_puts_2112_2157(selector_IN_UNBOUNDED___builtin_puts_2112_2157), .selector_IN_UNBOUNDED___builtin_puts_2112_2161(selector_IN_UNBOUNDED___builtin_puts_2112_2161), .selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0(selector_MUX_0_BMEMORY_CTRL_10_i0_1_0_0), .selector_MUX_16_reg_1_0_0_0(selector_MUX_16_reg_1_0_0_0), .selector_MUX_7___builtin_putchar_11_i1_0_0_0(selector_MUX_7___builtin_putchar_11_i1_0_0_0), .fuselector___builtin_putchar_11_i0_putchar(fuselector___builtin_putchar_11_i0_putchar), .fuselector___builtin_putchar_11_i0___builtin_putchar(fuselector___builtin_putchar_11_i0___builtin_putchar), .fuselector___builtin_putchar_11_i1_putchar(fuselector___builtin_putchar_11_i1_putchar), .fuselector___builtin_putchar_11_i1___builtin_putchar(fuselector___builtin_putchar_11_i1___builtin_putchar), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2));
  flipflop_AR #(.BITSIZE_in1(1), .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out), .clock(clock), .reset(reset), .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_SIGNED_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_UNSIGNED_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2017 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// Datapath RTL descrition for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_main(clock, reset, return_port, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, S_data_ram_size, M_Rdata_ram, M_DataRdy, Min_oe_ram, Min_we_ram, Min_addr_ram, Min_Wdata_ram, Min_data_ram_size, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size, Sin_Rdata_ram, Sin_DataRdy, Sout_Rdata_ram, Sout_DataRdy, selector_IN_UNBOUNDED_main_25437_25490, selector_IN_UNBOUNDED_main_25437_25553, selector_IN_UNBOUNDED_main_25437_25564, selector_MUX_11___builtin_puts_29_i0_0_0_0, selector_MUX_28_reg_2_0_0_0, selector_MUX_30_reg_4_0_0_0, selector_MUX_31_reg_5_0_0_0, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, OUT_CONDITION_main_25437_25543, OUT_CONDITION_main_25437_25554, OUT_CONDITION_main_25437_25577, OUT_UNBOUNDED_main_25437_25490, OUT_UNBOUNDED_main_25437_25553, OUT_UNBOUNDED_main_25437_25564);
  parameter MEM_var_25582_25437=64, MEM_var_25584_25437=128;
  // IN
  input clock;
  input reset;
  input S_oe_ram;
  input S_we_ram;
  input [7:0] S_addr_ram;
  input [7:0] S_Wdata_ram;
  input [3:0] S_data_ram_size;
  input [7:0] M_Rdata_ram;
  input M_DataRdy;
  input Min_oe_ram;
  input Min_we_ram;
  input [7:0] Min_addr_ram;
  input [7:0] Min_Wdata_ram;
  input [3:0] Min_data_ram_size;
  input [7:0] Sin_Rdata_ram;
  input Sin_DataRdy;
  input selector_IN_UNBOUNDED_main_25437_25490;
  input selector_IN_UNBOUNDED_main_25437_25553;
  input selector_IN_UNBOUNDED_main_25437_25564;
  input selector_MUX_11___builtin_puts_29_i0_0_0_0;
  input selector_MUX_28_reg_2_0_0_0;
  input selector_MUX_30_reg_4_0_0_0;
  input selector_MUX_31_reg_5_0_0_0;
  input fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf;
  input fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf;
  input fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf;
  input fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  // OUT
  output signed [31:0] return_port;
  output Mout_oe_ram;
  output Mout_we_ram;
  output [7:0] Mout_addr_ram;
  output [7:0] Mout_Wdata_ram;
  output [3:0] Mout_data_ram_size;
  output [7:0] Sout_Rdata_ram;
  output Sout_DataRdy;
  output OUT_CONDITION_main_25437_25543;
  output OUT_CONDITION_main_25437_25554;
  output OUT_CONDITION_main_25437_25577;
  output OUT_UNBOUNDED_main_25437_25490;
  output OUT_UNBOUNDED_main_25437_25553;
  output OUT_UNBOUNDED_main_25437_25564;
  // Component and signal declarations
  wire [31:0] out_MUX_11___builtin_puts_29_i0_0_0_0;
  wire [3:0] out_MUX_28_reg_2_0_0_0;
  wire [31:0] out_MUX_30_reg_4_0_0_0;
  wire [31:0] out_MUX_31_reg_5_0_0_0;
  wire signed [4:0] out_UIdata_converter_FU_18_i0_fu_main_25437_25519;
  wire [31:0] out_UUdata_converter_FU_5_i0_fu_main_25437_25596;
  wire [31:0] out_addr_expr_FU_4_i0_fu_main_25437_25613;
  wire [31:0] out_addr_expr_FU_6_i0_fu_main_25437_25620;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire out_const_2;
  wire [3:0] out_const_3;
  wire [1:0] out_const_4;
  wire [31:0] out_const_5;
  wire [7:0] out_const_6;
  wire [7:0] out_const_7;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire signed [7:0] out_conv_out_const_1_I_2_I_8;
  wire [31:0] out_conv_out_const_6_8_32;
  wire [31:0] out_conv_out_const_7_8_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_5_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_2_ASSIGN_SIGNED_FU_i_assign_1_I_2_32;
  wire signed [7:0] out_conv_out_reg_3_reg_3_I_5_I_8;
  wire [3:0] out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_4;
  wire out_eq_expr_FU_32_0_32_22_i0_fu_main_25437_25626;
  wire signed [4:0] out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0;
  wire signed [1:0] out_i_assign_conn_obj_2_ASSIGN_SIGNED_FU_i_assign_1;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_23_i0_fu_main_25437_25542;
  wire signed [31:0] out_plus_expr_FU_32_0_32_24_i0_fu_main_25437_25541;
  wire out_read_cond_FU_12_i0_fu_main_25437_25543;
  wire out_read_cond_FU_13_i0_fu_main_25437_25554;
  wire out_read_cond_FU_19_i0_fu_main_25437_25577;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire [3:0] out_reg_2_reg_2;
  wire [4:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire out_reg_6_reg_6;
  wire [0:0] out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2;
  wire out_ui_eq_expr_FU_8_0_8_25_i0_fu_main_25437_25630;
  wire out_ui_ne_expr_FU_8_0_8_26_i0_fu_main_25437_25628;
  wire [3:0] out_ui_plus_expr_FU_8_0_8_27_i0_fu_main_25437_25523;
  wire [3:0] out_ui_plus_expr_FU_8_0_8_28_i0_fu_main_25437_25535;
  wire s_done_fu_main_25437_25490;
  wire s_done_fu_main_25437_25553;
  wire s_done_fu_main_25437_25564;
  wire [7:0] sig_in_bus_mergerMout_Wdata_ram3_0;
  wire [7:0] sig_in_bus_mergerMout_Wdata_ram3_1;
  wire [7:0] sig_in_bus_mergerMout_Wdata_ram3_2;
  wire [7:0] sig_in_bus_mergerMout_addr_ram2_0;
  wire [7:0] sig_in_bus_mergerMout_addr_ram2_1;
  wire [7:0] sig_in_bus_mergerMout_addr_ram2_2;
  wire [3:0] sig_in_bus_mergerMout_data_ram_size4_0;
  wire [3:0] sig_in_bus_mergerMout_data_ram_size4_1;
  wire [3:0] sig_in_bus_mergerMout_data_ram_size4_2;
  wire sig_in_bus_mergerMout_oe_ram0_0;
  wire sig_in_bus_mergerMout_oe_ram0_1;
  wire sig_in_bus_mergerMout_oe_ram0_2;
  wire sig_in_bus_mergerMout_we_ram1_0;
  wire sig_in_bus_mergerMout_we_ram1_1;
  wire sig_in_bus_mergerMout_we_ram1_2;
  wire sig_in_bus_mergerSout_DataRdy6_0;
  wire sig_in_bus_mergerSout_DataRdy6_1;
  wire [7:0] sig_in_bus_mergerSout_Rdata_ram5_0;
  wire [7:0] sig_in_bus_mergerSout_Rdata_ram5_1;
  wire [7:0] sig_out_bus_mergerMout_Wdata_ram3_;
  wire [7:0] sig_out_bus_mergerMout_addr_ram2_;
  wire [3:0] sig_out_bus_mergerMout_data_ram_size4_;
  wire sig_out_bus_mergerMout_oe_ram0_;
  wire sig_out_bus_mergerMout_we_ram1_;
  wire sig_out_bus_mergerSout_DataRdy6_;
  wire [7:0] sig_out_bus_mergerSout_Rdata_ram5_;
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(5), .BITSIZE_out1(5)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0), .in1(out_UIdata_converter_FU_18_i0_fu_main_25437_25519));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(2), .BITSIZE_out1(2)) ASSIGN_SIGNED_FU_i_assign_1 (.out1(out_i_assign_conn_obj_2_ASSIGN_SIGNED_FU_i_assign_1), .in1(out_const_1));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_2 (.out1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2), .in1(out_const_2));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_11___builtin_puts_29_i0_0_0_0 (.out1(out_MUX_11___builtin_puts_29_i0_0_0_0), .sel(selector_MUX_11___builtin_puts_29_i0_0_0_0), .in1(out_reg_0_reg_0), .in2(out_UUdata_converter_FU_5_i0_fu_main_25437_25596));
  MUX_GATE #(.BITSIZE_in1(4), .BITSIZE_in2(4), .BITSIZE_out1(4)) MUX_28_reg_2_0_0_0 (.out1(out_MUX_28_reg_2_0_0_0), .sel(selector_MUX_28_reg_2_0_0_0), .in1(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_4), .in2(out_ui_plus_expr_FU_8_0_8_28_i0_fu_main_25437_25535));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_30_reg_4_0_0_0 (.out1(out_MUX_30_reg_4_0_0_0), .sel(selector_MUX_30_reg_4_0_0_0), .in1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_5_32), .in2(out_plus_expr_FU_32_0_32_24_i0_fu_main_25437_25541));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_31_reg_5_0_0_0 (.out1(out_MUX_31_reg_5_0_0_0), .sel(selector_MUX_31_reg_5_0_0_0), .in1(out_conv_out_i_assign_conn_obj_2_ASSIGN_SIGNED_FU_i_assign_1_I_2_32), .in2(out_mult_expr_FU_32_32_32_0_23_i0_fu_main_25437_25542));
  ARRAY_1D_STD_BRAM_SDS_BUS #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_in3(4), .BITSIZE_out1(8), .BITSIZE_S_addr_ram(8), .BITSIZE_S_Wdata_ram(8), .BITSIZE_Sin_Rdata_ram(8), .BITSIZE_Sout_Rdata_ram(8), .BITSIZE_S_data_ram_size(4), .MEMORY_INIT_file("array_ref_25582.mem"), .n_elements(45), .data_size(8), .address_space_begin(MEM_var_25582_25437), .address_space_rangesize(64), .BUS_PIPELINED(1), .BRAM_BITSIZE(8), .PRIVATE_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(8), .BITSIZE_proxy_in2(8), .BITSIZE_proxy_in3(4), .BITSIZE_proxy_out1(8)) array_25582_0 (.Sout_Rdata_ram(sig_in_bus_mergerSout_Rdata_ram5_1), .Sout_DataRdy(sig_in_bus_mergerSout_DataRdy6_1), .clock(clock), .reset(reset), .in1(8'b00000000), .in2(8'b00000000), .in3(4'b0000), .in4(1'b0), .sel_LOAD(1'b0), .sel_STORE(1'b0), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(8'b00000000), .proxy_in2(8'b00000000), .proxy_in3(4'b0000), .proxy_sel_LOAD(1'b0), .proxy_sel_STORE(1'b0));
  ARRAY_1D_STD_BRAM_SDS_BUS #(.BITSIZE_in1(8), .BITSIZE_in2(8), .BITSIZE_in3(4), .BITSIZE_out1(8), .BITSIZE_S_addr_ram(8), .BITSIZE_S_Wdata_ram(8), .BITSIZE_Sin_Rdata_ram(8), .BITSIZE_Sout_Rdata_ram(8), .BITSIZE_S_data_ram_size(4), .MEMORY_INIT_file("array_ref_25584.mem"), .n_elements(24), .data_size(8), .address_space_begin(MEM_var_25584_25437), .address_space_rangesize(64), .BUS_PIPELINED(1), .BRAM_BITSIZE(8), .PRIVATE_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(8), .BITSIZE_proxy_in2(8), .BITSIZE_proxy_in3(4), .BITSIZE_proxy_out1(8)) array_25584_0 (.Sout_Rdata_ram(sig_in_bus_mergerSout_Rdata_ram5_0), .Sout_DataRdy(sig_in_bus_mergerSout_DataRdy6_0), .clock(clock), .reset(reset), .in1(8'b00000000), .in2(8'b00000000), .in3(4'b0000), .in4(1'b0), .sel_LOAD(1'b0), .sel_STORE(1'b0), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(8'b00000000), .proxy_in2(8'b00000000), .proxy_in3(4'b0000), .proxy_sel_LOAD(1'b0), .proxy_sel_STORE(1'b0));
  bus_merger #(.BITSIZE_in1(8), .PORTSIZE_in1(3), .BITSIZE_out1(8)) bus_mergerMout_Wdata_ram3_ (.out1(sig_out_bus_mergerMout_Wdata_ram3_), .in1({sig_in_bus_mergerMout_Wdata_ram3_2, sig_in_bus_mergerMout_Wdata_ram3_1, sig_in_bus_mergerMout_Wdata_ram3_0}));
  bus_merger #(.BITSIZE_in1(8), .PORTSIZE_in1(3), .BITSIZE_out1(8)) bus_mergerMout_addr_ram2_ (.out1(sig_out_bus_mergerMout_addr_ram2_), .in1({sig_in_bus_mergerMout_addr_ram2_2, sig_in_bus_mergerMout_addr_ram2_1, sig_in_bus_mergerMout_addr_ram2_0}));
  bus_merger #(.BITSIZE_in1(4), .PORTSIZE_in1(3), .BITSIZE_out1(4)) bus_mergerMout_data_ram_size4_ (.out1(sig_out_bus_mergerMout_data_ram_size4_), .in1({sig_in_bus_mergerMout_data_ram_size4_2, sig_in_bus_mergerMout_data_ram_size4_1, sig_in_bus_mergerMout_data_ram_size4_0}));
  bus_merger #(.BITSIZE_in1(1), .PORTSIZE_in1(3), .BITSIZE_out1(1)) bus_mergerMout_oe_ram0_ (.out1(sig_out_bus_mergerMout_oe_ram0_), .in1({sig_in_bus_mergerMout_oe_ram0_2, sig_in_bus_mergerMout_oe_ram0_1, sig_in_bus_mergerMout_oe_ram0_0}));
  bus_merger #(.BITSIZE_in1(1), .PORTSIZE_in1(3), .BITSIZE_out1(1)) bus_mergerMout_we_ram1_ (.out1(sig_out_bus_mergerMout_we_ram1_), .in1({sig_in_bus_mergerMout_we_ram1_2, sig_in_bus_mergerMout_we_ram1_1, sig_in_bus_mergerMout_we_ram1_0}));
  bus_merger #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(1)) bus_mergerSout_DataRdy6_ (.out1(sig_out_bus_mergerSout_DataRdy6_), .in1({sig_in_bus_mergerSout_DataRdy6_1, sig_in_bus_mergerSout_DataRdy6_0}));
  bus_merger #(.BITSIZE_in1(8), .PORTSIZE_in1(2), .BITSIZE_out1(8)) bus_mergerSout_Rdata_ram5_ (.out1(sig_out_bus_mergerSout_Rdata_ram5_), .in1({sig_in_bus_mergerSout_Rdata_ram5_1, sig_in_bus_mergerSout_Rdata_ram5_0}));
  constant_value #(.BITSIZE_out1(1), .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2), .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(1), .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4), .value(4'b1000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(2), .value(2'b11)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(32), .value(32'b11111111111111111111111111111111)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(8), .value(MEM_var_25584_25437)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(8), .value(MEM_var_25582_25437)) const_7 (.out1(out_const_7));
  IIdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32), .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(2), .BITSIZE_out1(8)) conv_out_const_1_I_2_I_8 (.out1(out_conv_out_const_1_I_2_I_8), .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_const_6_8_32 (.out1(out_conv_out_const_6_8_32), .in1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_const_7_8_32 (.out1(out_conv_out_const_7_8_32), .in1(out_const_7));
  IUdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_5_32 (.out1(out_conv_out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0_I_5_32), .in1(out_i_assign_conn_obj_1_ASSIGN_SIGNED_FU_i_assign_0));
  IUdata_converter_FU #(.BITSIZE_in1(2), .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_2_ASSIGN_SIGNED_FU_i_assign_1_I_2_32 (.out1(out_conv_out_i_assign_conn_obj_2_ASSIGN_SIGNED_FU_i_assign_1_I_2_32), .in1(out_i_assign_conn_obj_2_ASSIGN_SIGNED_FU_i_assign_1));
  IIdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(8)) conv_out_reg_3_reg_3_I_5_I_8 (.out1(out_conv_out_reg_3_reg_3_I_5_I_8), .in1(out_reg_3_reg_3));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(4)) conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_4 (.out1(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2_1_4), .in1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_2));
  __builtin_puts fu_main_25437_25490 (.done_port(s_done_fu_main_25437_25490), .Mout_oe_ram(sig_in_bus_mergerMout_oe_ram0_0), .Mout_we_ram(sig_in_bus_mergerMout_we_ram1_2), .Mout_addr_ram(sig_in_bus_mergerMout_addr_ram2_2), .Mout_Wdata_ram(sig_in_bus_mergerMout_Wdata_ram3_2), .Mout_data_ram_size(sig_in_bus_mergerMout_data_ram_size4_2), .clock(clock), .reset(reset), .start_port(selector_IN_UNBOUNDED_main_25437_25490), .s(out_MUX_11___builtin_puts_29_i0_0_0_0), .M_Rdata_ram(M_Rdata_ram), .M_DataRdy(M_DataRdy), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size));
  UIdata_converter_FU #(.BITSIZE_in1(4), .BITSIZE_out1(5)) fu_main_25437_25519 (.out1(out_UIdata_converter_FU_18_i0_fu_main_25437_25519), .in1(out_ui_plus_expr_FU_8_0_8_27_i0_fu_main_25437_25523));
  ui_plus_expr_FU #(.BITSIZE_in1(4), .BITSIZE_in2(32), .BITSIZE_out1(4)) fu_main_25437_25523 (.out1(out_ui_plus_expr_FU_8_0_8_27_i0_fu_main_25437_25523), .in1(out_reg_2_reg_2), .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(4), .BITSIZE_in2(1), .BITSIZE_out1(4)) fu_main_25437_25535 (.out1(out_ui_plus_expr_FU_8_0_8_28_i0_fu_main_25437_25535), .in1(out_reg_2_reg_2), .in2(out_const_2));
  plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(32)) fu_main_25437_25541 (.out1(out_plus_expr_FU_32_0_32_24_i0_fu_main_25437_25541), .in1(out_reg_4_reg_4), .in2(out_const_4));
  mult_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PIPE_PARAMETER(0)) fu_main_25437_25542 (.out1(out_mult_expr_FU_32_32_32_0_23_i0_fu_main_25437_25542), .clock(clock), .in1(out_reg_5_reg_5), .in2(out_reg_4_reg_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_25437_25543 (.out1(out_read_cond_FU_12_i0_fu_main_25437_25543), .in1(out_eq_expr_FU_32_0_32_22_i0_fu_main_25437_25626));
  PRINTF_VECTOR_BOOL32_INT8_INT32 #(.BITSIZE_out1(1), .BITSIZE_Min_addr_ram(8), .BITSIZE_Mout_addr_ram(8), .BITSIZE_M_Rdata_ram(8), .BITSIZE_Min_Wdata_ram(8), .BITSIZE_Mout_Wdata_ram(8), .BITSIZE_Min_data_ram_size(4), .BITSIZE_Mout_data_ram_size(4), .BITSIZE_in1(32), .BITSIZE_in2(8), .BITSIZE_in3(32)) fu_main_25437_25553 (.done_port(s_done_fu_main_25437_25553), .Mout_oe_ram(sig_in_bus_mergerMout_oe_ram0_2), .Mout_we_ram(sig_in_bus_mergerMout_we_ram1_1), .Mout_addr_ram(sig_in_bus_mergerMout_addr_ram2_1), .Mout_Wdata_ram(sig_in_bus_mergerMout_Wdata_ram3_1), .Mout_data_ram_size(sig_in_bus_mergerMout_data_ram_size4_1), .clock(clock), .reset(reset), .start_port(selector_IN_UNBOUNDED_main_25437_25553), .in1(out_reg_1_reg_1), .in2(out_conv_out_reg_3_reg_3_I_5_I_8), .in3(out_reg_5_reg_5), .sel_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf), .sel___builtin_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .M_Rdata_ram(M_Rdata_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size), .M_DataRdy(M_DataRdy));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_25437_25554 (.out1(out_read_cond_FU_13_i0_fu_main_25437_25554), .in1(out_reg_6_reg_6));
  PRINTF_VECTOR_BOOL32_INT8_INT8 #(.BITSIZE_out1(1), .BITSIZE_Min_addr_ram(8), .BITSIZE_Mout_addr_ram(8), .BITSIZE_M_Rdata_ram(8), .BITSIZE_Min_Wdata_ram(8), .BITSIZE_Mout_Wdata_ram(8), .BITSIZE_Min_data_ram_size(4), .BITSIZE_Mout_data_ram_size(4), .BITSIZE_in1(32), .BITSIZE_in2(8), .BITSIZE_in3(8)) fu_main_25437_25564 (.done_port(s_done_fu_main_25437_25564), .Mout_oe_ram(sig_in_bus_mergerMout_oe_ram0_1), .Mout_we_ram(sig_in_bus_mergerMout_we_ram1_0), .Mout_addr_ram(sig_in_bus_mergerMout_addr_ram2_0), .Mout_Wdata_ram(sig_in_bus_mergerMout_Wdata_ram3_0), .Mout_data_ram_size(sig_in_bus_mergerMout_data_ram_size4_0), .clock(clock), .reset(reset), .start_port(selector_IN_UNBOUNDED_main_25437_25564), .in1(out_reg_1_reg_1), .in2(out_conv_out_reg_3_reg_3_I_5_I_8), .in3(out_conv_out_const_1_I_2_I_8), .sel_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf), .sel___builtin_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .M_Rdata_ram(M_Rdata_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size), .M_DataRdy(M_DataRdy));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_25437_25577 (.out1(out_read_cond_FU_19_i0_fu_main_25437_25577), .in1(out_ui_eq_expr_FU_8_0_8_25_i0_fu_main_25437_25630));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_25437_25596 (.out1(out_UUdata_converter_FU_5_i0_fu_main_25437_25596), .in1(out_addr_expr_FU_4_i0_fu_main_25437_25613));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_25437_25613 (.out1(out_addr_expr_FU_4_i0_fu_main_25437_25613), .in1(out_conv_out_const_7_8_32));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_25437_25620 (.out1(out_addr_expr_FU_6_i0_fu_main_25437_25620), .in1(out_conv_out_const_6_8_32));
  eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_main_25437_25626 (.out1(out_eq_expr_FU_32_0_32_22_i0_fu_main_25437_25626), .in1(out_plus_expr_FU_32_0_32_24_i0_fu_main_25437_25541), .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(4), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_main_25437_25628 (.out1(out_ui_ne_expr_FU_8_0_8_26_i0_fu_main_25437_25628), .in1(out_reg_2_reg_2), .in2(out_const_3));
  ui_eq_expr_FU #(.BITSIZE_in1(4), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_main_25437_25630 (.out1(out_ui_eq_expr_FU_8_0_8_25_i0_fu_main_25437_25630), .in1(out_reg_2_reg_2), .in2(out_const_2));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0), .clock(clock), .reset(reset), .in1(out_UUdata_converter_FU_5_i0_fu_main_25437_25596), .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1), .clock(clock), .reset(reset), .in1(out_addr_expr_FU_6_i0_fu_main_25437_25620), .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(4), .BITSIZE_out1(4)) reg_2 (.out1(out_reg_2_reg_2), .clock(clock), .reset(reset), .in1(out_MUX_28_reg_2_0_0_0), .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(5), .BITSIZE_out1(5)) reg_3 (.out1(out_reg_3_reg_3), .clock(clock), .reset(reset), .in1(out_UIdata_converter_FU_18_i0_fu_main_25437_25519), .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4), .clock(clock), .reset(reset), .in1(out_MUX_30_reg_4_0_0_0), .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5), .clock(clock), .reset(reset), .in1(out_MUX_31_reg_5_0_0_0), .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6), .clock(clock), .reset(reset), .in1(out_ui_ne_expr_FU_8_0_8_26_i0_fu_main_25437_25628), .wenable(wrenable_reg_6));
  // io-signal post fix
  assign return_port = out_conv_out_const_0_I_1_I_32;
  assign Mout_oe_ram = sig_out_bus_mergerMout_oe_ram0_;
  assign Mout_we_ram = sig_out_bus_mergerMout_we_ram1_;
  assign Mout_addr_ram = sig_out_bus_mergerMout_addr_ram2_;
  assign Mout_Wdata_ram = sig_out_bus_mergerMout_Wdata_ram3_;
  assign Mout_data_ram_size = sig_out_bus_mergerMout_data_ram_size4_;
  assign Sout_Rdata_ram = sig_out_bus_mergerSout_Rdata_ram5_;
  assign Sout_DataRdy = sig_out_bus_mergerSout_DataRdy6_;
  assign OUT_CONDITION_main_25437_25543 = out_read_cond_FU_12_i0_fu_main_25437_25543;
  assign OUT_CONDITION_main_25437_25554 = out_read_cond_FU_13_i0_fu_main_25437_25554;
  assign OUT_CONDITION_main_25437_25577 = out_read_cond_FU_19_i0_fu_main_25437_25577;
  assign OUT_UNBOUNDED_main_25437_25490 = s_done_fu_main_25437_25490;
  assign OUT_UNBOUNDED_main_25437_25553 = s_done_fu_main_25437_25553;
  assign OUT_UNBOUNDED_main_25437_25564 = s_done_fu_main_25437_25564;

endmodule

// FSM based controller descrition for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_main(done_port, selector_IN_UNBOUNDED_main_25437_25490, selector_IN_UNBOUNDED_main_25437_25553, selector_IN_UNBOUNDED_main_25437_25564, selector_MUX_11___builtin_puts_29_i0_0_0_0, selector_MUX_28_reg_2_0_0_0, selector_MUX_30_reg_4_0_0_0, selector_MUX_31_reg_5_0_0_0, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf, fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, OUT_CONDITION_main_25437_25543, OUT_CONDITION_main_25437_25554, OUT_CONDITION_main_25437_25577, OUT_UNBOUNDED_main_25437_25490, OUT_UNBOUNDED_main_25437_25553, OUT_UNBOUNDED_main_25437_25564, clock, reset, start_port);
  // IN
  input OUT_CONDITION_main_25437_25543;
  input OUT_CONDITION_main_25437_25554;
  input OUT_CONDITION_main_25437_25577;
  input OUT_UNBOUNDED_main_25437_25490;
  input OUT_UNBOUNDED_main_25437_25553;
  input OUT_UNBOUNDED_main_25437_25564;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_IN_UNBOUNDED_main_25437_25490;
  output selector_IN_UNBOUNDED_main_25437_25553;
  output selector_IN_UNBOUNDED_main_25437_25564;
  output selector_MUX_11___builtin_puts_29_i0_0_0_0;
  output selector_MUX_28_reg_2_0_0_0;
  output selector_MUX_30_reg_4_0_0_0;
  output selector_MUX_31_reg_5_0_0_0;
  output fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf;
  output fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf;
  output fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf;
  output fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  parameter [10:0] S_0 = 11'b00000000001,
    S_1 = 11'b00000000010,
    S_6 = 11'b00001000000,
    S_2 = 11'b00000000100,
    S_3 = 11'b00000001000,
    S_4 = 11'b00000010000,
    S_5 = 11'b00000100000,
    S_10 = 11'b10000000000,
    S_7 = 11'b00010000000,
    S_8 = 11'b00100000000,
    S_9 = 11'b01000000000;
  reg [10:0] _present_state, _next_state;
  reg done_port;
  reg selector_IN_UNBOUNDED_main_25437_25490;
  reg selector_IN_UNBOUNDED_main_25437_25553;
  reg selector_IN_UNBOUNDED_main_25437_25564;
  reg selector_MUX_11___builtin_puts_29_i0_0_0_0;
  reg selector_MUX_28_reg_2_0_0_0;
  reg selector_MUX_30_reg_4_0_0_0;
  reg selector_MUX_31_reg_5_0_0_0;
  reg fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf;
  reg fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf;
  reg fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf;
  reg fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_IN_UNBOUNDED_main_25437_25490 = 1'b0;
    selector_IN_UNBOUNDED_main_25437_25553 = 1'b0;
    selector_IN_UNBOUNDED_main_25437_25564 = 1'b0;
    selector_MUX_11___builtin_puts_29_i0_0_0_0 = 1'b0;
    selector_MUX_28_reg_2_0_0_0 = 1'b0;
    selector_MUX_30_reg_4_0_0_0 = 1'b0;
    selector_MUX_31_reg_5_0_0_0 = 1'b0;
    fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf = 1'b0;
    fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf = 1'b0;
    fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf = 1'b0;
    fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_IN_UNBOUNDED_main_25437_25490 = 1'b1;
          selector_MUX_28_reg_2_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_UNBOUNDED_main_25437_25490 == 1'b0)
            begin
              _next_state = S_1;
              selector_MUX_28_reg_2_0_0_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
            end
        end
        else
          _next_state = S_0;
      
      S_1 :
        begin
          selector_MUX_11___builtin_puts_29_i0_0_0_0 = 1'b1;
          selector_MUX_28_reg_2_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_UNBOUNDED_main_25437_25490 == 1'b0)
            begin
              _next_state = S_1;
              selector_MUX_28_reg_2_0_0_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
            end
        end
      S_6 :
        begin
          selector_MUX_30_reg_4_0_0_0 = 1'b1;
          selector_MUX_31_reg_5_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION_main_25437_25577 == 1'b1)
            begin
              _next_state = S_8;
              selector_MUX_30_reg_4_0_0_0 = 1'b0;
              selector_MUX_31_reg_5_0_0_0 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_2 :
        begin
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          if (OUT_CONDITION_main_25437_25543 == 1'b1)
            begin
              _next_state = S_3;
              wrenable_reg_4 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_3 :
        begin
          selector_IN_UNBOUNDED_main_25437_25553 = 1'b1;
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf = 1'b1;
          if (OUT_UNBOUNDED_main_25437_25553 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_4 :
        begin
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf = 1'b1;
          if (OUT_UNBOUNDED_main_25437_25553 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_5 :
        begin
          if (OUT_CONDITION_main_25437_25554 == 1'b0)
            begin
              _next_state = S_7;
              done_port = 1'b1;
            end
          else
            begin
              _next_state = S_10;
            end
        end
      S_10 :
        begin
          _next_state = S_6;
        end
      S_7 :
        begin
          _next_state = S_0;
        end
      S_8 :
        begin
          selector_IN_UNBOUNDED_main_25437_25564 = 1'b1;
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf = 1'b1;
          if (OUT_UNBOUNDED_main_25437_25564 == 1'b0)
            begin
              _next_state = S_9;
            end
          else
            begin
              _next_state = S_6;
            end
        end
      S_9 :
        begin
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf = 1'b1;
          if (OUT_UNBOUNDED_main_25437_25564 == 1'b0)
            begin
              _next_state = S_9;
            end
          else
            begin
              _next_state = S_6;
            end
        end
      default :
        begin
          _next_state = S_0;
          done_port = 1'bX;
          selector_IN_UNBOUNDED_main_25437_25490 = 1'bX;
          selector_IN_UNBOUNDED_main_25437_25553 = 1'bX;
          selector_IN_UNBOUNDED_main_25437_25564 = 1'bX;
          selector_MUX_11___builtin_puts_29_i0_0_0_0 = 1'bX;
          selector_MUX_28_reg_2_0_0_0 = 1'bX;
          selector_MUX_30_reg_4_0_0_0 = 1'bX;
          selector_MUX_31_reg_5_0_0_0 = 1'bX;
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf = 1'bX;
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf = 1'bX;
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf = 1'bX;
          fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_2 = 1'bX;
          wrenable_reg_3 = 1'bX;
          wrenable_reg_4 = 1'bX;
          wrenable_reg_5 = 1'bX;
          wrenable_reg_6 = 1'bX;
        end
    endcase
  end
endmodule

// Top component for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module main(clock, reset, start_port, done_port, return_port, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, S_data_ram_size, M_Rdata_ram, M_DataRdy, Min_oe_ram, Min_we_ram, Min_addr_ram, Min_Wdata_ram, Min_data_ram_size, Sin_Rdata_ram, Sin_DataRdy, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size, Sout_Rdata_ram, Sout_DataRdy);
  parameter MEM_var_25582_25437=64, MEM_var_25584_25437=128;
  // IN
  input clock;
  input reset;
  input start_port;
  input S_oe_ram;
  input S_we_ram;
  input [7:0] S_addr_ram;
  input [7:0] S_Wdata_ram;
  input [3:0] S_data_ram_size;
  input [7:0] M_Rdata_ram;
  input M_DataRdy;
  input Min_oe_ram;
  input Min_we_ram;
  input [7:0] Min_addr_ram;
  input [7:0] Min_Wdata_ram;
  input [3:0] Min_data_ram_size;
  input [7:0] Sin_Rdata_ram;
  input Sin_DataRdy;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output Mout_oe_ram;
  output Mout_we_ram;
  output [7:0] Mout_addr_ram;
  output [7:0] Mout_Wdata_ram;
  output [3:0] Mout_data_ram_size;
  output [7:0] Sout_Rdata_ram;
  output Sout_DataRdy;
  // Component and signal declarations
  wire OUT_CONDITION_main_25437_25543;
  wire OUT_CONDITION_main_25437_25554;
  wire OUT_CONDITION_main_25437_25577;
  wire OUT_UNBOUNDED_main_25437_25490;
  wire OUT_UNBOUNDED_main_25437_25553;
  wire OUT_UNBOUNDED_main_25437_25564;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf;
  wire fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf;
  wire fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf;
  wire fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf;
  wire selector_IN_UNBOUNDED_main_25437_25490;
  wire selector_IN_UNBOUNDED_main_25437_25553;
  wire selector_IN_UNBOUNDED_main_25437_25564;
  wire selector_MUX_11___builtin_puts_29_i0_0_0_0;
  wire selector_MUX_28_reg_2_0_0_0;
  wire selector_MUX_30_reg_4_0_0_0;
  wire selector_MUX_31_reg_5_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  
  controller_main Controller_i (.done_port(done_delayed_REG_signal_in), .selector_IN_UNBOUNDED_main_25437_25490(selector_IN_UNBOUNDED_main_25437_25490), .selector_IN_UNBOUNDED_main_25437_25553(selector_IN_UNBOUNDED_main_25437_25553), .selector_IN_UNBOUNDED_main_25437_25564(selector_IN_UNBOUNDED_main_25437_25564), .selector_MUX_11___builtin_puts_29_i0_0_0_0(selector_MUX_11___builtin_puts_29_i0_0_0_0), .selector_MUX_28_reg_2_0_0_0(selector_MUX_28_reg_2_0_0_0), .selector_MUX_30_reg_4_0_0_0(selector_MUX_30_reg_4_0_0_0), .selector_MUX_31_reg_5_0_0_0(selector_MUX_31_reg_5_0_0_0), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6), .OUT_CONDITION_main_25437_25543(OUT_CONDITION_main_25437_25543), .OUT_CONDITION_main_25437_25554(OUT_CONDITION_main_25437_25554), .OUT_CONDITION_main_25437_25577(OUT_CONDITION_main_25437_25577), .OUT_UNBOUNDED_main_25437_25490(OUT_UNBOUNDED_main_25437_25490), .OUT_UNBOUNDED_main_25437_25553(OUT_UNBOUNDED_main_25437_25553), .OUT_UNBOUNDED_main_25437_25564(OUT_UNBOUNDED_main_25437_25564), .clock(clock), .reset(reset), .start_port(start_port));
  datapath_main #(.MEM_var_25582_25437(MEM_var_25582_25437), .MEM_var_25584_25437(MEM_var_25584_25437)) Datapath_i (.return_port(return_port), .Mout_oe_ram(Mout_oe_ram), .Mout_we_ram(Mout_we_ram), .Mout_addr_ram(Mout_addr_ram), .Mout_Wdata_ram(Mout_Wdata_ram), .Mout_data_ram_size(Mout_data_ram_size), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .OUT_CONDITION_main_25437_25543(OUT_CONDITION_main_25437_25543), .OUT_CONDITION_main_25437_25554(OUT_CONDITION_main_25437_25554), .OUT_CONDITION_main_25437_25577(OUT_CONDITION_main_25437_25577), .OUT_UNBOUNDED_main_25437_25490(OUT_UNBOUNDED_main_25437_25490), .OUT_UNBOUNDED_main_25437_25553(OUT_UNBOUNDED_main_25437_25553), .OUT_UNBOUNDED_main_25437_25564(OUT_UNBOUNDED_main_25437_25564), .clock(clock), .reset(reset), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .S_data_ram_size(S_data_ram_size), .M_Rdata_ram(M_Rdata_ram), .M_DataRdy(M_DataRdy), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size), .Sin_Rdata_ram(Sin_Rdata_ram), .Sin_DataRdy(Sin_DataRdy), .selector_IN_UNBOUNDED_main_25437_25490(selector_IN_UNBOUNDED_main_25437_25490), .selector_IN_UNBOUNDED_main_25437_25553(selector_IN_UNBOUNDED_main_25437_25553), .selector_IN_UNBOUNDED_main_25437_25564(selector_IN_UNBOUNDED_main_25437_25564), .selector_MUX_11___builtin_puts_29_i0_0_0_0(selector_MUX_11___builtin_puts_29_i0_0_0_0), .selector_MUX_28_reg_2_0_0_0(selector_MUX_28_reg_2_0_0_0), .selector_MUX_30_reg_4_0_0_0(selector_MUX_30_reg_4_0_0_0), .selector_MUX_31_reg_5_0_0_0(selector_MUX_31_reg_5_0_0_0), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0_printf), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT32_20_i0___builtin_printf), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0_printf), .fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf(fuselector_PRINTF_VECTOR_BOOL32_INT8_INT8_21_i0___builtin_printf), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6));
  flipflop_AR #(.BITSIZE_in1(1), .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out), .clock(clock), .reset(reset), .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for top component: main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module main_minimal_interface(clock, reset, start_port, done_port, return_port);
  parameter MEM_var_25582_25437=64, MEM_var_25584_25437=128;
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  // Component and signal declarations
  wire M_DataRdy_INT;
  wire [7:0] M_Rdata_ram_INT;
  wire [7:0] S_Wdata_ram_INT;
  wire [7:0] S_addr_ram_INT;
  wire [3:0] S_data_ram_size_INT;
  wire S_oe_ram_INT;
  wire S_we_ram_INT;
  
  main #(.MEM_var_25582_25437(MEM_var_25582_25437), .MEM_var_25584_25437(MEM_var_25584_25437)) main_i0 (.done_port(done_port), .return_port(return_port), .Mout_oe_ram(S_oe_ram_INT), .Mout_we_ram(S_we_ram_INT), .Mout_addr_ram(S_addr_ram_INT), .Mout_Wdata_ram(S_Wdata_ram_INT), .Mout_data_ram_size(S_data_ram_size_INT), .Sout_Rdata_ram(M_Rdata_ram_INT), .Sout_DataRdy(M_DataRdy_INT), .clock(clock), .reset(reset), .start_port(start_port), .S_oe_ram(S_oe_ram_INT), .S_we_ram(S_we_ram_INT), .S_addr_ram(S_addr_ram_INT), .S_Wdata_ram(S_Wdata_ram_INT), .S_data_ram_size(S_data_ram_size_INT), .M_Rdata_ram(M_Rdata_ram_INT), .M_DataRdy(M_DataRdy_INT), .Min_oe_ram(1'b0), .Min_we_ram(1'b0), .Min_addr_ram(8'b00000000), .Min_Wdata_ram(8'b00000000), .Min_data_ram_size(4'b0000), .Sin_Rdata_ram(8'b00000000), .Sin_DataRdy(1'b0));

endmodule


