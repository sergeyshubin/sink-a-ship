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
import newSeaWolf.SinkAShipGame;

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
//            KeyFrame {
//                time : 0s
//                values : [
//                            y => y tween Interpolator.LINEAR,
//                ]
//                action:function(){
//                    println("start: {y}");
//                }
//            },
//            KeyFrame {
//                time : 5s
//                values : [
//                            y => 0-this.boundsInLocal.height tween Interpolator.LINEAR,
//                ]
//                action:function(){
//                    println("end: {y}");
//                }
//            },
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




