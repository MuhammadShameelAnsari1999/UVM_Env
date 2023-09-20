
class alu_base_sequence extends uvm_sequence;
  //----------------------------------------------
  // UVM Factory Method
  //----------------------------------------------
  `uvm_object_utils(alu_base_sequence)
  
  

  alu_sequence_item reset_pkt;
  
  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  function new(string name ="alu_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQUENCE", "Inside Constructor!",UVM_HIGH)
  endfunction: new
  
  task body();
    `uvm_info("BASE_SEQUENCE", "Inside Body Task!",UVM_HIGH)
    
    reset_pkt = alu_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    if(!reset_pkt.randomize() with {reset==1;})// It randomize the transaction
        `uvm_fatal("ID","transaction is not randomize")// If it not randomize it will through fatal error
    finish_item(reset_pkt);
    
  endtask: body
  
endclass: alu_base_sequence


class alu_test_sequence extends alu_base_sequence;
  //----------------------------------------------
  // UVM Factory Method
  //----------------------------------------------
  `uvm_object_utils(alu_test_sequence)
  
  alu_sequence_item item;
  
  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  function new(string name ="alu_test_sequence");
    super.new(name);
    `uvm_info("TEST_SEQUENCE", "Inside Constructor!",UVM_HIGH)
  endfunction: new
  
  task body();
    `uvm_info("TEST_SEQUENCE", "Inside Body Task!", UVM_HIGH)
    
    item = alu_sequence_item::type_id::create("item");
    start_item(item);
    if(!item.randomize() with {reset==0;})// It randomize the transaction
        `uvm_fatal("ID","transaction is not randomize")// If it not randomize it will through fatal error
    finish_item(item);
    
  endtask: body
  
endclass: alu_test_sequence
