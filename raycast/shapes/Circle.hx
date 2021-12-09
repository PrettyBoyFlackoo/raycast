package raycast.shapes;

import Main.Debug;
import h2d.Graphics;
import raycast.data.Vector;

class Circle {
  
    public var radius:Float;
    public var center:Vector;
    public var layerMask:Int;
     
    public function new(x:Float, y:Float, radius:Float, layerMask:Int = 0, ?debug:Debug) {
        this.radius = radius;
        this.center = new Vector(x, y);
        this.layerMask = layerMask;
    
        if (debug == null) return;
    
        var g = new Graphics(debug.parent);
    
        g.beginFill(0, 0);
        g.lineStyle(1, debug.color);
    
        g.drawCircle(x, y, radius, 12);
        g.endFill();
    
        Mask.addCircle(this);
    }
}