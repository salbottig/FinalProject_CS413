import starling.display.*;
import starling.text.*;
import starling.core.Starling;
import starling.utils.*;
import starling.events.*;
import flash.ui.Keyboard;
import Root;

class Score extends Sprite{
	public var score:Int;
	public var scoreText:TextField;
	public function new(){
		super();
		score = 0;
		scoreText = new TextField(635,150, "Score: " + score, "eastwood", 35);
		scoreText.color = 0x000000;
		addChild(scoreText);
		//addEventListener(KeyboardEvent.KEY_DOWN, keyDown); //debugging
	}

	public function update(){
		scoreText.text = "Score: " + score;		
	}

	public function addPoints(points:Int){
		score += points;
		update();
	}

	/*function keyDown(event : KeyboardEvent){ //debugging
		trace("Keydown");
		addPoints(100);
	}*/
}