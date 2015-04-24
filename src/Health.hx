import starling.display.*;
import starling.text.*;
import starling.utils.*;
import Root;
import starling.events.*;
import flash.ui.Keyboard;

class Health extends Sprite{
	public var health:Int;
	public var healthBar:Array<Image>;
	public var healthText:TextField;
	public function new(){
		super();
		health = 5;
		healthBar = [];
		for(i in 0...health){
			var image = new Image(Root.assets.getTexture("hillbillypoint"));
			image.scaleX = .5;
			image.scaleY = .5;
			healthBar.push(image);
		}
		healthText = new TextField(64, 16, "Hillbillies: ");
		addChild(healthText);
		for(i in 0...healthBar.length){
			healthBar[i].x = 64 + i*16;
			addChild(healthBar[i]);
		}
		//addEventListener(KeyboardEvent.KEY_DOWN, keyDown); //debugging
	}

	public function update(){
		//trace("update"); //debugging
		for(i in 0...health){
			healthBar[i].texture = Root.assets.getTexture("hillbillypoint");
		}
		for(i in 0...healthBar.length){
			if(i<health) healthBar[i].visible = true;
			else healthBar[i].visible = false;
		}
	}

	public function loseHealth(){
		//trace("lostHealth"); //debugging
		if(health > 0) health--;
		if(isDead()){
			update();
			//death animation
		}
		else{
			update();
		}
	}

	public function addHealth(){
		if (health < 3) health++;
		//trace(health);
		update();
		
	}

	public function isDead():Bool{
		if (health <= 0){
			return true;
		}
		else{
			return false;
		}
	}

	/*function keyDown(event : KeyboardEvent){ //debugging
		trace("Keydown");
		loseHealth();
	}*/
}
