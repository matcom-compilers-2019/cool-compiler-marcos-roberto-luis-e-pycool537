class Main inherits IO
{
	fib(n:Int):Int
	{
		if n < 2 then
			1
		else
			fib(n-1) + self.fib(n-2)
		fi
	};
	main():IO
	{
		{
			-- self.out_int(fib(5));
			-- self.out_string("\n");
			self.out_int(self.fib(5));
		}
	};
};