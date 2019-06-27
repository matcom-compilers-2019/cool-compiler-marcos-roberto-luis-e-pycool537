class Main inherits IO
{
	fac(n:Int):Int
	{
		if n < 2 then
			1
		else
			n*fac(n-1)
		fi
	};
	main():IO
	{
		out_int(fac(6))
	};
};