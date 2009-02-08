package newSeaWolf;

import java.lang.System;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.animation.Interpolator;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.lang.Duration;
import java.lang.Double;

public class Ship extends CustomNode{
    public var exploded: Boolean;
    var exploding: Boolean;
    package var x: Number;
    package var y: Number;
    package var timeToFly:Duration;
    package var speed = 3;
    
    var flight = Timeline {
        repeatCount: 1
        keyFrames : [
//            at (Duration.valueOf(timeToFly)) {
//                x => -200 tween Interpolator.LINEAR
//            }            
            KeyFrame {
                time : Double.valueOf(speed)*5s
                values : [
                        x => -200 tween Interpolator.LINEAR,
                ]
            },
        ]
    }
    
    override public function create(): Node {
        timeToFly = speed*2s;
        flight.play();
        return Group {
            cache: true
            translateX: bind x
            translateY: bind y
            content: ImageView {
                    image: Image {
                        url: "{__DIR__}images/boat{speed}.png"
                    }
                }            
        }; 
    
    } 

}