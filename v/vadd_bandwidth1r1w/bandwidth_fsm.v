

module bandwidth_fsm
(
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  chan_0,
  flags,
  n,
  chan_1,
  Copy_0___chan_0__q0,
  Copy_0___flags__q0,
  Copy_0___n__q0,
  Copy_0__ap_start,
  Copy_0__ap_ready,
  Copy_0__ap_done,
  Copy_0__ap_idle,
  Copy_1___chan_1__q0,
  Copy_1___flags__q0,
  Copy_1___n__q0,
  Copy_1__ap_start,
  Copy_1__ap_ready,
  Copy_1__ap_done,
  Copy_1__ap_idle
);

  // pragma RS clk port=ap_clk
  // pragma RS rst port=ap_rst_n active=low
  // pragma RS ap-ctrl ap_start=ap_start ap_done=ap_done ap_idle=ap_idle ap_ready=ap_ready scalar=(chan_0|chan_1|n|flags)
  // pragma RS ap-ctrl ap_start=Copy_0__ap_start ap_done=Copy_0__ap_done ap_idle=Copy_0__ap_idle ap_ready=Copy_0__ap_ready scalar=Copy_0___.*
  // pragma RS ap-ctrl ap_start=Copy_1__ap_start ap_done=Copy_1__ap_done ap_idle=Copy_1__ap_idle ap_ready=Copy_1__ap_ready scalar=Copy_1___.*

  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_ready;
  output ap_done;
  output ap_idle;
  input [63:0] chan_0;
  input [63:0] flags;
  input [63:0] n;
  input [63:0] chan_1;
  output [63:0] Copy_0___chan_0__q0;
  output [63:0] Copy_0___flags__q0;
  output [63:0] Copy_0___n__q0;
  output Copy_0__ap_start;
  input Copy_0__ap_ready;
  input Copy_0__ap_done;
  input Copy_0__ap_idle;
  output [63:0] Copy_1___chan_1__q0;
  output [63:0] Copy_1___flags__q0;
  output [63:0] Copy_1___n__q0;
  output Copy_1__ap_start;
  input Copy_1__ap_ready;
  input Copy_1__ap_done;
  input Copy_1__ap_idle;
  wire [63:0] Copy_0___chan_0__q0;
  wire [63:0] Copy_0___flags__q0;
  wire [63:0] Copy_0___n__q0;
  wire Copy_0__ap_start_global__q0;
  wire Copy_0__is_done__q0;
  wire Copy_0__ap_done_global__q0;
  wire Copy_0__ap_start;
  wire Copy_0__ap_ready;
  wire Copy_0__ap_done;
  wire Copy_0__ap_idle;
  reg [1:0] Copy_0__state;
  wire [63:0] Copy_1___chan_1__q0;
  wire [63:0] Copy_1___flags__q0;
  wire [63:0] Copy_1___n__q0;
  wire Copy_1__ap_start_global__q0;
  wire Copy_1__is_done__q0;
  wire Copy_1__ap_done_global__q0;
  wire Copy_1__ap_start;
  wire Copy_1__ap_ready;
  wire Copy_1__ap_done;
  wire Copy_1__ap_idle;
  reg [1:0] Copy_1__state;
  reg [1:0] tapa_state;
  reg [0:0] countdown;
  wire ap_start__q0;
  wire ap_done__q0;
  assign Copy_0___chan_0__q0 = chan_0;
  assign Copy_0___flags__q0 = flags;
  assign Copy_0___n__q0 = n;
  assign Copy_0__ap_start_global__q0 = ap_start__q0;
  assign Copy_0__is_done__q0 = (Copy_0__state == 2'b10);
  assign Copy_0__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Copy_0__state <= 2'b00;
    end else begin
      if(Copy_0__state == 2'b00) begin
        if(Copy_0__ap_start_global__q0) begin
          Copy_0__state <= 2'b01;
        end 
      end 
      if(Copy_0__state == 2'b01) begin
        if(Copy_0__ap_ready) begin
          if(Copy_0__ap_done) begin
            Copy_0__state <= 2'b10;
          end else begin
            Copy_0__state <= 2'b11;
          end
        end 
      end 
      if(Copy_0__state == 2'b11) begin
        if(Copy_0__ap_done) begin
          Copy_0__state <= 2'b10;
        end 
      end 
      if(Copy_0__state == 2'b10) begin
        if(Copy_0__ap_done_global__q0) begin
          Copy_0__state <= 2'b00;
        end 
      end 
    end
  end

  assign Copy_0__ap_start = (Copy_0__state == 2'b01);
  assign Copy_1___chan_1__q0 = chan_1;
  assign Copy_1___flags__q0 = flags;
  assign Copy_1___n__q0 = n;
  assign Copy_1__ap_start_global__q0 = ap_start__q0;
  assign Copy_1__is_done__q0 = (Copy_1__state == 2'b10);
  assign Copy_1__ap_done_global__q0 = ap_done__q0;

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Copy_1__state <= 2'b00;
    end else begin
      if(Copy_1__state == 2'b00) begin
        if(Copy_1__ap_start_global__q0) begin
          Copy_1__state <= 2'b01;
        end 
      end 
      if(Copy_1__state == 2'b01) begin
        if(Copy_1__ap_ready) begin
          if(Copy_1__ap_done) begin
            Copy_1__state <= 2'b10;
          end else begin
            Copy_1__state <= 2'b11;
          end
        end 
      end 
      if(Copy_1__state == 2'b11) begin
        if(Copy_1__ap_done) begin
          Copy_1__state <= 2'b10;
        end 
      end 
      if(Copy_1__state == 2'b10) begin
        if(Copy_1__ap_done_global__q0) begin
          Copy_1__state <= 2'b00;
        end 
      end 
    end
  end

  assign Copy_1__ap_start = (Copy_1__state == 2'b01);

  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      tapa_state <= 2'b00;
    end else begin
      case(tapa_state)
        2'b00: begin
          if(ap_start__q0) begin
            tapa_state <= 2'b01;
          end 
        end
        2'b01: begin
          if(Copy_0__is_done__q0 && Copy_1__is_done__q0) begin
            tapa_state <= 2'b10;
          end 
        end
        2'b10: begin
          tapa_state <= 2'b00;
          countdown <= 1'd0;
        end
        2'b11: begin
          if(countdown == 1'd0) begin
            tapa_state <= 2'b00;
          end else begin
            countdown <= (countdown - 1'd1);
          end
        end
      endcase
    end
  end

  assign ap_idle = (tapa_state == 2'b00);
  assign ap_done = ap_done__q0;
  assign ap_ready = ap_done__q0;
  assign ap_start__q0 = ap_start;
  assign ap_done__q0 = (tapa_state == 2'b10);

endmodule

