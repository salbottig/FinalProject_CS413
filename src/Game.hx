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
		var pBounds = player.bounds;
		var collisionY = false;
		var collisionX = false;
		var velocity = 0.0;
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
				if(obstacle.getType()=='hilbilly1'){
					obstacle.setNotActive();
					this.overlay.health.addHealth();
				}
				else{
					this.overlay.health.loseHealth();
					// losing health needs tweaking so we don't instantly die, check to see how long ago our last collision was? if same object?
					if(player.y +player.height <= obstacle.y + 5){
						if(!jumpinprogress){
							player.jumping = false;
						}
						collisionY = true;
					}
					if(player.x + player.width < obstacle.x+5 && player.y + player.height >= obstacle.y+5){
						collisionX = true;
						velocity = obstacle.getVelocity();
					}
				}
			}
		}
		if(!collisionY && !jumpinprogress){
			player.y+=1;
			player.jumping = true;
		}
		if(collisionX)player.x-= velocity;
		else if(!player.jumping){
			player.x += ((stage.stageWidth-player.width)/2 -player.x)/60;
		}

		var t = Math.random()*100;
		if(t<55 && t>45){ 
			var t = Math.ceil(Math.random()*6);
			switch(t){
				case 1: terrain.obstacleQ.add("hay");
				case 2: terrain.obstacleQ.add("stump");
				case 3: terrain.obstacleQ.add("tire");
				case 4: terrain.obstacleQ.add("squirrel");
				case 5: terrain.obstacleQ.add("hilbilly1");
				default: terrain.obstacleQ.add("rock");
			}
		}
	}

	public function onKeyDown(event:KeyboardEvent){
		if(event.keyCode == Keyboard.SPACE){
			if(!player.jumping){
				player.jumping = true;
				jumpinprogress = true;
				var playerY = player.y - 112;
				var playerX = player.x + 64;
				Starling.juggler.tween(player, .75, {
                                        transition: Transitions.EASE_OUT,
                                        y: playerY,
                                        x: playerX,
                                        onComplete: function(){jumpinprogress = false;}
                                        });
			}
		}
	}
}