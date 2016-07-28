package view.theme {
import feathers.controls.Button;
import feathers.controls.text.TextFieldTextRenderer;
import feathers.core.ITextRenderer;
import feathers.themes.MetalWorksDesktopTheme;

import flash.text.TextFormat;

import starling.display.Image;
import starling.textures.Texture;

//we extend here desktop theme just as example
//to get it working on desktop for test purposes

public class TestFeathersTheme extends MetalWorksDesktopTheme{
    public function TestFeathersTheme() {
        super();
    }

    override protected function initializeStyleProviders():void
    {
        super.initializeStyleProviders(); // don't forget this!

        this.getStyleProviderForClass( Button )
                .setFunctionForStyleName( "custom-button", this.setCustomButtonStyles );
    }

    private function setCustomButtonStyles( button:Button ):void    {
        //can't find any way to draw rounded rectangle in starling. what a shame!! ))


        button.defaultSkin = new Image(Texture.fromBitmap(new Assets.ButtonBgImage()));
        button.downSkin = new Image(Texture.fromBitmap(new Assets.ButtonBgImage()));
        button.labelFactory = function():ITextRenderer
        {
            return new TextFieldTextRenderer();
        };
        button.defaultLabelProperties.textFormat = new TextFormat( "_sans", 36, 0xffffff );
    }
}
}
