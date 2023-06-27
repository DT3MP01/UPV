function [X] = bernoulli_classifier2(pA, pB, x)
    cA = 1;
    cB = 1;

    for i = 1:length(pA)
        cA *= (pA(i)^x(i)) * ((1 - pA(i))^(1 - x(i)));
    endfor

    for i = 1:length(pB)
        cB *= (pB(i)^x(i)) * ((1 - pB(i))^(1 - x(i)));
    endfor

    disp("\ncA = "), disp(cA);
    disp("\ncB = "), disp(cB);

    if cA == cB
        disp("\nIt's a draw!");
    elseif cA > cB
        disp("\nI'm classified in class A!");
    else
        disp("\nI'm classified in class B!");

    endif
