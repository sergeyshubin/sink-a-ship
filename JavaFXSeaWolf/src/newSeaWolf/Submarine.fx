package newSeaWolf;

import java.lang.System;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.animation.Interpolator;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.paint.Color;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import newSeaWolf.SinkAShipGame;

public class Submarine extends CustomNode{

    public var x: Number;
    public var y: Number;
    public var imgName: String;    
    public var missiles = Missiles{
        x:30
        y:30
        imgName:"shot{imgName}"
    }
    //Ovde bi moglo da se metne neka otezavajuca okolnost za opaljivanje
    //Na primer da mora da se drzi dugme za opaljivanje sekund    

    override public function create(): Node {
        //anchorX = x+getBoundsWidth()/2;
        //anchorY = y+getBoundsHeight()/2;
        return Group {
            cache: true
            translateX: bind x
            translateY: bind y
            content: bind [
                ImageView {
                    image: Image {
                        url: "{__DIR__}images/subMarine{imgName}.png"
                    }
                },missiles
            ]
        };

    }
    
    public function fireMissile():Boolean{
        var missileNum = missiles.missiles.size();
        if(
        wait.running){
            return false;
        }
        if(
        missileNum != 0){            
            delete missiles.missiles[missileNum-1];
        }
        if(
        missileNum == 0){
            wait.playFromStart();
            return false;
        }
        fireAnim.playFromStart();
        return true;        
    }
    
    public var fireAnim = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.05s
                values : [
                        y => y+3 tween Interpolator.LINEAR,                        
                ]
            },
            KeyFrame {
                time : 0.15s
                values : [
                    y => y-3 tween Interpolator.LINEAR,
                        //scaleX => 1 tween Interpolator.LINEAR,
                        //scaleY => 1 tween Interpolator.LINEAR,
                ]
            },
        ]
    }
    
    public var wait = Timeline {
        repeatCount: 1
        keyFrames : [
//            KeyFrame {
//                time : 0s
//                action:function() {}
//            },
            KeyFrame {
                time : 2s
                action:function() {
                    missiles = Missiles{
                        x:30
                        y:30
                        imgName:"shot{imgName}"
                    }                    
                }
            }
        ]
    }   
    
    public function changeX(change){
        if(x + change >= 0 and x + change < SinkAShipGame.SCREENW -this.boundsInLocal.width ){
            x += change;
        }
    }
}