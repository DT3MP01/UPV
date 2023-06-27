void func(double a[], double b[], double c[], double d[])
{
#pragma omp parallel sections
    {
#pragma omp parallel section
        {
            f1(a, b);
            f2(b, b);
        }
#pragma omp parallel section
        {
            f3(c, d);
            f4(d, d);
        }
    }
    f5(a, a, b, c, d);
}