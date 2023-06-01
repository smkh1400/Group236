module predictor(input wire request, result, clk, taken, output reg prediction);
	
	reg [1:0] counter = 0;

	always @(posedge clk) begin
		if (request == 1)
			prediction = counter[1];
		if (result == 1) begin
			if (taken == 1) begin
				if (counter < 3)
					counter = counter + 1;
			end
			else begin
				if (counter > 0)
					counter = counter - 1;
			end
		end
	end
endmodule