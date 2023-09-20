
class alu_test extends uvm_test;
  //----------------------------------------------
  // UVM Factory Method
  //----------------------------------------------
  `uvm_component_utils(alu_test)
  

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;
  
  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  function new(string name="alu_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------------------------
  // Build Phase
  //------------------------------------------------
  
  // funcion is used because build phase and connect phase is not used much time to complete its task, Function is not used for time consuming statements 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase!", UVM_HIGH)
    
    // this is specify whose is the parent the parent is alu test.
    env = alu_env::type_id::create("env", this);
    
  endfunction: build_phase
  
  //------------------------------------------------
  // Connect Phase
  //------------------------------------------------
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Connect Phase!", UVM_HIGH)
    
    // Connect Monitor with Scoreboard
    
    
  endfunction: connect_phase
  
  //------------------------------------------------
  // Run Phase
  //------------------------------------------------
  
  // Run Phase is a task because its take time to complete its work. It has time consuming statements
  task run_phase (uvm_phase phase); 
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "Run Phase!", UVM_HIGH)
    
    phase.raise_objection(this);
    
    // Reset Sequence
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;
    
    repeat(100) begin
      // Test Sequence
      test_seq = alu_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  
  endtask: run_phase
  
  
endclass: alu_test
