package {

import flash.display.Sprite;
import flash.events.Event;
import flash.system.Capabilities;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;
import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

import starling.core.Starling;
import starling.events.Event;

[SWF(width="800", height="600", frameRate="30", backgroundColor="#000000")]
public class Main extends Sprite {


    private const StageWidth:int  = 320;
    private const StageHeight:int = 480;

    private var _starling:Starling;
    private var _context:IContext;

    public function Main() {
        addEventListener(flash.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected function onAddedToStage(event:flash.events.Event):void
    {
        stage.autoOrients = true;

        Starling.multitouchEnabled = true;

        _starling = new Starling(Application, stage);
        _starling.showStats = true;
        _starling.enableErrorChecking = Capabilities.isDebugger;
        _starling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
        _starling.start();

    }

    private function onRootCreated(event:starling.events.Event):void {
        _context = new Context();
        _context.install(MVCSBundle,StarlingViewMapExtension,SignalCommandMapExtension);
        _context.configure(ApplicationConfig, _starling, new ContextView( this ));



        (_starling.root as Application).start();
    }
}
}
