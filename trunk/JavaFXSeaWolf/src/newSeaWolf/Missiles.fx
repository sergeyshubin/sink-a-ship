package newSeaWolf;

import javafx.scene.effect.MotionBlur;
import java.lang.System;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.animation.Interpolator;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.paint.Color;

public class Missiles extends CustomNode{
    public var x: Number;
    public var y: Number;
    public var imgName: String;
    public var missiles =
    for (i in [0..3]) {
        Missle{
            x:x + 50 + 20 * i
            y:y + 40
            imgName:imgName

            scaleX:0.5
            scaleY:0.5
        }
    }
    
    
       
    
    override public function create(): Node {
        return Group {
            translateX: bind x
            translateY: bind y
            content: bind [
                missiles
            ]
        }; 
    
    } 

}




