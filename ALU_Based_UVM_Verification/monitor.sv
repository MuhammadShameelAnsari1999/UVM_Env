
class alu_monitor extends uvm_monitor;
  //----------------------------------------------
  // UVM Factory Method
  //----------------------------------------------
  `uvm_component_utils(alu_monitor)
  
  

  //after getting vif from config db we should declare like this so that we can use it over here
  virtual alu_interface vif;
  alu_sequence_item item;
  
  // This is a Transmitter Port
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  
  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  function new(string name="alu_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------------------------
  // Build Phase
  //------------------------------------------------
  
  // funcion is used because build phase and connect phase is not used much time to complete its task, Function is not used for time consuming statements 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "Build Phase!", UVM_HIGH)
    
    monitor_port = new("monitor_port", this);
    
    // We can get the Virtual Interface in any of the phase but the ideal way is to get in build phase
    // 1. this: Refers to the current object/class performing the configuration retrieval.
    // 2. "*": Wildcard string matching any component in the hierarchy.
    // 3. "vif": Identifier for the configuration entry in the database.
    // When you set the handler for a virtual interface (e.g., 'vif'), and later when you retrieve it, you have the flexibility to use any name. In this case, we've
    // chosen to use 'vif' as the variable name for the retrieved virtual interface.
    if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("MONITOR_CLASS","Failed to get VIF from Config DB!")
    end
    
  endfunction: build_phase
  
  //------------------------------------------------
  // Connect Phase
  //------------------------------------------------
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "Connect Phase!", UVM_HIGH)
    
  endfunction: connect_phase
  
  //------------------------------------------------
  // Run Phase
  //------------------------------------------------
  
  // Run Phase is a task because its take time to complete its work. It has time consuming statements
  task run_phase (uvm_phase phase); 
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS", "Inside Run Phase!", UVM_HIGH)
    
    forever begin
      item = alu_sequence_item::type_id::create("item");
      
      wait(!vif.reset);
      
      // Sample Inputs
      @(posedge vif.clock);
      item.a = vif.a;
      item.b = vif.b;
      item.op_code = vif.op_code;
      
      // Sample Output
      @(posedge vif.clock);
      item.result = vif.result;
      //item.carryout = vif.carryout;
      
      // send item to scoreboard
      monitor_port.write(item);
      
    end
  
  endtask: run_phase
  
  
endclass: alu_monitor
