# Usage:multinomial2(class A column vectors, class B columns vectors, class C columns vectors)

function [] = multinomial3(A, B, C)
    disp("pA:");

    pA = sum(A, 2) / sum(A(:));
    disp(rats(pA'));

    disp("pB:")

    pB = sum(B, 2) / sum(B(:));
    disp(rats(pB'));

    disp("pC:")

    pC = sum(C, 2) / sum(C(:));
    disp(rats(pC'));

    disp("\nCalculating inconditional probability:");
    TM = [A B C];
    res = sum(TM, 2) / sum(TM(:));
    disp(rats(res'));

    



    var = yes_or_no("\nDo you want to classify a point:\n");

    if var == 1
        point = input("\nWrite the point (as a vector): ");
        disp("\nPoint:"), disp(point)

        PA = columns(A) / (columns(A) + columns(B) + columns(C));
        PB = columns(B) / (columns(A) + columns(B) + columns(C));
        PC = 1 - PA - PB;

        disp("\nP(A):"), disp(rats(PA));
        disp("P(B): "), disp(rats(PB));
        disp("P(C): "), disp(rats(PC));

        auxA = 1;

        for i = 1:rows(pA)
            auxA *= (pA(i, 1)^point(i, 1));
        endfor

        auxA *= PA;
        printf("\ngA(x) = %d\n", auxA);

        auxB = 1;

        for i = 1:rows(pB)
            auxB *= (pB(i, 1)^point(i, 1));
        endfor

        auxB *= PB;
        printf("gB(x) = %d\n", auxB);

        auxC = 1;

        for i = 1:rows(pC)
            auxC *= (pC(i, 1)^point(i, 1));
        endfor

        auxC *= PC;
        printf("gC(x) = %d\n", auxC);

        if auxA > auxB

            if auxA > auxC
                disp("\nI'm classified in class A!");
            endif

        endif

        if auxB > auxA

            if auxB > auxC
                disp("\nI'm classified in class B!");
            endif

        endif

        if auxC > auxA

            if auxC > auxB
                disp("\nI'm classified in class C!");
            endif

        endif

    else
        return
    endif

endfunction
