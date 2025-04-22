classdef tilenode
    properties
        parentLocation
        gCost
        hCost
    end
    methods
        function n=tilenode (gCost, hCost, parentLocation)
            if nargin==0
                parentLocation=[0, 0];
                gCost=0;
                hCost=0;
            end
            n.gCost=gCost;
            n.hCost=hCost;
            n.parentLocation=parentLocation;
        end
    end
end
