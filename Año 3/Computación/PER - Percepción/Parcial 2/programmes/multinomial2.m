# Usage:multinomial2(class A column vectors, class B columns vectors)

function [] = multinomial2(A, B)
    disp("pA:");

    pA = sum(A, 2) / sum(A(:));

    disp(rats(pA'));

    disp("pB:")

    pB = sum(B, 2) / sum(B(:));

    disp(rats(pB'));

    var = yes_or_no("\nDo you want to classify a point:\n");

    if var == 1
        point = input("\nWrite the point (as a vector): ");
        disp("\nPoint:"), disp(point)
        PA = columns(A) / (columns(A) + columns(B));
        PB = 1 - PA;
        disp("\nP(A):"), disp(rats(PA));
        disp("P(B): "), disp(rats(PB));

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

        if auxA == auxB
            disp("\nIt's a draw!");
        elseif auxA > auxB
            disp("\nI'm classified in class A!");
        else
            disp("\nI'm classified in class B!");
        endif

    else
        return
    endif

endfunction
