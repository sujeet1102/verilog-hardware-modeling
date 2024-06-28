# Some Hardware Modeling using Verilog

#### Synthesis Rules for Combinational Logic
The output of a combinational logic circuit at time t should depend only upon  
the inputs applied at time t.  
Rules to be followed:  
Avoid technology dependent modeling (i.e. implement functionality, not timing).  
There must not be any feedback in the combinational circuit.  
For "if...else" or "case" constructs, the output of the combinational function must  
be specified for all possible input cases.  
If the rules the not followed, the circuit may be synthesized as sequential.  

#### Styles for Synthesizable Combinational Logic
The possible styles for modeling combinational logic are as follows:  
Netlist Of Verilog built-in primitives like gate instances (AND, OR, NAND, etc.).  
Combinational UDP (not all synthesis tools support this).  
Continuous assignments.  
Functions (returns a single value, typically use iwth assign) 
Behavioral statements.  
Tasks without event or delay control. 
Interconnected modules of one or more of the above. 

#### Constructs to Avoid for Combinational Synthesis
Edge-dependent event control.  
Combinational feedback loops.  
Procedural or continuous assignment containing event or delay control.  
Procedural loops with timing.  
Data dependent loops.  
Sequential user defined primitives (UDPs).  
Other miscellaneous constructs like "fork … join", "wait", "disable", etc.  

#### Non-Synthesizable Constructs 
"initial" construct.  
Delays in assignments and test benches.  
"time" construct.  
"real" data type.  
The operators "===" and "!=="  
"fork … join" constructs.  
"force release" constructs.  
Variables in loop control.  


#### Naming Conventions 
- File Naming  
A file must contain only one design unit, contained in a single "module endmodule" construct.   
All Verilog files must have an extension of ".v"  

- Naming Of variables, signals and other objects  
Names must be composed Of alphanumeric characters or underscores.  
Names must start with a letter, and not a number or underscore.  
All names must be unique irrespective of case.  
Parameters and constant names must be given in UPPER CASE (e.g. PI, DELAY, etc.).  
Signals and variable names must be in lower case, and must be meaningful names.  
A variable name must describe the purpose of the variable (e.g. rega_enable).  
Construct names such as modules, functions and tasks must also be meaningful.  
For names composed of several words, underscore must be used (e.g. load_input).  
When a signal uses active low polarity, it must use the suffix " _b" (e.g. clear _ b).  
Signals that are used for clocking that do not have the word "clock" or already in their names, must use the suffix "_clk" (e.g. bus_clk).   
Unrelated signals must not be bundled into buses.  

#### Comments 
Comments are required to describe the functionality of a design unit.  
Each file must contain a file header, that follows some convention.  
The header must include the name of the file.  
The header must include the highest level construct contained in the file.  
Every file header must include the originating section or department, author, and author's email address.   
Header must include release history whenever such a change is registered.  
The header must contain a purpose section explaining the functionality of the module.  
The header must contain information describing the parameters being used in the construct.  
The number of clock domains and clocking strategy must be documented.  
Critical timing including external timing relationships must be documented.  

#### Coding Style 
Good coding style helps in easy understanding Of the code and maintainability.  
Write code with proper indentation in a tabular format.  
A constant indentation Of 2 to 4 spaces must be used for code alignment; do not use tab stops (tab stops interpretation varies from system to system).  
Use spaces and empty lines to increase the readability of code.  
One line must not contain more than one Verilog statement.  
Use one line comments using "//", avoid multi-line comments using "/* .. */" .  
Keep line length less than 80 characters, so as to avoid line wraps.  
When declaring ports, declare one port per line. Descriptive comment must follow each port listing.  

#### Module Partitioning 
Used for reducing complexity, and also to minimize the chances Of error.  
Procedure, tasks and functions must not access or modify signals / variables not passed as parameter to the module.   
If we use a gated clock, internally generated clock, or use both edges Of a clock, the clock generation circuitry must be kept in a separate module at the top level or at the same logical level in the hierarchy as the block to which the clocks apply.  
Separate clock domains (e.g. slow clock and fast clock) must be partitioned into separate blocks.   
The design should be partitioned so as to minimize the number Of interface signals.  
DO not mix structural and behavioral RTL code within a construct.  
State machines and asynchronous logic must be partitioned in a separate block.  

#### General Coding Techniques 
Some Of the general guidelines for coding are as follows.  
The expression in a condition must be a 1-bit value.  
Replace "if (bus) data_avail = 1" by "if (bus > 0) data_avail = 1".  
Do not assign signals to "x".  
Do not infer latches in functions, function is supposed to synthesize combinational logic.  
Operand sizes should match.  
Use parentheses in complex expressions.  

#### General Guidelines for Synthesis 
Some guidelines for synthesizable blocks are as follows.   
All "always" blocks inferring combinational logic or a latch must have a sensitivity list containing all input signals.  
Only one clock must be used in an "always" block.  
"wait" and statements must not be used.  
Conditional expressions must be specified completely; i.e. value must be assigned to a variable under all conditions.  
The "initial" statement must not be used.  
Expressions must not be used in port connections.  
Verilog user defined primitives must not be used.  
Use non-blocking assignments in edge-sensitive constructs.  
The internal "wire" declarations must follow the port I/O declarations at the top of the module.  
Use explicit port references in module instantiations.  
full _ adder FA (      . sum (S),  
                . in2 (B)   
);  
Use of "casex' statement is not allowed which treats "x" and "z" states as don't cares in synthesis.  
Use parameters for state encoding.  
Only use ports of type "input" or "output"; ports of type "inout" (bidirectional) should be avoided.  
In procedural blocks, blocking assignments should be used for modeling combinational logic.  
The "default" Case assignment must be used for all combinational logic case statement descriptions.  



