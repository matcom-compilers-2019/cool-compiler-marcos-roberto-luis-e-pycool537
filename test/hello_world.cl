class A inherits IO{
    i : Int <- 10;

    print(): SELF_TYPE{
        out_int(i)
    };
};

class B inherits A{

    a : A;

    f(): A{
        a.print()
    };
};

class C inherits B{

    f(): A{
        out_int(i+10)
    };

};

class Main inherits IO {

   b : B;
   a : Int;

   main(): Object {
    {

    }
   };
};
