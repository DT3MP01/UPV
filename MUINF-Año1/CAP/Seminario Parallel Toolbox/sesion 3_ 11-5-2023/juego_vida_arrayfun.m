function  juego_vida_arrayfun()
gridSize = 500;
numGenerations = 100;
initialGrid = (rand(gridSize,gridSize) > .75);
gpu = gpuDevice();

% Draw the initial grid
hold off
imagesc(initialGrid);
colormap([1 1 1;0 0.5 0]);
title('Initial Grid');
grid = gpuArray(initialGrid);
N=gridSize;

    function X = updateParent(row, col)
        % Take account of boundary effects
        rowU = max(1,row-1);  rowD = min(N,row+1);
        colL = max(1,col-1);  colR = min(N,col+1);
        % Count neighbors
        neighbors ...
            = grid(rowU,colL) + grid(row,colL) + grid(rowD,colL) ...
            + grid(rowU,col)                   + grid(rowD,col) ...
            + grid(rowU,colR) + grid(row,colR) + grid(rowD,colR);
        % A live cell with two live neighbors, or any cell with
        % three live neighbors, is alive at the next step.
        X = (grid(row,col) & (neighbors == 2)) | (neighbors == 3);
    end


timer = tic();

rows = gpuArray(1:gridSize)';
cols = gpuArray(1:gridSize);
for generation = 1:numGenerations
    grid = arrayfun(@updateParent, rows, cols);
end

wait(gpu); % Only needed to ensure accurate timing
gpuArrayfunTime = toc(timer)
pause
imagesc(grid);
end

