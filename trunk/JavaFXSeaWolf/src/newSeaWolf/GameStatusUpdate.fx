/*
 * GameStatusUpdate.fx
 *
 * Created on 13-Sep-2008, 17:55:16
 */

package newSeaWolf;

import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import java.lang.System;
import javafx.scene.Node;
import javafx.scene.CustomNode;
import javafx.scene.text.Text;
import javafx.scene.Group;
import java.lang.Math;
import javafx.scene.media.MediaPlayer;
import newSeaWolf.SinkAShipGame;

    /**
     * @author Bojan
     */
    public var READY_TO_START = 1;
    public var ACTIVE = 2;

public class GameStatusUpdate extends CustomNode{
    package var gameState:Integer = READY_TO_START;//1-ready to start,2-playing
    var gameText:GameText;
    var background = Background{};
    public var ships: Ship[];
    var explImageHolder = ImageHolder{};
    public var explosions: Explosion[];
    public var missiles1: Missle[];    
    public var missiles2: Missle[];     
    public var keyboard: Keyboard;
    var endGame: Boolean;
    var submarine1 = Submarine{
        x: 20
        y: 430
        imgName: "1"
    }
    var submarine2 = Submarine{
        x: 60
        y: 430
        imgName: "2"
    }
    var points1: Score;
    var points2: Score;
    var gameTime = GameTime{
        x: SinkAShipGame.SCREENW / 2 - 20
        y: 20
    }
;
    
    //Pomeri sve na sceni, proveri sudare 
    var checking: Timeline;
    function showWinner() {        
        endGame = true;
    }

    package function startGame(){
        gameState = ACTIVE;
        points1.points = 0;
        points2.points = 0;
        gameTime.secs = 60;
        shipCreate.playFromStart();
        gameTime.tick.playFromStart();
    }

    function checkKeyboard() {
        if(keyboard.f1){
            startGame();
        }
        if(
        keyboard.left1){
            submarine1.changeX(-5);
        }
        if(
        keyboard.right1){
            submarine1.changeX(5);
        } 
        if(
        keyboard.fire1 and submarine1.fireMissile()){
            var missile = Missle{
                x:submarine1.x + submarine1.boundsInLocal.width / 2
                y:submarine1.y
                imgName:"shot1"
            }
            missile.flight.playFromStart();
            keyboard.fire1 = false;
                        insert missile into missiles1;                       
        } 
        if(
        keyboard.left2){
            submarine2.changeX(-5);
        }
        if(
        keyboard.right2){
            submarine2.changeX(5);
        } 
        if(keyboard.fire2 and submarine2.fireMissile()){
            var missile = Missle{                
                x:submarine2.x + submarine2.boundsInLocal.width / 2
                y:submarine2.y
                imgName:"shot2"
            }
            missile.flight.playFromStart();
            keyboard.fire2 = false;
                        insert missile into missiles2;                        
        }
    }
    //TODO: OVako se favorizuje subMarine1
    function checkBounds() {
        for(ship in ships){
            for(missile in missiles1){            
                if(
                not missile.exploded and not ship.exploded and ship.contains(missile.x, missile.y)){
                    var expl = Explosion{
                        x: ship.x
                        y: ship.y
                        imgHolder:explImageHolder;
                    }                                          
                    expl.explosion.playFromStart();
                    insert expl into explosions;                    
                    missile.flight.stop();
                    missile.exploded = true;
                    ship.exploded = true;                    
                    points1.points += 
                    900 / ship.speed;
                }
                if(
                ship.exploded){
                    delete ship from ships;
                }
                if(
                missile.exploded){
                    delete missile from missiles1;
                }
                if(missile.y < 0){
                    delete missile from missiles1;
                }
            }
            for(missile in missiles2){            
                if(
                not missile.exploded and not ship.exploded and ship.contains(missile.x, missile.y)){
                    var expl = Explosion{
                        x: ship.x
                        y: ship.y
                        imgHolder:explImageHolder;
                    }                                          
                    expl.explosion.playFromStart();
                    insert expl into explosions;                    
                    missile.flight.stop();
                    missile.exploded = true;
                    ship.exploded = true;                    
                    points2.points += 
                    900 / ship.speed;
                }
                if(
                ship.exploded){
                    delete ship from ships;
                }
                if(
                missile.exploded){
                    delete missile from missiles2;
                }
                
                if(missile.y < 0){
                    delete missile from missiles2;
                }
            }
            if(
            ship.x <= - ship.boundsInLocal.width){
                delete ship from ships;
            }            
        }        
        removeExplodedExplosions();        
    }
    
    
    
    function removeExplodedExplosions(){
        for(expl in explosions where expl.exploded == true){
            delete expl from explosions;
        }
    }
    
    function createShip(speed:Integer): Ship{
        var myY = 20;
        if(
        speed == 2){
            myY = 45;
        }
        else {
            myY = speed * 30
        }
        return Ship{
            speed:speed
            x:SinkAShipGame.SCREENW
            y:myY
        }
    }
    
    var shipCreate = Timeline {
        repeatCount: Timeline.INDEFINITE
        keyFrames: [
            KeyFrame {
                time: 1.5s
                action: function() { 
                    var shipPercentage = Math.random() * 100;
                    if(
                    shipPercentage < 30){
                        var ship = createShip(3);                        
                        insert ship into ships;                                                
                    }
                    if(
                    shipPercentage > 30 and shipPercentage < 50){
                        var ship = createShip(2);                        
                        insert ship into ships;                                                
                    }
                    if(shipPercentage > 50 and shipPercentage < 60){
                        var ship = createShip(1);                        
                        insert ship into ships;                                                
                    }
                }
            }
        ]
    }
    override public function create(): Node {
        gameText = GameText{
            visible: bind (gameState == GameStatusUpdate.READY_TO_START)
            translateX:10
            translateY:SinkAShipGame.SCREENH - 85
        }
        points1 = Score{
            prefix:"1_"
            points: 0
            x: bind SinkAShipGame.SCREENW - points1.boundsInLocal.width - 20
            y: 20
        }
        points2 = Score{
            prefix:"2_"
            points: 0
            x: 20
            y: 20
        }
        checking = Timeline {
            repeatCount: Timeline.INDEFINITE
            keyFrames: [
                KeyFrame {
                    time: 0.02s
                    action: function() {
                        checkKeyboard();
                        if(
                        gameState == ACTIVE and gameTime.secs > 0){
                            checkBounds();                            
                        }
                        else {
                            shipCreate.stop();
                            gameState = GameStatusUpdate.READY_TO_START;
                        }
//                        if(endGame == true){
//                            showWinner();
//                            checking.stop();
//                        }


                    }
                }
            ]
        }
        checking.playFromStart();
        //        shipCreate.playFromStart();
        //        println("Sound...");
        //        var s = Sound{};
        //        println("Start...");
        //        s.player.play();
        //        println("Started...");
        //        println("Playing...{(s.player.status==MediaPlayer.PLAYING)}"  );
        
        return Group {
            content: bind [background, missiles1, missiles2, submarine1, submarine2, ships, points1, points2, gameTime, explosions, gameText]
        };
    }
    
}
