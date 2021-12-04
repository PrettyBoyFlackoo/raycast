# Raycast
Raycasting for the Heaps io game engine. 

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
 
 
 
 
 
 Get from https://lib.haxe.org/p/raycast/

 
