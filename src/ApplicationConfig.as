package {
import controller.ApplicationSignal;
import controller.ButtonCatchedCommand;
import controller.ButtonCatchedSignal;

import model.ApplicationModel;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IInjector;
import robotlegs.bender.framework.api.LogLevel;

public class ApplicationConfig implements IConfig {


	[Inject]
	public var context:IContext;

	[Inject]
	public var mediatorMap:IMediatorMap;

    [Inject]
	public var commandMap:ISignalCommandMap;

	[Inject]
	public var injector:IInjector;

	[Inject]
	public var contextView:ContextView;

	public function configure():void {

		context.logLevel = LogLevel.DEBUG;

		mapMediators();
		mapCommands();
		mapModels();

		context.afterInitializing( onAfterInitializing );
	}

	private function onAfterInitializing():void {
	}

	private function mapModels():void {
        injector.map(ApplicationModel).asSingleton();
	}

	private function mapCommands():void {
        injector.map(ApplicationSignal).asSingleton();
        injector.map(ButtonCatchedSignal).asSingleton();

        commandMap.map(ButtonCatchedSignal).toCommand(ButtonCatchedCommand);
	}

	private function mapMediators():void {
        mediatorMap.map(GameScreen).toMediator(GameMediator);
    }

}
}
