void func(double a[], double b[], double c[], double d[])
{
    auto b1 = b;
    f1(a, b1);
    f2(b, b);
    auto d1 = c;
    f3(c, d1);
    f4(d, d);
    f5(a, a, b, c, d);
}