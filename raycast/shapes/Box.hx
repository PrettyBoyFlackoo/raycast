package raycast.shapes;

import Main.Debug;

class Box {

    public var x:Float;
    public var y:Float;
    public var w:Float;
    public var h:Float;
    public var layerMask:Int;

    public var rays:Array<Ray> = [];

    public function new(x, y, w, h, layerMask:Int = 0, ?debug:Debug) {
        var ray0 = new Ray(x, y + h, x, y, debug); //Left
        var ray1 = new Ray(x, y, x + w, y, debug); //Top
        var ray2 = new Ray(x + w, y, x + w, y + h, debug); //Right
        var ray3 = new Ray(x + w, y + h, x, y + h, debug); //Bottom
        rays = [ray0, ray1, ray2, ray3];

        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.layerMask = layerMask;

        for (r in rays) {
            r.layerMask = layerMask;
        }

        Mask.addRaybounds(this);
    }
}