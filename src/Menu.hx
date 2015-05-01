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
	public var mainMenu:Image;
	public var credits_desc:Image;
	public var tutorial_desc:Image;
	public var title:Image;


	public var titleText:TextField;
	public var creditText:TextField;
	public var tutorialText:TextField;


	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		credits_desc = new Image(Root.assets.getTexture("credits"));
		tutorial_desc = new Image(Root.assets.getTexture("tutorial"));
		mainMenu = new Image(Root.assets.getTexture("main_button"));

		menuBG = new Image(Root.assets.getTexture("menu"));
		addChild(menuBG);


		// titleText = new TextField(300,300, "HillBilly \nHighway", "eastwood", 55, 0x000000);
		// titleText.x = 175;
		// titleText.y = 10;
		// titleText.color = 0x000000;	
		title = new Image(Root.assets.getTexture("title_text"));
		title.x = 175;
		title.y = 80;
		addChild(title);

		// creditText = new TextField(300,100, "Credits", "eastwood", 55);
		// creditText.x = 175;
		// creditText.y = 10;
		// creditText.color = 0x000000;

		// tutorialText = new TextField(325,100, "How To Play", "eastwood", 55);
		// tutorialText.x = 150;
		// tutorialText.y = 10;
		// tutorialText.color = 0x000000;	

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
                   	removeChild(title);
                   	removeChild(tutorial_desc);
                   	addChild(credits_desc);
                   	addChild(tutorial);
                   	addChild(mainMenu);
                   	addChild(play);
                   	credits_desc.x = 190;
                   	credits_desc.y = 50;
                   	play.x = 270;
                   	play.y = 420;
                   	mainMenu.x = 420;
                   	mainMenu.y = 420;
                   	tutorial.x = 120;
                   	tutorial.y = 420;
        }});  

        tutorial.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(tutorial, TouchPhase.BEGAN);
                if (touch != null){
                	removeChild(title);
                	removeChild(credits_desc);
                   	removeChild(tutorial);
                   	removeChild(titleText);
                   	addChild(play);
                   	addChild(credits);
                   	addChild(mainMenu);
                   	addChild(tutorial_desc);
                   	tutorial_desc.x = 20;
                   	tutorial_desc.y = 110;
                   	play.x = 270;
                   	play.y = 420;
                   	mainMenu.x = 420;
                   	mainMenu.y = 420;
                   	credits.x = 120;
                   	credits.y = 420;
        }}); 

        mainMenu.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(mainMenu, TouchPhase.BEGAN);
                if (touch != null){
                   	removeChild(mainMenu);
                   	removeChild(credits_desc);
                   	removeChild(tutorial_desc);
                   	addChild(title);
                   	addChild(tutorial);
                   	addChild(credits);
                   	addChild(play);
                   	tutorial.x = 420;
                   	tutorial.y = 420;
                   	play.x = 270;
                   	play.y = 420;
                   	credits.x = 120;
                   	credits.y = 420;
        }}); 

	}

}