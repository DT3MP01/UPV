#define M 200
#define P 100
#define N 50

void func1(double A[M][P], double B[P][N], double C[M][N], double v[M])
{
    int i, j, k;
    double mf, val;
    #pragma omp parallel for private (j, k, mf, val)
    for (i = 0; i < M; i++)
    {
        mf = 0;
        for (j = 0; j < N; j++)
        {
            val = 2.0 * C[i][j];
            for (k = 0; k < i; k++)
            {
                val += A[i][k] * B[k][j];
            }
            C[i][j] = val;
            if (val < mf)
                mf = val;
        }
        v[i] += mf;
    }
}

void func2(double A[M][P], double B[P][N], double C[M][N], double v[M])
{
    int i, j, k;
    double mf, val;
    for (i = 0; i < M; i++)
    {
        mf = 0;
        #pragma omp parallel for private (k, val) reduction (min:mf)
        for (j = 0; j < N; j++)
        {
            val = 2.0 * C[i][j];
            for (k = 0; k < i; k++)
            {
                val += A[i][k] * B[k][j];
            }
            C[i][j] = val;
            if (val < mf)
                mf = val;
        }
        v[i] += mf;
    }
}