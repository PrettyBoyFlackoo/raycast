# Raycast
Raycasting Tool for any game engines. Best use for Heaps.io

# Usage

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

       var hit = ray0.isIntersecting(ray1);

       if (hit != null) {
           trace("Your intersection point is: " + hit);
       }
    }
```

# Visualize

If there is an intersecting point between the given 2 rays then it will return a point that contains x and y coordinates otherwise you get null. Additionally You can set a debug mode in the ray constructer to visualize the rays.

```haxe
 var ray0 = new Ray(32, 32, 64, 64, {parent: s2d, color: 0xFF0000});
 var ray1 = new Ray(32, 48, 96, 12, {parent: s2d, color: 0xFF0000});
```
To visualize the intersecting point we can create a function that draws a circle at the given function paramter position. We pass our hit point coordinates into the function.

```haxe
override function init() {
   var ray0 = new Ray(32, 32, 64, 64, {parent: s2d, color: 0xFF0000});
   var ray1 = new Ray(32, 48, 96, 12, {parent: s2d, color: 0xFF0000});

   var hit = ray0.isIntersecting(ray1);

   if (hit != null) {
       trace("Your intersection point is: " + hit);

       drawCircle(hit.x, hit.y, s2d);
   }
}

function drawCircle(x, y, parent) {
    var g = new Graphics(parent);
        
    g.beginFill(0xFFFFFF);
    g.drawCircle(x, y, 4, 12);
    g.endFill();
 }
 ```
 
 # Results
 
 ![Unbenannt Kopie](https://user-images.githubusercontent.com/48133099/143768413-43219c36-8f9f-45d8-9196-0289ce9c9e9b.png)
 
 
 # Recent Updates
 
 In the last update you can cast a ray trough a bound of rays to get the intersection point.
 
![Unbenannt](https://user-images.githubusercontent.com/95177386/145473467-1c3c2583-4967-44b2-99fd-e9dc5b02aba4.PNG)

It is not perfectly done because it doesn't calculate the point with math, instead it checks which of the intersecting points are the nearest and eventually returns it. This could lead to some issues!

# Layer Masks
It is now possible to set a custom layer mask. You can now set a different layer mask to a ray and it only checks for the rays that are in the same layer mask. This can be used for collision detection in games for example. On default it's set on 0.

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

# Circle Intersection
You can get the intersections points from a circle

```haxe
override function init() {
    var debug:Debug = {
        parent: s2d,
        color: 0xFF0000 
    }

   var ray0 = new Ray(32, 32, 100, 150, debug);
   var circle = new Circle(64, 64, 20, debug);
        
   var hit = ray0.isIntersectingWithCircle(circle);
    
   if (hit != null) {
       for (i in hit) {
           drawCircle(i.x, i.y);
       }
   }
}
```

![Unbenannt](https://user-images.githubusercontent.com/95177386/145473129-a6cf3d70-6369-4402-afc7-24ec0f670a04.PNG)

 
 Get from https://lib.haxe.org/p/raycast/
