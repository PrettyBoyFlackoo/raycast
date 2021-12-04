package raycast;

class Mask {
    static var rays:Array<Ray> = [];
    static var raybounds:Array<RayBounds> = [];

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
    public static function getRayBounds(layerMask:Int = 0):Array<RayBounds> {
        var rayboundsCopy:Array<RayBounds> = [];

        for (i in raybounds) {
            if (layerMask == i.layerMask) {
                rayboundsCopy.push(i);
            }
        }

        return rayboundsCopy;
    }

    public static function addRay(ray:Ray):Void {
        rays.push(ray);
    }

    public static function addRaybounds(raybound:RayBounds):Void {
        raybounds.push(raybound);
    }
}