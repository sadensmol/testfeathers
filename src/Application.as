package {
import feathers.themes.MetalWorksDesktopTheme;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;
import starling.utils.AssetManager;

//todo: state machine, screen navigator...
public class Application extends Sprite{


    public function Application(){
        new MetalWorksDesktopTheme();
}



    public function  start():void {
        //set game screen as one and default screen

        //show background!
        var image:Image = new Image(Texture.fromBitmap(new Assets.BgImage()));
        addChild(image);
        addChild(new GameScreen());
    }

}
}