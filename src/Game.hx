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
	public var foreground:Foreground;
	public var jumpinprogress:Bool = false;
	public var overlay:Overlay;

	public function new(){
		super();
		background = new Background();
		background.speedBack = .1;
		background.speedMid = 1;
		this.addChild(background);
		terrain = new Terrain();
		this.addChild(terrain);

		// Chris is testing backgrounds here
		// var layers:Array<BackgroundLayer> = new Array();
		//higher int, faster scrolling
		// layers.push(new BackgroundLayer(assets.getTexture("pond_reeds"), 2, false));
		// layers.push(new BackgroundLayer(assets.getTexture("fence_ground"), 5, false));
		// var fieldBG = new LevelBackground(layers);
		// addChild(fieldBG);

		player = new Player();
		player.x = (Root.source.stage.stageWidth-player.width)/2;
		player.y = 400;
		this.addChild(player);
		foreground = new Foreground();
		this.addChild(foreground);
		overlay = new Overlay();
		this.addChild(overlay);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	public function onEnterFrame(event:Event){
		overlay.score.addPoints(1*overlay.health.health);
		var pBounds = player.bounds;
		var collisionY = false;
		var collisionX = false;
		var velocity = 0.0;
		if (overlay.health.isDead()){
			//GAMEOVER
			//trace("Dead");
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
				if(obstacle.getType()=='hilbilly1' && obstacle.getActive()){
					obstacle.setNotActive();
					this.overlay.health.addHealth();

				}
				else if (obstacle.getType()!='hilbilly1' && obstacle.getActive()){
					this.overlay.health.loseHealth();
					obstacle.setNotActive();
				}
			}
		}
		if(!collisionY && !jumpinprogress){
			player.y+=2;
			player.jumping = true;
		}
		if(collisionX)player.x-= velocity;
		else if(!player.jumping){
			player.x += ((stage.stageWidth-player.width)/2 -player.x)/60;
		}

		var t = Math.floor(Math.random()*((900-Math.floor(this.overlay.score.score/1000))+100) );
		if(t==50){ 
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
				var playerY = player.y - 190;
				var playerX = player.x + 15;
				Starling.juggler.tween(player, 1.5,	 {
                                        transition: Transitions.LINEAR,
                                        y: playerY,
                                        x: playerX,
                                        onComplete: function(){jumpinprogress = false;}
                                        });
			}
		}
	}
}