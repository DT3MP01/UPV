function [X] = bernoulli_classifier(pA, pB, pC, pD, x)
    cA = 1;
    cB = 1;
    cC = 1;
    cD = 1;

    for i = 1:length(pA)
        cA *= (pA(i)^x(i)) * ((1 - pA(i))^(1 - x(i)));
    endfor

    for i = 1:length(pB)
        cB *= (pB(i)^x(i)) * ((1 - pB(i))^(1 - x(i)));
    endfor

    for i = 1:length(pC)
        cC *= (pC(i)^x(i)) * ((1 - pC(i))^(1 - x(i)));
    endfor

    for i = 1:length(pD)
        cD *= (pD(i)^x(i)) * ((1 - pD(i))^(1 - x(i)));
    endfor

    disp("\ncA = "), disp(cA);
    disp("\ncB = "), disp(cB);
    disp("\ncC = "), disp(cC);
    disp("\ncD = "), disp(cD);

    if cA > cB

        if cA > cC

            if cA > cD
                disp("\nI'm classified in class A!");
            endif

        endif

    endif

    if cB > cA

        if cB > cC

            if cB > cD
                disp("\nI'm classified in class B!");
            endif

        endif

    endif

    if cC > cA

        if cC > cB

            if cC > cD
                disp("\nI'm classified in class C!");
            endif

        endif

    endif

    if cD > cA

        if cD > cB

            if cD > cC
                disp("\nI'm classified in class D!");
            endif

        endif

    endif
