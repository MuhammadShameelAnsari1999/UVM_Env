
class alu_env extends uvm_env;
  //----------------------------------------------
  // UVM Factory Method
  //----------------------------------------------
  `uvm_component_utils(alu_env)
  

  alu_agent agnt;
  alu_scoreboard scb;
  
  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  function new(string name="alu_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------------------------
  // Build Phase
  //------------------------------------------------
  
  // funcion is used because build phase and connect phase is not used much time to complete its task, Function is not used for time consuming statements 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "Build Phase!", UVM_HIGH)
    
    // this is specify whose is the parent the parent is alu test.
    agnt = alu_agent::type_id::create("agnt", this);
    scb = alu_scoreboard::type_id::create("scb", this);
    
  endfunction: build_phase
  
  //------------------------------------------------
  // Connect Phase
  //------------------------------------------------
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH)
    
    agnt.mon.monitor_port.connect(scb.scoreboard_port);
    
  endfunction: connect_phase
  
  //------------------------------------------------
  // Run Phase
  //------------------------------------------------
  
  // Run Phase is a task because its take time to complete its work. It has time consuming statements
  task run_phase (uvm_phase phase); 
    super.run_phase(phase);
    
    //Logic
  
  endtask: run_phase
  
  
endclass: alu_env
