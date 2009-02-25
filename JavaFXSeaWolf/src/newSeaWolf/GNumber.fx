package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
/**
 * Graphical number in scene.
 * Used for player score and game time.
 */

public class GNumber extends CustomNode{
    public var x: Number;
    public var y: Number;
    public var num:String;//number to show
    public var prefix:String;//determines number color

    
    override public function create(): Node {
        return Group {
            cache: true
            translateX: bind x
            translateY: bind y
            content: bind [
                ImageView {
                    image: Image {
                        url: "{__DIR__}images/{prefix}{num}.png"
                    }
                }
            ]
        }; 
    
    } 

}




