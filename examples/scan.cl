class Main inherits IO{
    s: String;
    a: A;
    main(): SELF_TYPE{
        {
            s <- in_string();
            a <- new A;
            a.print(s);
            self;
        }
    };
};

class A inherits IO{
    print(s:String): SELF_TYPE{
        {
            out_string(s);
            self;
        }
    };
};
