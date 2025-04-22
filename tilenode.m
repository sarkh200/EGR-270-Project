classdef tilenode<dlnode
    properties
        fCost=0
    end
    methods
        function n=tilenode (location, startLocation, endLocation)
            if nargin==0
                fCost=0;
                location=[];
            else
                fCost=distanceBetween(location, startLocation)+distanceBetween(location, endLocation);
            end
            n=n@dlnode(location);
            n.fCost=fCost;
        end
    end
end

function distance=distanceBetween(startLocation, endLocation)
    distance=max(abs(startLocation(1)-endLocation(1)), abs(startLocation(2)-endLocation(2)));
end
