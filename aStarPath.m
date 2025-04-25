function outPath=aStarPath(matrix, startLocation, endLocation)
    rows=size(matrix, 1);
    columns=size(matrix, 2);

    nodeMatrix(rows, columns)=tilenode();

    nodeMatrix(startLocation(2), startLocation(1))=tilenode(0, distanceBetween(startLocation, endLocation), startLocation);

    closedNodeList=[0, 0];

    openNodeList(1, :)=startLocation;

    while ~isempty(openNodeList)
        lowestOpenNodeIndex=findLowestFcost(openNodeList, nodeMatrix);
        currentLocation=openNodeList(lowestOpenNodeIndex, :);
        openNodeList(lowestOpenNodeIndex, :)=[];
        closedNodeList(length(closedNodeList)+1, :)=currentLocation;

        if all(currentLocation==endLocation)
            break;
        end

        neighborLocations=getNeighborLocations(currentLocation, matrix);

        for i=1:size(neighborLocations, 1)
            neighborLocation=neighborLocations(i, :);
            neighborArray=num2cell(neighborLocation);
            currentArray=num2cell(currentLocation);

            if matrix(neighborArray{:})==0||doesNodeListContain(closedNodeList, neighborLocation)
                continue;
            end

            if nodeMatrix(neighborArray{:}).gCost>nodeMatrix(currentArray{:}).gCost+1||doesNodeListContain(openNodeList, neighborLocation)==false
                nodeMatrix(neighborArray{:}).gCost=nodeMatrix(currentArray{:}).gCost+1;
                nodeMatrix(neighborArray{:}).hCost=distanceBetween(neighborLocation, endLocation);
                nodeMatrix(neighborArray{:}).parentLocation=currentLocation;

                if ~doesNodeListContain(openNodeList, neighborLocation)
                    openNodeList(size(openNodeList, 1)+1, :)=neighborLocation;
                end

            end

        end

    end

    outPath=getPathFromMatrix(nodeMatrix, startLocation, endLocation);
end

function availableNodes=getNeighborLocations(location, matrix)
    rows=size(matrix, 1);
    columns=size(matrix, 2);

    r=location(1);
    c=location(2);

    nodeCount=0;
    availableNodes(8, :)=[0, 0];

    for i=1:8
        nC=c; nR=r;
                
        switch i
            case 1
                nC=c+1;
            case 2
                nR=r+1;
            case 3
                nC=c-1;
            case 4
                nR=r-1;
            case 5
                nC=c+1; nR=r+1;
            case 6
                nC=c-1; nR=r+1;
            case 7
                nC=c-1; nR=r-1;
            case 8
                nC=c+1; nR=r-1;                
        end

        if nR>0&&nR<rows&&nC>0&&nC<columns
            if matrix(nR, nC)~=0
                nodeCount=nodeCount+1;
                availableNodes(nodeCount, :)=[nR, nC];
            end
        end

        availableNodes=availableNodes(1:nodeCount, :);

    end
    if isempty(availableNodes)
        error("No neighbors found");
    end

end

function index=findLowestFcost(nodeList, nodeMatrix)
    % finds the index of the node in nodeList with the smallest fCost
    index=1;

    for i=1:size(nodeList, 1)
        temp=num2cell(nodeList(i, :));
        iNode=nodeMatrix(temp{:});
        temp=num2cell(nodeList(index, :));
        indexNode=nodeMatrix(temp{:});

        if (iNode.gCost+iNode.hCost)<(indexNode.gCost+indexNode.hCost)
            index=i;
        end

    end

end

function distance=distanceBetween(startLocation, endLocation)
    distance=max(abs(startLocation(1)-endLocation(1)), abs(startLocation(2)-endLocation(2)));
end

function contains=doesNodeListContain(nodeList, location)
    contains=false;

    for i=1:size(nodeList, 1)

        if nodeList(i, :)==location
            contains=true;
        end

    end

end

function outPath=getPathFromMatrix(nodeMatrix, startLocation, endLocation)
    endArray=num2cell(endLocation);
    outPath(nodeMatrix(endArray{:}).gCost+1, :)=[0, 0];

    nodeMatrix.parentLocation;

    currentLocation=endLocation;
    index=1;

    while ~all(currentLocation==startLocation)
        currentArray=num2cell(currentLocation);
        if ~ismember(0, currentLocation)
            outPath(index, :)=currentLocation;
        end
        currentLocation=nodeMatrix(currentArray{:}).parentLocation;
        index=index+1;
    end

    currentArray=num2cell(currentLocation);
    currentLocation=nodeMatrix(currentArray{:}).parentLocation;
    outPath(index, :)=currentLocation;

    outPath=flip(outPath, 1);

    outPath=outPath(any(outPath, 2), any(outPath, 1));

end
