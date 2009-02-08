package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

public class Background extends CustomNode{

    override public function create(): Node {
        
        return Group {
            cache:true
            translateX: 0
            translateY: 0
            content: ImageView {
                image: Image {
                    url: "{__DIR__}images/BackGround.gif"
                }
            }
        }; 
    
    } 

}




