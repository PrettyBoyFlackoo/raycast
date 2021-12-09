package raycast.shapes;

import h2d.Graphics;
import raycast.data.Vector;
import raycast.shapes.*;
import Main.Debug;

class Ray {

    public var start = new Vector();
    public var end = new Vector();
    public var layerMask:Int;

    var g:Graphics;

    public function new(x1:Float, y1:Float, x2:Float, y2:Float, layerMask:Int = 0, ?debug:Debug) {
        start = new Vector(x1, y1);
        end = new Vector(x2, y2);
        this.layerMask = layerMask;

        Mask.addRay(this);

        if (debug == null) return;

        g = new Graphics(debug.parent);

        g.beginFill(debug.color);
        g.lineStyle(1, debug.color);
        g.moveTo(start.x, start.y);
        g.lineTo(end.x, end.y);
        g.endFill();
    }

    public inline function length():Float {
        var dx = end.x - start.x;
        var dy = end.y - start.y;

        return distance(dx, dy);
    }

    inline function distance(x:Float, y:Float):Float {
        return Math.sqrt(x * x + y * y);
    }
    
    public function isIntersectingWithBounds(bounds:Box):Array<Vector> { ///WIP - using very basic idea for now
        if (this.layerMask != bounds.layerMask) return null;
        
        var hit:Array<Vector> = [];
        
        var _i1 = isIntersecting(bounds.rays[0]);
        var _i2 = isIntersecting(bounds.rays[1]);
        var _i3 = isIntersecting(bounds.rays[2]);
        var _i4 = isIntersecting(bounds.rays[3]);

        var intersectedPoints = [_i1, _i2, _i3, _i4];

        for (i in intersectedPoints) {
            if (i != null) {
                hit.push(i);
            }
        }

        return hit;
    }

    public function isIntersectingWithCircle(circle:Circle):Array<Vector> {
        if (layerMask != circle.layerMask) return null;

        var v1 = new Vector();
        var v2 = new Vector();
        v1.x = end.x - start.x;
        v1.y = end.y - start.y;
        v2.x = start.x - circle.center.y;
        v2.y = start.y - circle.center.y;

        var b = (v1.x * v2.x + v1.y * v2.y);
        var c = 2 * (v1.x * v1.x + v1.y * v1.y);
        
        b *= -2;

        var d = Math.sqrt(b * b - 2 * c * (v2.x * v2.x + v2.y * v2.y - circle.radius * circle.radius));

        if (Math.isNaN(d)) {
            return [];
        }

        var _1 = (b - d) / c;
        var _2 = (b + d) / c;
        var intersectionP1 = new Vector();
        var intersectionP2 = new Vector();
        var intersection:Array<Vector> = [];

        if (_1 <= 1 && _1 >= 0) {
            intersectionP1.x = start.x + v1.x * _1;
            intersectionP1.y = start.y + v1.y * _1;
            intersection[0] = intersectionP1;
        }

        if (_2 <= 1 && _2 >= 0) {
            intersectionP2.x = start.x + v1.x * _2;
            intersectionP2.y = start.y + v1.y * _2;
            intersection[intersection.length] = intersectionP2;
        }

        return intersection;
    }

    public function isIntersecting(other:Ray) {
        if (this.layerMask != other.layerMask) return null;

        var x1 = other.start.x;
        var y1 = other.start.y;
        var x2 = other.end.x;
        var y2 = other.end.y;

        var x3 = start.x;
        var y3 = start.y;
        var x4 = end.x;
        var y4 = end.y;

        var den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);

        if (Math.abs(den) < 1e-10) return null;

        var t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
        var u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;

        if (t > 0 && t < 1 && u > 0) {
            var pt = new Vector();
            pt.x = x1 + t * (x2 - x1);
            pt.y = y1 + t * (y2 - y1);

            var dist = pt.distance(start);

            if (dist <= length()) {
                return pt;
            }

            return null;
        } 

        return null;
    }
}
