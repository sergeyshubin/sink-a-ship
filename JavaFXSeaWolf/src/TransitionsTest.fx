
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.animation.transition.ParallelTransition;
import javafx.animation.transition.TranslateTransition;
import javafx.animation.transition.SequentialTransition;
import javafx.animation.transition.PauseTransition;
import javafx.animation.transition.FadeTransition;
import javafx.animation.transition.RotateTransition;
import javafx.animation.transition.ScaleTransition;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import javafx.scene.input.MouseEvent;

/*
 * TransitionsTest.fx
 *
 * Created on 07-Feb-2009, 14:57:20
 */


 /**
 * @author Bojan
 */
var node1 = Circle {
    centerX: 50,
    centerY: 50
    radius: 40
    fill: Color.BLACK
}
var node2 = Circle {
    centerX: 50,
    centerY: 120
    radius: 40
    fill: Color.BLACK
}

var parallelTransition = ParallelTransition{
    content: [SequentialTransition {
            node: node1
            content: [
                PauseTransition {
                    duration: 1s },  // wait a second
                FadeTransition {
                    duration: 3s
                    fromValue: 1.0
                    toValue: 0.3
                    repeatCount:4
                    autoReverse: true},
                TranslateTransition {
                    duration: 2s
                    byX: -100
                    repeatCount:2
                    autoReverse: true},
                TranslateTransition {
                    duration: 2s
                    byX: 100
                    repeatCount:2
                    autoReverse: true},
                RotateTransition {
                    duration: 3s
                    byAngle: 180
                    repeatCount:4
                    autoReverse: true},
                ScaleTransition {
                    duration: 2s
                    node: node1
                    byX: 1.5
                    byY: 1.5
                    repeatCount:2
                    autoReverse: true},
            ]},
        TranslateTransition{
            duration:300ms
            node:node2
            byX: 100
        }

    ]
}
function run(__ARGS__ : String[]) {
Stage {
    title: "MyApp"
    scene: Scene {
        width: 200
        height: 200
        content: [
            node1=Circle{
                centerX: 50,
                centerY: 50
                radius: 40
                fill: Color.BLACK
                onMouseEntered:function(e:MouseEvent){
                    parallelTransition.play();
                }}, node2]
    }

}
}