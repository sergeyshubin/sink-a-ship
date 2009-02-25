package newSeaWolf;

import javafx.scene.effect.MotionBlur;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
/**
 * submarine missile
 */

public class Missle extends CustomNode{
    public var exploded = false;
    public-init var x: Number;
    public-init var y: Number;
    public var imgName: String;
    var blurRadius = 1;
    
    
    public var flight = Timeline {
        repeatCount: 1
        keyFrames : [
            at (5s) {
                blurRadius => 20;
                y => 0-this.boundsInLocal.height tween Interpolator.LINEAR
            }
        ]
    }
    
    
    
    override public function create(): Node {                
        return Group {
            translateX: bind x
            translateY: bind y
            //cache: true
            effect: MotionBlur{
                angle:90
                radius:bind blurRadius
            }
            content: bind [
                ImageView {
                    image: Image {
                        url: "{__DIR__}images/{imgName}.png"
                    }
                }
            ]
        }; 
    
    } 

}




