package raycast.data;

class Vector {

    public var x:Float;
    public var y:Float;

    public function new(x:Float = 0, y:Float = 0) {
        this.x = x;
        this.y = y;
    }

    public inline function set(x:Float = 0, y:Float = 0) {
        this.x = x;
        this.y = y;
    }

    public inline function distance(vector:Vector):Float {
        var dx = x - vector.x;
        var dy = y - vector.y;
        
        return Math.sqrt(dx * dx + dy + dy);
    }
}