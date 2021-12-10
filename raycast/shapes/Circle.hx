package raycast.shapes;

import raycast.shapes.Shape.ShapeType;
import Main.Debug;
import h2d.Graphics;
import raycast.data.Vector;

class Circle extends Shape {
  
    public var radius:Float;
    public var center:Vector;
     
    public function new(x:Float, y:Float, radius:Float, layerMask:Int = 0, ?debug:Debug) {
        this.radius = radius;
        this.center = new Vector(x, y);

        ///Assing Informations
        this.layerMask = layerMask;
        this.shape = ShapeType.Circle;
    
        if (debug == null) return;
    
        var g = new Graphics(debug.parent);
    
        g.beginFill(0, 0);
        g.lineStyle(1, debug.color);
    
        g.drawCircle(x, y, radius, 12);
        g.endFill();
    
        Mask.addCircle(this);
    }
}