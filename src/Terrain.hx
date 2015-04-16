import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Math;
import Root;
import TerrainBlock;

class Terrain extends Sprite{
	public var piece:TerrainBlock;
	public var piece2:TerrainBlock;

	public var type:String = "terrain";

	public var speed:Float = 5;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		piece = new TerrainBlock();
		piece.parallax = .2;
		this.addChild(piece);

		piece2 = new TerrainBlock();
		piece2.y = -50;
		piece2.parallax = .2;
		this.addChild(piece2);		

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event){
		piece2.x -= Math.ceil(speed*piece.parallax);
		if(piece2.x < -stage.stageWidth) piece2.x = stage.stageWidth;
	}
}