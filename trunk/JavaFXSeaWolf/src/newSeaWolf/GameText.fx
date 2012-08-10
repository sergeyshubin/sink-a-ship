/*
 * GameText.fx
 *
 * Created on 18-Dec-2008, 00:13:07
 */

package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
//could be better
package class GameText extends CustomNode {


    public override function create(): Node {
        return Group {
            content: [Text {
                    fill:Color.SKYBLUE
                    font: Font {
                        size: 20
                    }
                    x: 10
                    y: 30
                    content: "Press F1 to start \n"
                    "Use:\n"
                    "letters W-A-D for green submarine\n"
                    "arrow keys for yellow submarine"
            }]
        };
    }
}