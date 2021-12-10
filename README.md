# Raycast
Raycasting Tool for any game engines. Best use for Heaps.io

## Usage
To shoot a simple ray you can just add a new ray and give the starting position and a ending position

```haxe
package;

import raycast.Ray;

class Main extends hxd.App {
    static function main() {
        new Main();
    }

    override function init() {
       var ray0 = new Ray(32, 32, 64, 64);
       var ray1 = new Ray(32, 48, 96, 12);

       ///ray 0 checks if intersecting with ray 1
       var hit = ray0.isIntersecting(ray1);

       if (hit != null) {
           trace("Your intersection point is: " + hit);
       }
    }
```

## Visualize

If there is an intersecting point between the given 2 rays then it will return a point that contains x and y coordinates otherwise you get null. Additionally You can set a debug mode in the ray constructer to visualize the rays. The Debug Mode is only working for the Heaps.io game engine.

```haxe
var debug = {
    parent: s2d,
    color: 0xFF0000
}

 var ray0 = new Ray(32, 32, 64, 64, debug);
 var ray1 = new Ray(32, 48, 96, 12, debug);
```
To visualize the intersecting point we can create a function that draws a circle at the given function paramter position. We pass our hit point coordinates into the function.

```haxe
override function init() {
    var debug:Debug = {
        parent: s2d,
        color: 0xFF0000 
    }

    var ray0 = new Ray(32, 32, 64, 64, debug);
    var ray1 = new Ray(32, 48, 96, 12, debug);

    var hit = ray0.isIntersecting(ray1);

    if (hit != null) {
       drawCircle(hit.x, hit.y); ///Draws a circle at given point
    }
}

///Works for Heaps.io
function drawCircle(x, y) {
    var g = new Graphics(s2d);
    g.beginFill(0xFFFFFF);
    g.drawCircle(x, y, 4, 12);
    g.endFill();
}
 ```
 
 ## Results
 
 ![Unbenannt Kopie](https://user-images.githubusercontent.com/48133099/143768413-43219c36-8f9f-45d8-9196-0289ce9c9e9b.png)
 
 
 
 
 # Different Shapes
 
 In the latest updates you can check intersection points for different shapes like ray(line), box and circle!
 
## Box
![Unbenannt](https://user-images.githubusercontent.com/95177386/145473467-1c3c2583-4967-44b2-99fd-e9dc5b02aba4.PNG)

```haxe
override function init() {
    var debug:Debug = {
        parent: s2d,
        color: 0xFF0000 
    }

   var ray0 = new Ray(32, 32, 100, 100, debug);
   var box = new Box(32, 48, 64, 32, debug);

   var hit = ray0.isIntersectingWithBounds(box);

   if (hit != null) {
       for (p in hit) {
        drawCircle(p.x, p.y);
       }
   }
}
```

It is not perfectly done because it doesn't calculate the point with math, instead it checks which of the intersecting points are the nearest and eventually returns it. This could lead to some issues!

## Circle
![Unbenannt](https://user-images.githubusercontent.com/95177386/145473129-a6cf3d70-6369-4402-afc7-24ec0f670a04.PNG)




## Layer Masks
It is now also possible to set a custom layer mask. You can now set a different layer mask to a ray and it only checks for the rays that are in the same layer mask. This can be used for collision detection in games for example. On default it's set on 0.

```haxe
override function init() {
    var debug:Debug = {
        parent: s2d,
        color: 0xFF0000
    }

    var myLayerMask:Int = 2;

    var ray0 = new Ray(32, 48, 128, 128, myLayerMask, debug);
    var box = new RayBounds(64, 64, 32, 48, myLayerMask, debug);

    var hit = ray0.isIntersectingWithBounds(box);

    if (hit != null) {
        drawCircle(hit.x, hit.y);
    }
}
```

 Get from https://lib.haxe.org/p/raycast/
