int N = 10;

void prodmv(double a[N], double c[N], double B[N][N])
{
    int i, j;
    double sum;
    for (i = 0; i < N; i++)
    {
        sum = 0;
        for (j = 0; j < N; j++)
            sum += B[i][j] * c[j];
        a[i] = sum;
    }
}

int main() {
    double a[N], c[N], B[N][N];

    int i, j;
    double sum;
    for (i = 0; i < N; i++)
    {
        sum = 0;
        for (j = 0; j < N; j++)
            sum += B[i][j] * c[j];
        a[i] = sum;
    }
}