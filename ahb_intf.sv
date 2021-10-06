 /*****************************************
* Author  Mohsan Naeem
* Date    2/oct/2021
*******************************
*Description
* **************************************/
interface ahb_intf #(parameter A_WIDTH = 32,
					 parameter RD_WIDTH = 32,
					 parameter WD_WIDTH =32 
					 ) (input hclk);
	//global signal
	logic hreset_n;
	//transfer response signals 
	logic                 hready;
	logic                 hresp;
	//select
	logic                 hsel;
	//Data signals
	logic [RD_WIDTH -1 : 0] hrdata;
	logic [WD_WIDTH -1 : 0] hwdata;
	//Address and controll signals
	logic [A_WIDTH-1 :0 ] haddr;
	logic                 hwrite;
	logic [2:0]           hsize;   
	logic [2         :0 ] hburst;
	logic [3:0]           hprot;
	logic [1:0]           htrans;
	logic                 hmstrlock;
	modport ahb_mstr_intf (input hreset_n,
					  input hready,
					  input hresp,
					  input hrdata,
					  output hwdata,
					  output haddr,
					  output hwrite,
					  output hsize,
					  output hburst,
					  output hprot,
					  output htrans,
					  output hmstrlock);
	modport ahb_slv_intf (input hreset_n,
						  input hsel,
	                      input hwdata,
	                      input haddr,
	                      input hwrite,
	                      input hsize,
	                      input hburst,
	                      input hprot,
	                      input htrans,
	                      input hmstrlock,
	                      output hready,
	                      output hresp,
	                      output hrdata);


	
endinterface : ahb_intf