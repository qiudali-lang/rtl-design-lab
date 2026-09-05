module div (
  input  logic       clk,
  input  logic       rstn,
  input  logic       start,
  input  logic       ack,
  input  logic [7:0] x_in,
  input  logic [7:0] y_in,
  output logic [7:0] quo,
  output logic [7:0] rem,
  output logic       done
);
  localparam IDLE = 3'b100,
             COMP = 3'b010,
             DONE = 3'b001;

  reg [2:0] state;
  reg [7:0]  x;
  reg [7:0]  y;
  reg [7:0]  i;


  always @(posedge clk) begin
    if (rstn == 0) begin
      state <= IDLE;
    end else begin
      case (state)
          IDLE: begin
            if (start) begin
                state <= COMP;
            end
            x <= x_in;
            y <= y_in;
            i <= 8'b00000000;
          end
          COMP: begin
            if( x < y ) begin
                state <= DONE;
            end
            else begin
              x <= x - y;
              i <= i + 1;
            end
            
          end
          DONE: begin
            if (ack) begin 
                state <= IDLE; 
            end
          end
          default: begin
              ;
          end
      endcase
    end 
  end



  assign rem = x;
  assign quo = i;
  assign done = (state == DONE);
endmodule
