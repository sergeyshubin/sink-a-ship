/*
 * ImageHolder.fx
 *
 * Created on 04-Oct-2008, 09:43:11
 */

package newSeaWolf;
import javafx.scene.image.Image;
/**
 * @author Bojan
 */

public class ImageHolder{
    public var images =
    for (i in [0..24]) {
        Image { url: "{__DIR__}images/expl00{i}.png"};
    }
}
