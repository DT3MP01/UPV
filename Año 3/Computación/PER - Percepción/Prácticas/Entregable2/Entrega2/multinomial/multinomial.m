function [edv] = multinomial(Xtr,xltr,Xdv,xldv,epsilons)
  cl = unique(xltr);
  pc = [];
  edv = [];
  
  % Probabilities for each class: 
  for c = cl'
    cRows = find(xltr == c);  
    wc0(c + 1) = rows(cRows) / rows(Xtr);
    cValues = Xtr(cRows, :);
    pc = vertcat(pc, sum(cValues));
    pc(end, :) = pc(end, :) / sum(pc(end, :));
  end
  
  wc0 = log(wc0);

  % For each epsilon, calculating Laplace and classifier error 
  for e = epsilons
    pcd = pc + e;
    pcd = pcd ./ sum(pcd);

    pcd = log(pcd);	

    % Classification matrices
    classifier = (Xdv * pcd') + wc0;

    % Classification error samples
    [maxValue maxIndex] = max(classifier, [], 2);
    maxIndex = maxIndex - 1;

    % Comparing the test samples to the original labels
    [row col] = size(xldv);
	  errors = find(maxIndex != xldv);
    edv = horzcat(edv, rows(errors) / row * 100);
  end
end
