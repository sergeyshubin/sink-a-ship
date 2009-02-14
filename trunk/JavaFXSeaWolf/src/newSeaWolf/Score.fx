package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;

public class Score extends CustomNode{
    public var prefix:String;
    public var points = 0 on replace {
        delete nums;        
        var pointsString = points.toString();
        var i = 0;
        var lenght = pointsString.length();
        while(
        i < lenght){
            var gnum = GNumber{
                prefix:prefix
                num:pointsString.substring(i, i + 1)
                x:i * 25
            }
            insert gnum into nums;
            i=i + 1;
        }
    }
    public var x: Number;
    public var y: Number;
    var nums:GNumber[];
    
    
    override public function create(): Node {
        
        return Group {
            translateX: bind x
            translateY: bind y
            content: bind[nums]     
        }; 
    
    } 

}




