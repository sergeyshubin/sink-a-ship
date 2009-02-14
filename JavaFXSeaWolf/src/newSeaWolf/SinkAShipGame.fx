/*
 * SinkAShip.fx
 *
 * Created on 13-Sep-2008, 17:06:25
 */

package newSeaWolf;

import javafx.scene.Scene;
import javafx.stage.Stage;
import java.lang.System;

/**
 * @author Bojan
 */

public class SinkAShip {

}

package var SCREENW = 800;
package var SCREENH = 600;

var kb = Keyboard {}
var gameStatusUpdate = GameStatusUpdate{    
    keyboard: kb
}

var scene = Scene {
    content: [kb, gameStatusUpdate]
}

var mainFrame: Stage;

function run(__ARGS__ : String[]) {
mainFrame = Stage {
    title: "Sink a Ship"
    width: SCREENW
    height: SCREENH
    resizable:false
    onClose: function() {
        System.exit( 0 );
    }
    visible: true
    scene: scene
}
}

