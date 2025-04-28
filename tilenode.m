classdef tilenode
    % class that is used in aStarPath.m
    properties
        parentPosition % position that the node originated from
        gCost % distance from start position
        hCost % distance to the end position
    end
    methods
        % initialize the tile
        function n=tilenode (gCost, hCost, parentPosition)
            if nargin==0
                parentPosition=[0, 0];
                gCost=0;
                hCost=0;
            end
            n.gCost=gCost;
            n.hCost=hCost;
            n.parentPosition=parentPosition;
        end
    end
end
