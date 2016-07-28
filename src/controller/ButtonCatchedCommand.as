package controller {
import model.ApplicationModel;

import robotlegs.bender.bundles.mvcs.Command;

public class ButtonCatchedCommand extends Command{

    [Inject]
    public var appModel:ApplicationModel;

    [Inject]
    public var appSignal:ApplicationSignal;

    override public function execute():void {

        trace("Button catched!!!");
        appModel.clickCount++;

        if (appModel.clickCount>10){
            appSignal.dispatch(ApplicationSignal.FINISHED);
        }


    }
}
}
