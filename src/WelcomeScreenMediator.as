package {

import controller.ApplicationSignal;
import controller.ButtonCatchedSignal;

import feathers.controls.Alert;
import feathers.data.ListCollection;

import flash.events.Event;

import robotlegs.bender.bundles.mvcs.Mediator;

public class WelcomeScreenMediator extends Mediator {

    [Inject]
    public var view:WelcomeScreen;

    [Inject]
    public var buttonCatchedSignal:ButtonCatchedSignal;


    [Inject]
    public var appSignal:ApplicationSignal;

    override public function initialize():void {
        trace("game mediator initialized");


        eventMap.mapListener(view.viewEventDispatcher,"event1",onButtonCatched);

        appSignal.add(onAppSignal);
    }

    private function onButtonCatched(event:Event):void {
        buttonCatchedSignal.dispatch();
    }


    private function onAppSignal(action:String):void {

        if(!action) return;

        switch (action) {
            case ApplicationSignal.FINISHED:
                view.stop();
                var alert:Alert = Alert.show( "Congrats!", "Game is done!!!", new ListCollection(
                        [
                            { label: "OK",triggered: okButton_triggeredHandler }
                        ]));

                break;

        }
    }

    private function okButton_triggeredHandler(): void{

    }
}
}
