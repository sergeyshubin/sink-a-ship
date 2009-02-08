package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

public class Explosion extends CustomNode{
    package var x: Number;
    package var y: Number;
    package var exploded = false;
    package var imgHolder: ImageHolder;
    var currImg = imgHolder.images[0];

   
    public var explosion = Timeline {
        repeatCount: 1
        keyFrames: 
        for (image in imgHolder.images) {
            KeyFrame {
                time: 100ms * indexof image 
                action: function(){
                    currImg=image;
                    if(indexof image == 24){
                        exploded = true;
                    }                    
                }
            }
        }
    }    
    
    override public function create(): Node {
        explosion.playFromStart();
        return Group {
            translateX: bind x
            translateY: bind y
            content: bind ImageView {
                image: currImg
            }       
        };
    
    } 

}