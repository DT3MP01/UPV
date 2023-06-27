function [X] = bernoulli_classifier3(pA, pB, pC, x)
    cA = 1;
    cB = 1;
    cC = 1;

    for i = 1:length(pA)
        cA *= (pA(i)^x(i)) * ((1 - pA(i))^(1 - x(i)));
    endfor

    for i = 1:length(pB)
        cB *= (pB(i)^x(i)) * ((1 - pB(i))^(1 - x(i)));
    endfor

    for i = 1:length(pC)
        cC *= (pC(i)^x(i)) * ((1 - pC(i))^(1 - x(i)));
    endfor

    disp("\ncA = "), disp(cA);
    disp("\ncB = "), disp(cB);
    disp("\ncC = "), disp(cC);

    if cA > cB

        if cA > cC
            disp("\nI'm classified in class A!");
        endif

    endif

    if cB > cA

        if cB > cC
            disp("\nI'm classified in class B!");
        endif

    endif

    if cC > cA

        if cC > cB
            disp("\nI'm classified in class C!");
        endif

    endif
