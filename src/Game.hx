import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;


class Game extends Sprite{

	public var background:Background;
	public var terrain:Terrain;
	public var player:Player;

	public function new(){
		super();
		background = new Background();
		background.speed = 10;
		this.addChild(background);
		terrain = new Terrain();
		this.addChild(terrain);
		player = new Player();
		this.addChild(player);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event){
		//var bounds1 = player.bounds;
		//var bounds2 = terrain.piece.bounds;
		//var bounds3 = terrain.piece2.bounds;
		//if (bounds1.intersects(bounds2)) {} 
		//else player.y += 1;
		//if (bounds1.intersects(bounds3)) player.x -= terrain.speed;
	}
}