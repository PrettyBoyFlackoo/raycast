package raycast.shapes;

enum ShapeType {
    Ray;
    Box;
    Circle;
}

class Shape {
    public var layerMask:Int;
    public var shape:ShapeType;
}