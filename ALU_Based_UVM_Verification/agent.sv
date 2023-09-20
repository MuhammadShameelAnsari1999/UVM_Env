
class alu_agent extends uvm_agent;
  //----------------------------------------------
  // UVM Factory Method
  //----------------------------------------------
  `uvm_component_utils(alu_agent)
  
  
  alu_driver drv;
  alu_monitor mon;
  alu_sequencer seqr;
  
  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  function new(string name="alu_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("AGENT_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------------------------
  // Build Phase
  //------------------------------------------------
  
  // funcion is used because build phase and connect phase is not used much time to complete its task, Function is not used for time consuming statements 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS", "Build Phase!", UVM_HIGH)
    
    // this is specify whose is the parent the parent is alu test.
    drv = alu_driver::type_id::create("drv", this);
    mon = alu_monitor::type_id::create("mon", this);
    seqr = alu_sequencer::type_id::create("seqr", this);
    
  endfunction: build_phase
  
  //------------------------------------------------
  // Connect Phase
  //------------------------------------------------
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "Connect Phase!", UVM_HIGH)
    
    // driver has build in port seq item port and seq item export but monitor and scoreboard hasn't we create it by using analysis port
    drv.seq_item_port.connect(seqr.seq_item_export);
    
  endfunction: connect_phase
  
  //------------------------------------------------
  // Run Phase
  //------------------------------------------------
  
  // Run Phase is a task because its take time to complete its work. It has time consuming statements
  task run_phase (uvm_phase phase); 
    super.run_phase(phase);
    
    //Logic
  
  endtask: run_phase
  
  
endclass: alu_agent
