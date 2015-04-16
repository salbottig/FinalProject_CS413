import starling.events.*;
import starling.display.*;
import starling.animation.DelayedCall;
import flash.ui.Keyboard;

class Player extends Sprite{
	public var playerImage: Image;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		playerImage = new Image(Root.assets.getTexture("test_player"));

		playerImage.x = (Root.source.stage.stageWidth)/2;
		addChild(playerImage);
	}
}