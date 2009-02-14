package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;


public class GameTime extends CustomNode{
    var nums:GNumber[];
    package var secs = 60 on replace {
        delete nums;        
        var secsString = secs.toString();
        var i = 0;
        var lenght = secsString.length();        
        while(
        i < lenght){
            var gnum = GNumber{
                prefix:"1_"
                num:secsString.substring(i, i + 1)
                x: (i + 1) * 25
                //y: 20
            }
            insert gnum into nums;
            i=i + 1;
        }
    };
    public-init var x: Number;
    public-init var y: Number;
    
    
    package var tick = Timeline {
        repeatCount: secs
        keyFrames: [
            KeyFrame {
                time: 1s
                action:function() {
                    secs = secs - 1;
                }
            }
        ]
    }
    

    override public function create(): Node {
        //tick.playFromStart();
        return Group {
            translateX: bind x
            translateY: bind y
            content:bind[ImageView {
                    x: -35
                    y: -10
                    image: Image {
                        url: "{__DIR__}images/time.png"
                    }
                },nums
            ]
        }; 
    
    } 

}




