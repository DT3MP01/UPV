function ind = wilson(X,xl,k)
  ind = [1:rows(X)];
  m = 100;
  neighbours = mnn(X,xl,m); %Vi = m
  % printf("Calculated neighbours \n");
  error = true;
  it = 0;
  while(error)
    it++;
    j = columns(ind);
    i = 1;
    % printf('Wilson Iteration nº: %d\n', it);
    error = false;
    while(i <= j)
      c = knnV(neighbours(:,ind(i)), ind,xl,k);
      if(xl(ind(i)) != c)
        error = true;
        ind(i) = []; % Removing the element 
        i--;
        j--;
      endif
      i++;
    endwhile
  endwhile  
  % printf("Returning Wilson...\n");
endfunction




