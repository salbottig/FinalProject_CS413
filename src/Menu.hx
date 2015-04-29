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
	public var creditText:TextField;
	public var tutorialText:TextField;
	public var names:TextField;
	public var instructions:TextField;


	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		menuBG = new Image(Root.assets.getTexture("menu"));
		addChild(menuBG);


		titleText = new TextField(500,100, "HillBilly Highway", "eastwood", 55);
		titleText.x = 80;
		titleText.y = 225;	
		addChild(titleText);

		creditText = new TextField(300,100, "Credits", "eastwood", 55);
		creditText.x = 165;
		creditText.y = 10;

		tutorialText = new TextField(325,100, "How To Play", "eastwood", 55);
		tutorialText.x = 165;
		tutorialText.y = 10;

		play = new Image(Root.assets.getTexture("play_button"));
		play.x = 270;
		play.y = 325;
		addChild(play);

		credits = new Image(Root.assets.getTexture("credits_button"));
		credits.x = 120;
		credits.y = 325;
		addChild(credits);

		tutorial = new Image(Root.assets.getTexture("tutorial_button"));
		tutorial.x = 420;
		tutorial.y = 325;
		addChild(tutorial);

		names = new TextField(500,500, "
											   Anthony Black
											   Christopher Heiser
											   Erin Bailey
											   Salvatore Bottiglieri
											   Tanner Stevens
											   Veronika Alves","eastwood", 30);
		names.x = 50;
		names.y = 10;

		instructions = new TextField(500,500, "Guide HillBilly over the obstacles with the space bar. Collect other HillBilly's to obtain lives.", "eastwood", 25);
		instructions.x = 70;
		instructions.y = 25;

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
                   	removeChild(titleText);
                   	removeChild(tutorialText);
                   	removeChild(instructions);
                   	addChild(tutorial);
                   	addChild(creditText);
                   	play.x = 500;
                   	play.y = 500;
                   	tutorial.x = 50;
                   	tutorial.y = 500;
                   	addChild(names);
        }});  

        tutorial.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(tutorial, TouchPhase.BEGAN);
                if (touch != null){
                   	removeChild(tutorial);
                   	removeChild(creditText);
                   	removeChild(titleText);
                   	removeChild(names);
                   	addChild(tutorialText);
                   	addChild(credits);
                   	addChild(instructions);
                   	play.x = 500;
                   	play.y = 500;
                   	credits.x = 50;
                   	credits.y = 500;
        }}); 

	}

}