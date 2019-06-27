class Main inherits IO {
    pal(s : String) : Bool {
	if s.length() = 0
	then true
	else if s.length() = 1
	then true
	else if s.substr(0, 1) = s.substr(s.length() - 1, 1)
	then pal(s.substr(1, s.length() -2))
	else false
	fi fi fi
    };

    i : Int;
    s : String;

    main() : SELF_TYPE {
	{
		i <- ~1;
	    out_string("enter a string\n");
	    s <- in_string();
	    -- es necesario quitarle el '\n' a la lectura, pues el scan siempre lee con el salto de linea
	    -- por eso se hace substr
	    s <- s.substr(0, s.length() - 1);
	    if pal(s)
	    then out_string("that was a palindrome\n")
	    else out_string("that was not a palindrome\n")
	    fi;
	}
    };
};
