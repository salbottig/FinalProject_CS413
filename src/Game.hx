import starling.animation.*;
import starling.core.Starling;
import starling.display.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import flash.ui.Keyboard;


class Game extends Sprite{

	public var background:Background;
	public var terrain:Terrain;
	public var player:Player;
	public var jumpinprogress:Bool = false;
	public var overlay:Overlay;

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
		overlay = new Overlay();
		this.addChild(overlay);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	public function onEnterFrame(event:Event){
		overlay.score.addPoints(1*(1+overlay.health.health));
		var pBounds = player.bounds;
		var collisionY = false;
		var collisionX = false;
		var velocity = 0.0;
		if (overlay.health.isDead()){
			//GAMEOVER
			trace("Dead");
		}
		for(terrainBlock in terrain.pieces){
			if(pBounds.intersects(terrainBlock.bounds)){
				if(player.y +player.height <= terrainBlock.y + 5){
					if(!jumpinprogress){
						player.jumping = false;
					}
					collisionY = true;
				}
				if(player.x + player.width < terrainBlock.x+5 && player.y + player.height >= terrainBlock.y+5){
					collisionX = true;
					velocity = terrainBlock.getVelocity();
				}
			}
		}
		for(obstacle in terrain.obstacles){
			if(pBounds.intersects(obstacle.bounds)){
				overlay.health.loseHealth();
				obstacle.active=false;
			}
		}
		if(!collisionY && !jumpinprogress){
			player.y+=2;
			player.jumping = true;
		}
		if(collisionX)player.x-= velocity;
		else{
			player.x += ((stage.stageWidth-player.width)/2 -player.x)/60;
		}

		var t = Math.random()*100;
		if(t<55 && t>45){ 
			var t = Math.ceil(Math.random()*5);
			switch(t){
				case 1: terrain.obstacleQ.add("hay");
				case 2: terrain.obstacleQ.add("stump");
				case 3: terrain.obstacleQ.add("tire");
				case 4: terrain.obstacleQ.add("squirrel");
				default: terrain.obstacleQ.add("rock");
			}
		}
	}

	public function onKeyDown(event:KeyboardEvent){
		if(event.keyCode == Keyboard.SPACE){
			if(!player.jumping){
				player.jumping = true;
				jumpinprogress = true;
				var playerY = player.y - 60;
				Starling.juggler.tween(player, .5, {
                                        transition: Transitions.LINEAR,
                                        y: playerY,
                                        onComplete: function(){jumpinprogress = false;}
                                        });
			}
		}
	}
}