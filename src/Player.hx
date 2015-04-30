import starling.events.*;
import starling.display.*;
import starling.animation.DelayedCall;
import flash.ui.Keyboard;

class Player extends Sprite{
	public var playerImage: Image;
	public var jumping:Bool = false;

	public var time:Int = 0;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		playerImage = new Image(Root.assets.getTexture("hilbilly1walk1"));
		addChild(playerImage);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event) {
		walk();
	}

	public function walk() {
		if (time > 15) {
			removeChild(playerImage);
			playerImage = new Image(Root.assets.getTexture("hilbilly1walk2"));
			addChild(playerImage);
		}
		if (time > 30) {
			removeChild(playerImage);
			playerImage = new Image(Root.assets.getTexture("hilbilly1walk1"));
			addChild(playerImage);
			time = 0;
		}
		time = time + 1;
	}
	public function cleanup(){
		this.removeChildren();
		this.removeEventListeners();
	}
}