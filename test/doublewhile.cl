class Main inherits IO
{
	main():IO
	{

	{
		let x:Int<-5, x1:Int <- 0, y:Int <- 5, y1:Int <- 0 in
			while x1 < x loop{
				while y1 < y loop{
                    out_int(x1);
                    out_int(y1);
                	out_string("\n");
					y1 <- y1 + 1;
                }pool;
				x1 <- x1 + 1;
				y1 <- 0;
				self;
			}pool;
		self;
	}
	};
};