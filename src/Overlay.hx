import starling.display.*;
import Health;
import Score;
import Root;

class Overlay extends Sprite{
	public var score:Score;
	public var health:Health;
	public function new(){
		super();
		score = new Score();
		health = new Health();
		score.x = flash.Lib.current.stage.stageWidth - score.width;
		addChild(health);
		addChild(score);
	}
}