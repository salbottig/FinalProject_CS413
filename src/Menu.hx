import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;
import flash.geom.Rectangle;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.Event;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;
import Game;

class Menu extends Sprite{ 

	public var game:Game;

	public var menuBG:Image;

	public var play:Image;
	public var credits:Image;
	public var tutorial:Image;


	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		menuBG = new Image(Root.assets.getTexture("menu"));
		addChild(menuBG);

		play = new Image(Root.assets.getTexture("play"));
		play.x = 300;
		play.y = 320;
		addChild(play);

		play.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(play, TouchPhase.BEGAN);
                if (touch != null){
                   	var game = new Game();
                   	addChild(game);
        }});  

	}

}