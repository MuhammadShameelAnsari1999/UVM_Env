package base_test_pkg;
	// timeunit 1ns; timeprecision 1ns;

	import uvm_pkg::*;         // To bring uvm base library, from which we extend all the testbench components
	`include "uvm_macros.svh"  // To make use of macros that are found in uvm libraries

	///////////////////////////////////////////////////////
	// Include UVM objects that are involved in the test //
	///////////////////////////////////////////////////////

	// Sequence Items
	`include "sequence_item.sv"

	// Agent
	`include "agent.sv"

	// Environment
	`include "env.sv"

	// Sequences
	`include "sequence.sv"

	// Sequencers
	`include "sequencer.sv"

	// Monitors
	`include "monitor.sv"

	// Drivers
	`include "driver.sv"

	// Scoreboards
	`include "scoreboard.sv"

	// Tests
	`include "test.sv"

	// Any further test
  
endpackage // base_test_pkg
