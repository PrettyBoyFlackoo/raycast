package raycast.data;

class Line {

    public var from:Vector;
    public var to:Vector;

    public function new(from:Vector, to:Vector) {
        this.from = from;
        this.to = to;
    }

    public inline function length():Float {
        var dx = to.x - from.x;
        var dy = to.y - from.y;

        return distance(dx, dy);
    }

    inline function distance(x:Float, y:Float):Float {
        return Math.sqrt(x * x + y * y);
    }
}