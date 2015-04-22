import starling.display.*;
import starling.text.TextField;
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
		scoreText = new TextField(128, 16, "Score: " + score);
		scoreText.hAlign = HAlign.LEFT;
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