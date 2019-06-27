class Main inherits IO
{
	name:String <- "Class Main";
	noname:String;
	num1:Int <- 4;
	nombre:String <- " PEPE ";
	num2:Int <- 17;
	num3:Int <- 28;
	num4:Int <- 91;

	main():IO
	{
		{
			out_int(num1 + num2);
			out_string("\n");
			out_int(num2);
			out_string("\n");
			out_int(9999);
			out_string("\n");
			out_string(name);
			out_string(nombre);
			out_string(name);
			out_string("\n");
			out_int(num3);
			out_string("\n");
			out_string(noname);
			out_string("\n");
			out_int(num4);
			out_string("\n");
		}
	};
};