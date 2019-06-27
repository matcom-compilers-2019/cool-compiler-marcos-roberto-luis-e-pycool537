-- [x = 21] [y = ~(21 + 3) = ~(24) = -25]

class Main inherits IO{
   main(): IO {
   	{
		let x:Int <- 1 + 2 + 3 + 4 + 5 + 6,
			y:Int 
			in 
				{
					y <- ~(x + 3);
					out_int(y);
				};
   	}
   };
};
