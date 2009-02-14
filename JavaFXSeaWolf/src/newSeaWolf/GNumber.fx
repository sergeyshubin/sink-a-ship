package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

public class GNumber extends CustomNode{
    public var x: Number;
    public var y: Number;
    public var num:String;
    public var prefix:String;

    
    override public function create(): Node {
        //var imgName = {prefix}{num};//ovo ne radi!
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




