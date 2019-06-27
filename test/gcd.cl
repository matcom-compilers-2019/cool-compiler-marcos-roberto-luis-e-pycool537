
class Main inherits IO {

    a: Int;
    b: Int;

    main() : SELF_TYPE {
        {
        out_string("-----GCD-----\n");
        out_string("Entre un numero:\n");
        a <- in_int();
        out_string("Entre otro numero:\n");
        b <- in_int();
        out_string("El maximo comun divisor es ");
        out_int(gcd(a, b));
        }
    };

    mod(x: Int, y: Int) : Int {

        let z: Int <- (x / y) in {
            y <- y * z;
            x - y;
        }
    };

    gcd(x: Int, y: Int) : Int {
        if y = 0 then x else gcd(y, mod(x, y)) fi
    };

};
