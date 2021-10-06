/*****************************************
* Author  Mohsan Naeem
* Date    2/oct/2021
*******************************
*Description
* **************************************/

interface apb_intf #(parameter A_WIDTH  = 32,
		parameter WD_WIDTH = 32,
		parameter RD_WIDTH = 32
	)(input i_pclk);

	logic                  preset_n;
	logic [A_WIDTH -1 : 0] paddr   ;
	logic                  pwrite  ;
	logic [WD_WIDTH-1 : 0] pwdata  ;
	logic [RD_WIDTH-1 : 0] prdata  ;
	logic 				   psel
    logic 				   penable;
	logic 				   pready ;
	logic 				   pslverr;

	//TODO:Add optional  Signals
	// logic [2          :0] pprot; 
	modport apb_slv_intf ( input      pclk,
						   input      preset_n,
						   input      paddr,
						   input      pwrite,
						   input      pwdata,
						   input      penable,
						   input      psel,
						   output     prdata,
						   output 	  pready,
						   output     pslverr);

	modport apb_mstr_intf (input      pclk,
						   input      preset_n,
						   input      prdata,
						   input 	  pready,
						   input      pslverr,		
						   output     pwdata,
						   output     pwrite,
						   output     paddr,
						   output     penable);
	
endinterface : apb_intf 