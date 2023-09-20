// ALU Verification Using UVM
// 17 September 2023

//------------------------------------------------
// Include Files
import uvm_pkg::*;
`include "uvm_macros.svh"

//------------------------------------------------

`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;
  
  //----------------------------------------------
  // Instantiation
  //----------------------------------------------
  
  logic clock;
  
  alu_interface intf(
    				.clock(clock)
                    );
  
  alu dut(
    .clock(intf.clock),
    .reset(intf.reset),
    .A(intf.a),
    .B(intf.b),
    .ALU_Sel(intf.op_code),
    .ALU_Out(intf.result),
    .CarryOut(intf.carryout)
  );
  
  
  //----------------------------------------------
  // Interface Setting
  //----------------------------------------------
  
  initial begin
    // we are setting the virtual interface in config database as name handle vif * asterick means every component
    // 1. null: No specific object provides the configuration data (a valid use case).
    // 2. "*": Wildcard string matching any component in the hierarchy.
    // 3. "vif": Identifier for the configuration entry in the database.
    // 4. intf: The object or variable containing the virtual interface data to be stored in the database. intf is alu_interface class handle
    uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf);
    
  end
  
  //----------------------------------------------
  // Start The Test
  //----------------------------------------------
  
  initial begin
	
	// Start simulation    
	run_test("alu_test");
	
  end
  
  //----------------------------------------------
  // Clock Generation
  //----------------------------------------------
  
  initial begin
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
    end
  end
  
  initial begin
    #5000;
    $display("Sorry! Ran out of clock cycles!");
    $finish();
  end
  
  initial begin
    $dumpfile("ALU_UVM.vcd");
    $dumpvars(0);
  end
      
      
endmodule: top
