class Main
{
	main():IO
	{
			let  a:A <- new A, b:B <- new B, c:B
			in 
			{
				b.status();
				c <- b;
				c.change("FUNCIONARA?");
				b.status();
			}
	};
};

class A inherits IO
{
	aA : Int <- 5;

	status() : IO
	{
		{
			out_int(aA);
			out_string("\n");
		}
	};

	change() : A
	{
		{
			aA <- aA + 10;
			self;
		}
	};
};

class B inherits IO
{
	aB : String <- "SOY UN B";

	status() : IO
	{
		{
			out_string(aB);
			out_string("\n");
		}
	};

	change(s:String) : B
	{
		{
			aB <- s;
			self;
		}
	};

};
