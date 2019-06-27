class Main inherits IO
{
	name:String <- "Class Main";
	noname:String;

	main():IO
	{
		{
			printattrs();
			out_string("\n");
			out_int(num);
			out_string("\n");
			out_int(nonum);
		}
	};

	printattrs():IO
	{
		{
			out_string("BEFORE");
			out_string("\n");
			out_string(noname);
			out_string("\n");
			out_int(nonum);
			out_string("\n");
			setattr();
			out_string("\n");
			out_string("AFTER");
			out_string("\n");
			out_string(noname);
			out_string("\n");
			out_int(nonum);
			out_string("\n");
		}
	};
	setattr():Int
	{
		{
			out_string("setting...");
			noname <- name;
			nonum <- num;
			nonum <- nonum + 1;
		}
	};


	nonum:Int;
	num:Int <- 99;
};