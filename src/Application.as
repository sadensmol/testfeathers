package {
import feathers.themes.MetalWorksDesktopTheme;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;
import starling.utils.AssetManager;

import view.theme.TestFeathersTheme;

//todo: state machine, screen navigator...
public class Application extends Sprite{


    public function Application(){

        // extend some example theme according to CL-4 )
        new TestFeathersTheme();
}

    public function  start():void {
        //set welcome screen as the only one and default screen

//        //show background!
//        var image:Image = new Image(Texture.fromBitmap(new Assets.BgImage()));
//        addChild(image);
        addChild(new WelcomeScreen());
    }

}
}