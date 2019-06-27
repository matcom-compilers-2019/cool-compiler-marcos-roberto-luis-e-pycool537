class Main inherits IO{
   main(): IO {
		if true then
			if not true then out_string("_?_")
			else if 3 < 2 then out_string("_?_")
				else if 3 < 7 then out_string("OK")
					else out_string("_?_") fi fi fi
		else out_string("_?_") fi
   };
};
(*
class Main inherits IO
{
	main():IO
	{
		out_int(f(10))
	};
	f(n:Int):Int
	{
		if n < 2 then 1 else 2 fi
	};
};*)
