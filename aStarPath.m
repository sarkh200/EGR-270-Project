function path=aStarPath(startLocation, endLocation, matrix)

    startNode=tilenode(startLocation, startLocation, endLocation);

    openNodeList(1)=startNode;
    closedNodeList(numel(matrix))=tilenode();

    while true
        lowestOpenNodeIndex=findLowestFcost(openNodeList);
        currentNode=openNodeList(lowestOpenNodeIndex);
        openNodeList(lowestOpenNodeIndex).removeNode();
        closedNodeList(length(openNodeList)+1)=currentNode;

        if currentNode.Data==endLocation
            break
        end

    end
end

function index=findLowestFcost(nodeList)
    % finds the index of the node in nodeList with the smallest fCost
    index=1;
    for i=1:length(nodeList)
        if nodeList(i).fCost<nodeList(index).fCost
            index=1;
        end
    end
end
