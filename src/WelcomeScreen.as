package {
import com.greensock.TweenMax;

import feathers.controls.Button;
import feathers.controls.ButtonState;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalAlign;
import feathers.layout.VerticalLayout;

import flash.events.Event;
import flash.events.EventDispatcher;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

//todo: state machine, screen navigator...
public class WelcomeScreen extends Sprite{

    private var button:Button;
    public var viewEventDispatcher = new EventDispatcher();

    //it's better to use feathers sdk to create views in mxml as the easiest way to support/maintain
    private var layout:VerticalLayout;

    private var flag:Image;
    private var text:Label;

    private var selectButton:Button;

    public function WelcomeScreen() {
        createElements();
    }

    public function stop():void {
        destroyElements();
    }

    private function destroyElements():void {
        //delete button
        removeChild(button);
        TweenMax.killTweensOf(button);
    }
    private function createElements():void {

        //create layout first
        layout = new VerticalLayout();
        layout.horizontalAlign=HorizontalAlign.CENTER;

        var container:LayoutGroup = new LayoutGroup();
        container.layout = layout;
        addChild( container );

        //create flag
        flag = new Image(Texture.fromBitmap(new Assets.BgImage()));
        container.addChild(flag);


        //create select button
        selectButton = new Button();
        selectButton.setSkinForState (ButtonState.DOWN,new Image( Texture.fromBitmap(new Assets.UpTexture())));
        selectButton.label = "Pick your country";
        selectButton.styleNameList.add( "custom-button" );
        selectButton.addEventListener( starling.events.Event.TRIGGERED, button_triggeredHandler );


        container.addChild(selectButton);
    }

    private function startButtonMoving():void {
//        TweenMax.to(button,Math.random()*3.0,{x:Math.random()*width,y:Math.random()*height,onComplete:startButtonMoving});
    }

    function button_triggeredHandler( event:starling.events.Event ):void  {
        viewEventDispatcher.dispatchEvent(new flash.events.Event("event1"));

    }

}
}