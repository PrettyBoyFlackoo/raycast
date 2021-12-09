package raycast;

import raycast.shapes.*;

class Mask {

    static var rays:Array<Ray> = [];
    static var raybounds:Array<Box> = [];
    static var circles:Array<Circle> = [];

    /**Returns a list with all created rays at the given mask in the scene**/
    public static function getRays(layerMask:Int = 0):Array<Ray> {
        var raysCopy:Array<Ray> = [];
    
        for (i in rays) {
            if (layerMask == i.layerMask) {
                raysCopy.push(i);
            }
        }

        return raysCopy;
    }

    /**Returns a list with all created bounds of rays at the given mask in the scene**/
    public static function getRayBounds(layerMask:Int = 0):Array<Box> {
        var rayboundsCopy:Array<Box> = [];

        for (i in raybounds) {
            if (layerMask == i.layerMask) {
                rayboundsCopy.push(i);
            }
        }

        return rayboundsCopy;
    }

    /**Returns a list with all created circles at the given mask in the scene**/
    public static function getCircles(layerMask:Int = 0):Array<Circle> {
        var circlesCopy:Array<Circle> = [];

        for (i in circles) {
            if (layerMask == i.layerMask) {
                circlesCopy.push(i);
            }
        }

        return circlesCopy;
    }

    public static function addRay(ray:Ray):Void {
        rays.push(ray);
    }

    public static function addRaybounds(raybound:Box):Void {
        raybounds.push(raybound);
    }

    public static function addCircle(circle:Circle):Void {
        circles.push(circle);
    }
}