/*
 * Keyboard.fx
 *
 * Created on 10-Sep-2008, 23:53:20
 */

package newSeaWolf;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.animation.Interpolator;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import java.lang.System;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;

/**
 * @author Bojan
 */

public class Keyboard extends CustomNode{
    package var left1 = false;
    package var right1 = false;
    package var fire1 = false;
    
    package var left2 = false;
    package var right2 = false;
    package var fire2 = false;

    package var f1 = false;

    override var onKeyPressed = function ( e: KeyEvent ):Void {
        if (e.code == KeyCode.VK_LEFT) {
            left1 = true;
        }else if (e.code == KeyCode.VK_RIGHT) {
            right1 = true;
        }
        else if (e.code == KeyCode.VK_UP) {
            fire1 = true;
        }        
        else if (e.code == KeyCode.VK_A) {
            left2 = true;
        }
        else if (e.code == KeyCode.VK_D) {
            right2 = true;
        }        
        else if (e.code == KeyCode.VK_W) {
            fire2 = true;
        }
        else if (e.code == KeyCode.VK_F1) {
            f1 = true;
        }
    }
    
    override var onKeyReleased =  function( e: KeyEvent ):Void {
        if (e.code == KeyCode.VK_LEFT) {
            left1 = false;
        }else if (e.code == KeyCode.VK_RIGHT) {
            right1 = false;
        }
        else if (e.code == KeyCode.VK_UP) {
            fire1 = false;
        }       
        else if (e.code == KeyCode.VK_A) {
            left2 = false;
        }
        else if (e.code == KeyCode.VK_D) {
            right2 = false;
        }
        else if (e.code == KeyCode.VK_W) {
            fire2 = false;
        }
        else if (e.code == KeyCode.VK_F1) {
            f1 = false;
        }
    }
    
    override public function create(): Node {
        return Text {            
            content: "Keyboard"
        };
    }
}
