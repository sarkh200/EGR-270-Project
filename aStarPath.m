function outPath=aStarPath(matrix, startPosition, endPosition)
    % aStarPath calculates the optimal path from the starting position to the end position
    % Input arguments:
    %   matrix = the floor plan (in the form of a matrix)
    %   startPositon = position where the pathfinding starts at (in the form of an array [row, column])
    %   endPosition = the poisiton that is the goal of the pathfinding (in the form of an array [row, column])
    % Output argunments:
    %   outPath = the optimal path from the startPosition to the endPosition (in the form of a 2xN matrix with column 1 being rows and column 2 being columns)

    % Get the dimentions of the matrix
    rows=size(matrix, 1);
    columns=size(matrix, 2);

    % make a matrix of nodes that is the same size as the input matrix
    nodeMatrix(rows, columns)=tilenode();

    %initialize the starting position by initializing the gCost and hCost
    nodeMatrix(startPosition(2), startPosition(1))=tilenode(0, distanceBetween(startPosition, endPosition), startPosition);

    % initialize the closed and open node list
    closedNodeList=[0, 0];
    openNodeList(1, :)=startPosition;

    % loop while there are still open nodes
    while ~isempty(openNodeList)
        %find the node with the lowest fCost and set the current node to that
        lowestOpenNodeIndex=findLowestFcost(openNodeList, nodeMatrix);
        currentNodePosition=openNodeList(lowestOpenNodeIndex, :);
        % remove the current node from the open node list and add it to the end of the closed node list
        openNodeList(lowestOpenNodeIndex, :)=[];
        closedNodeList(length(closedNodeList)+1, :)=currentNodePosition;

        % breaks the loop once it gets to the end position
        if all(currentNodePosition==endPosition)
            break;
        end

        % gets the positions of the neighboring nodes
        neighborPositions=getNeighborPositions(currentNodePosition, matrix);

        % initializes all neighboring nodes with gCost, hCost, and sets their parent positions
        for i=1:size(neighborPositions, 1)
            % sets neighborPositon to the ith postion in the neighborPositions matrix
            neighborPosition=neighborPositions(i, :);
            % makes "nPositionArray" to allow referencing of loctations within matricies
            neighborPositionArray=num2cell(neighborPosition);
            currentPositionArray=num2cell(currentNodePosition);

            % skips loop if neighborPosition doesn't exist or if neighborPositon has been closed already
            if matrix(neighborPositionArray{:})==0||doesNodeListContain(closedNodeList, neighborPosition)
                continue;
            end

            % initialize the neighbor node if the current gCost is higher than the gCost if it was reinitialized or if it hasn't been initialized
            if nodeMatrix(neighborPositionArray{:}).gCost>nodeMatrix(currentPositionArray{:}).gCost+1||doesNodeListContain(openNodeList, neighborPosition)==false
                % set the gCost, hCost, and parentPosition of the neighbor node
                nodeMatrix(neighborPositionArray{:}).gCost=nodeMatrix(currentPositionArray{:}).gCost+1;
                nodeMatrix(neighborPositionArray{:}).hCost=distanceBetween(neighborPosition, endPosition);
                nodeMatrix(neighborPositionArray{:}).parentPosition=currentNodePosition;

                % add node to open node list if not there already
                if ~doesNodeListContain(openNodeList, neighborPosition)
                    openNodeList(size(openNodeList, 1)+1, :)=neighborPosition;
                end

            end

        end

    end

    % set the outPath to the calculated path
    outPath=getPathFromMatrix(nodeMatrix, startPosition, endPosition);
end

function availableNodes=getNeighborPositions(position, matrix)
    % getNeighborPositions gets all the surrounding nodes of Position that aren't walls
    % Input arguments:
    %   position = the position to get the surrounding nodes of (in the form of [row, column])
    %   matrix = the matrix to use to find the surrounding nodes (in the form of a matrix)
    % Output arguments:
    %   availableNodes = a 2xN matrix that has a list of neighboring nodes (in the form of a 2xN matrix with column 1 being rows and column 2 being columns)

    % get the dimentions of the matrix
    rows=size(matrix, 1);
    columns=size(matrix, 2);

    % get the row and column position of "position"
    PositionRow=position(1);
    PositionCol=position(2);

    % initialize nodeCount and availableNodes
    nodeCount=0;
    availableNodes(8, :)=[0, 0];

    % loop through all possible 8 neighboring nodes
    for i=1:8
        % set the candidate row and columns
        newRow=PositionRow; newCol=PositionCol;

        switch i
            case 1 % check East
                newCol=PositionCol+1;
            case 2 % check South
                newRow=PositionRow+1;
            case 3 % check Left
                newCol=PositionCol-1;
            case 4 % check North
                newRow=PositionRow-1;
            case 5 % check Southeast
                newCol=PositionCol+1; newRow=PositionRow+1;
            case 6 % check Southwest
                newCol=PositionCol-1; newRow=PositionRow+1;
            case 7 % check Northwest
                newCol=PositionCol-1; newRow=PositionRow-1;
            case 8 % check NorthEast
                newCol=PositionCol+1; newRow=PositionRow-1;
        end

        % make sure the candidate row and column isn't out of the bounds of the matrix
        if newRow>0&&newRow<rows&&newCol>0&&newCol<columns
            % add candidate position to available nodes if it isn't a wall
            if matrix(newRow, newCol)~=0
                nodeCount=nodeCount+1;
                availableNodes(nodeCount, :)=[newRow, newCol];
            end
        end

        % trim size of available nodes
        availableNodes=availableNodes(1:nodeCount, :);

    end
    % give error if there are no available nodes
    if isempty(availableNodes)
        error("No neighbors found");
    end

end

function index=findLowestFcost(nodeList, nodeMatrix)
    % findLowestFcost finds the index of the node in nodeList with the smallest fCost
    % Inputs:
    %   nodeList = list of nodes to look at (in the form of a 2xN matrix with column 1 being rows and column 2 being columns)
    %   nodeMatrix = matrix of nodes that is referenced to find gCost and hCost of the node list items
    % Outputs:
    %   index = index in nodeList that has the lowest fCost

    % initialize index to 1
    index=1;

    % run through entire list and compare the fCost to fCost at nodeList(index, :)
    for i=1:size(nodeList, 1)
        % makes "iNodePositionArray" to allow referencing of its position within node matrix
        iNodePositionArray=num2cell(nodeList(i, :));
        % make iNode equal to the node at iNodePositionArray
        iNode=nodeMatrix(iNodePositionArray{:});
        % makes "indexNodePositionArray" to allow referencing of its position within node matrix
        indexNodePositionArray=num2cell(nodeList(index, :));
        % make indexNode equal to the node at indexNodePositionArray
        indexNode=nodeMatrix(indexNodePositionArray{:});

        % make index equal to i if the fCost is lower
        if (iNode.gCost+iNode.hCost)<(indexNode.gCost+indexNode.hCost)
            index=i;
        end

    end

end

function contains=doesNodeListContain(nodeList, position)
    % doesNodeListContain checks to see if nodeList contains a position
    % Inputs:
    %   nodeList = list of nodes to look at (in the form of a 2xN matrix with column 1 being rows and column 2 being columns)
    %   position = the position you are checking (in the form of [row, column])
    % Outputs:
    %   contains = boolean that says if the nodeList contains position

    % initialize contains
    contains=false;

    % check every row in nodeList to see if it is the same as position
    for i=1:size(nodeList, 1)

        if nodeList(i, :)==position
            contains=true;
        end

    end

end

function outPath=getPathFromMatrix(nodeMatrix, startPosition, endPosition)
    % getPathFromMatrix retraces a path from the startPosition to the endPosition
    % Inputs:
    %   nodeMatrix = matrix of nodes that is referenced to retrace path
    %   startPosition = position that the path starts at
    %   endPosition = position that the path ends at
    % Output:
    %   outPath = a 2xN matrix that is a path from startPosition to endPosition (in the form of a 2xN matrix with column 1 being rows and column 2 being columns)

    % makes "endPositionArray" to allow referencing of its position within node matrix
    endPositionArray=num2cell(endPosition);

    % initialize outPath
    outPath(nodeMatrix(endPositionArray{:}).gCost+1, :)=[0, 0];

    % initialize currentPosition and index
    currentPosition=endPosition;
    index=1;

    % run loop while currentPositon isn't equal to startPosition
    while ~all(currentPosition==startPosition)
        % makes "currentPositionArray" to allow referencing of its position within node matrix
        currentPositionArray=num2cell(currentPosition);

        % add currentPosition to outPath if it is a valid position
        if ~ismember(0, currentPosition)
            outPath(index, :)=currentPosition;
        end
        % change currentPositon to its parentPosition
        currentPosition=nodeMatrix(currentPositionArray{:}).parentPosition;
        index=index+1;
    end

    % makes "currentPositionArray" to allow referencing of its position within node matrix
    currentPositionArray=num2cell(currentPosition);
    currentPosition=nodeMatrix(currentPositionArray{:}).parentPosition;
    outPath(index, :)=currentPosition;

    % flip outPath because it currently backwards
    outPath=flip(outPath, 1);

    % get rid of any columns that are empty
    outPath=outPath(any(outPath, 2), any(outPath, 1));

end
