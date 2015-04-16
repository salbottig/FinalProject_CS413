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
		player.x = Root.source.stage.stageWidth/2;
		this.addChild(player);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event){
		var pBounds = player.bounds;
		var collisionY = false;
		var collisionX = false;
		var velocity = 0.0;
		for(terrainBlock in terrain.pieces){
			if(pBounds.intersects(terrainBlock.bounds)){
				if(player.y +player.height <= terrainBlock.y + 5)collisionY = true;
				if(player.x < terrainBlock.x && player.y + player.height >= terrainBlock.y+5){
					collisionX = true;
					velocity = terrainBlock.getVelocity();
				}
			}
		}
		if(!collisionY)player.y+=1;
		if(collisionX)player.x-= velocity;
	}
}