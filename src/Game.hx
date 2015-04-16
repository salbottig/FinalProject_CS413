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
		var pBounds = player.bounds;
		var collision = false;
		for(terrainBlock in terrain.pieces){
			if(pBounds.intersects(terrainBlock.bounds)){
				collision=true;
				player.x-=terrainBlock.getVelocity();
				break;
			}
		}
		if(!collision)player.y+=1;
	}
}