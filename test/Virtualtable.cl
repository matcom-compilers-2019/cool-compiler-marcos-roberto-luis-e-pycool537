class Main
{
    main():IO
    {
        let a:A <- new A, b:B <- new B , c:A <- new B in
            {
                a.g("Hola");
                out_string("\n");
                a.f(2);
                out_string("\n");
                b.g("Hola");
                out_string("\n");
                b.f(2);
                out_string("\n");
                c.g("Hola");
                out_string("\n");
                c.f(2);
            }
    };
};

class A inherits IO
{
    f(n:Int):IO
    {
        out_int(n)
    };
    g(s:String):IO
    {
        out_string(s)
    };
};

class B inherits A
{
    f(n:Int):IO
    {
        out_int(n+2)
    };
};