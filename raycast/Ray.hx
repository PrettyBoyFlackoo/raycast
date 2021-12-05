package raycast;

import h2d.Graphics;
import h2d.Scene;
import raycast.data.*;

class Ray {

    public var line:Line;
    public var vFrom = new Vector();
    public var vTo = new Vector();
    public var layerMask:Int;

    var g:Graphics;

    public function new(x1:Float, y1:Float, x2:Float, y2:Float, layerMask:Int = 0, ?debug:Debug) {
        vFrom.set(x1, y1);
        vTo.set(x2, y2);

        line = new Line(vFrom, vTo);

        this.layerMask = layerMask;

        Mask.addRay(this);

        if (debug == null) return;

        g = new Graphics(debug.parent);

        g.beginFill(debug.color);
        g.lineStyle(1, debug.color);
        g.moveTo(vFrom.x, vFrom.y);
        g.lineTo(vTo.x, vTo.y);
        g.endFill();
    }
    
    public function isIntersectingWithBounds(bounds:RayBounds):Point { ///WIP - using very basic idea for now
        if (this.layerMask != bounds.layerMask) return null;
        
        var hit:Point = null;
        
        var _i1 = isIntersecting(bounds.rays[0]);
        var _i2 = isIntersecting(bounds.rays[1]);
        var _i3 = isIntersecting(bounds.rays[2]);
        var _i4 = isIntersecting(bounds.rays[3]);


        var intersectedPoints = [_i1, _i2, _i3, _i4];
        var hits = [];

        for (i in intersectedPoints) {
            if (i != null) hits.push(i);
        }

        if (hits.length > 1) {
            var nearestPoint0 = hits[0].distance(vFrom);
            var nearestPoint1 = hits[1].distance(vFrom);
    
            if (nearestPoint0 < nearestPoint1) {
                hit = hits[0];
            } else {
                hit = hits[1];
            }
        } else {
            hit = hits[0];
        }

        return hit;
    }

    public function isIntersecting(other:Ray) {
        if (this.layerMask != other.layerMask) return null;

        var x1 = other.line.from.x;
        var y1 = other.line.from.y;
        var x2 = other.line.to.x;
        var y2 = other.line.to.y;

        var x3 = vFrom.x;
        var y3 = vFrom.y;
        var x4 = vTo.x;
        var y4 = vTo.y;

        var den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);

        if (den == 0) return null;

        var t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
        var u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;

        if (t > 0 && t < 1 && u > 0) {
            var pt = new Vector();
            pt.x = x1 + t * (x2 - x1);
            pt.y = y1 + t * (y2 - y1);

            var dist = pt.distance(vFrom);

            if (dist <= line.length()) {
                return pt;
            }

            return null;
        } 

        return null;
    }
}

typedef Debug = {
    var color:Int;
    var parent:Scene;
}
