package {
import com.greensock.TweenMax;

import feathers.controls.Button;
import feathers.controls.ButtonState;

import flash.events.Event;
import flash.events.EventDispatcher;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

//todo: state machine, screen navigator...
public class GameScreen extends Sprite{

    private var button:Button;
    public var viewEventDispatcher = new EventDispatcher();

    public function GameScreen() {
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
        button = new Button();
        button.setSkinForState (ButtonState.DOWN,new Image( Texture.fromBitmap(new Assets.UpTexture())));
        button.label = "Click Me if you can!!!";
        button.addEventListener( starling.events.Event.TRIGGERED, button_triggeredHandler );
        addChild( button );


        startButtonMoving();
    }

    private function startButtonMoving():void {
        TweenMax.to(button,Math.random()*3.0,{x:Math.random()*width,y:Math.random()*height,onComplete:startButtonMoving});
    }

    function button_triggeredHandler( event:starling.events.Event ):void  {
        viewEventDispatcher.dispatchEvent(new flash.events.Event("event1"));

    }

}
}