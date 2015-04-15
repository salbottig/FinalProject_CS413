import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;


class Game extends Sprite{

	public var background:Background;

	public function new(){
		super();
		background = new Background();
		background.speed = 10;
		this.addChild(background);

	}

}