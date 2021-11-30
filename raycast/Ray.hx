package raycast;

import h2d.Graphics;
import h2d.col.Point;
import h2d.col.Line;
import h2d.Scene;

class Ray {

    public var line:Line;
    public var vFrom = new Point();
    public var vTo = new Point();

    var g:Graphics;

    public function new(x1:Float, y1:Float, x2:Float, y2:Float, ?debug:Debug) {
        vFrom.set(x1, y1);
        vTo.set(x2, y2);

        line = new Line(vFrom, vTo);


        if (debug == null) return;

        g = new Graphics(debug.parent);

        g.beginFill(debug.color);
        g.lineStyle(1, debug.color);
        g.moveTo(vFrom.x, vFrom.y);
        g.lineTo(vTo.x, vTo.y);
        g.endFill();
    }
    
    public function isIntersectingWithBounds(bounds:RayBounds):Point { ///WIP - using very basic idea for now
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
        var x1 = other.line.p1.x;
        var y1 = other.line.p1.y;
        var x2 = other.line.p2.x;
        var y2 = other.line.p2.y;

        var x3 = vFrom.x;
        var y3 = vFrom.y;
        var x4 = vTo.x;
        var y4 = vTo.y;

        var den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);

        if (den == 0) return null;

        var t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
        var u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;

        if (t > 0 && t < 1 && u > 0) {
            var pt = new Point();
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
