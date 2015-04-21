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

	public var titleText:TextField;


	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		menuBG = new Image(Root.assets.getTexture("menu"));
		addChild(menuBG);


		titleText = new TextField(300,100, "Game Title", "eastwood", 55);
		titleText.x = 175;
		titleText.y = 10;
		titleText.color = 0xFFFFFF;		
		addChild(titleText);

		play = new Image(Root.assets.getTexture("play_button"));
		play.x = 270;
		play.y = 420;
		addChild(play);

		credits = new Image(Root.assets.getTexture("credits_button"));
		credits.x = 120;
		credits.y = 420;
		addChild(credits);

		tutorial = new Image(Root.assets.getTexture("tutorial_button"));
		tutorial.x = 420;
		tutorial.y = 420;
		addChild(tutorial);

		play.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(play, TouchPhase.BEGAN);
                if (touch != null){
                   	var game = new Game();
                   	addChild(game);
        }});  

        credits.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(credits, TouchPhase.BEGAN);
                if (touch != null){
                   	removeChild(credits);
                   	addChild(tutorial);
                   	play.x = 500;
                   	play.y = 500;
                   	tutorial.x = 50;
                   	tutorial.y = 500;
        }});  

        tutorial.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(tutorial, TouchPhase.BEGAN);
                if (touch != null){
                   	removeChild(tutorial);
                   	addChild(credits);
                   	play.x = 500;
                   	play.y = 500;
                   	credits.x = 50;
                   	credits.y = 500;
        }}); 

	}

}