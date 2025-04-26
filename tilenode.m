classdef tilenode
    properties
        parentPosition
        gCost
        hCost
    end
    methods
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
