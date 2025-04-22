function outPath=aStarPath(matrix, startLocation, endLocation)
    rows=size(matrix, 1);
    columns=size(matrix, 2);

    nodeMatrix(rows, columns)=tilenode();

    nodeMatrix(startLocation(2), startLocation(1))=tilenode(0, distanceBetween(startLocation, endLocation), startLocation);

    openNodeList=[0, 0];
    closedNodeList=[0, 0];

    openNodeList(1, :)=startLocation;

    while ~isempty(openNodeList)
        lowestOpenNodeIndex=findLowestFcost(openNodeList, nodeMatrix);
        currentLocation=openNodeList(lowestOpenNodeIndex, :);
        openNodeList(lowestOpenNodeIndex, :)=[];
        closedNodeList(length(closedNodeList)+1, :)=currentLocation;

        if currentLocation==endLocation
            break;
        end

        neighborLocations=getNeighborLocations(currentLocation, matrix);

        for i=1:size(neighborLocations, 1)
            neighborLocation=neighborLocations(i, :);
            neighborArray=num2cell(neighborLocation);
            currentArray=num2cell(currentLocation);

            if matrix(neighborArray{:})==0&&doesNodeListContain(closedNodeList, currentLocation)
                continue;
            end

            if nodeMatrix(neighborArray{:}).gCost>nodeMatrix(currentArray{:}).gCost+1||doesNodeListContain(openNodeList, currentLocation)==false
                nodeMatrix(neighborArray{:}).gCost=nodeMatrix(currentArray{:}).gCost+1;
                nodeMatrix(neighborArray{:}).hCost=distanceBetween(neighborLocation, endLocation);
                nodeMatrix(neighborArray{:}).parentLocation=currentLocation;

                if doesNodeListContain(openNodeList, neighborLocation)
                    openNodeList(length(openNodeList)+1)=neighborLocation;
                end
            end

        end
    end

    outPath=getPathFromMatrix(nodeMatrix, startLocation, endLocation);
end

function availableNodes=getNeighborLocations(location, matrix)
    rows=size(matrix, 1);
    columns=size(matrix, 2);

    x=location(2);
    y=location(1);

    nodeCount=0;
    availableNodes(8, :)=[0, 0];

    for i=1:8
        switch i
            case 1
                mX=x+1; mY=y;
            case 2
                mX=x+1; mY=y+1;
            case 3
                mX=x; mY=y+1;
            case 4
                mX=x-1; mY=y+1;
            case 5
                mX=x-1; mY=y;
            case 6
                mX=x-1; mY=y-1;
            case 7
                mX=x; mY=y-1;
            case 8
                mX=x+1; mY=y-1;
        end

        if mX>0&&mX<rows&&mY>0&&mY<columns&&matrix(mX, mY)~=0
            nodeCount=nodeCount+1;
            availableNodes(nodeCount, :)=[mX, mY];
        end

        availableNodes=availableNodes(1:nodeCount, :);

        if nodeCount==0
            error("No neighbors found");
        end
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
            index=1;
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
    outPath(nodeMatrix(endArray{:}).gCost)=[0, 0];

    currentLocation=endLocation;
    index=1;
    while currentLocation~=startLocation
        currentArray=num2cell(currentLocation);
        outPath(index, :)=currentLocation;
        currentLocation=nodeMatrix(currentArray{:}).parentLocation;
    end
end
