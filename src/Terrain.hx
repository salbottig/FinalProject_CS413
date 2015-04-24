import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Math;
import Root;
import TerrainBlock;
import Obstacle;

class Terrain extends Sprite{
	public var pieces:Array<TerrainBlock>;
	public var obstacles:Array<Obstacle>;
	public var obstacleQ:List<String>;
	public var type:String = "terrain";
	public var type_img:String = "test_terrain";
	public var speed:Float = 5;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		pieces = new Array<TerrainBlock>();
		obstacles = new Array<Obstacle>();
		obstacleQ = new List<String>();
		var height:Float = 0;
		var text = Root.assets.getTexture(type_img);
		for(i in 0...Math.ceil((Root.source.stage.stageWidth)/text.nativeWidth)+1){
			height = 1.5;
			pieces[i]=new TerrainBlock(i*text.nativeWidth, speed, type_img, .2, height, RecycleTerrainBlock);
			addChild(pieces[i]);

			obstacles[i]=new Obstacle();
			addChild(obstacles[i]);
		}
	}

	public function RecycleTerrainBlock(tBlock:TerrainBlock){
		//var tBlock_pIndex = pieces.indexOf(tBlock);
		//var preceedingHeight = pieces[((tBlock_pIndex==0)? pieces.length : tBlock_pIndex)-1].getHeight();
		//var thisHeight = (Math.ceil(Math.random()*(preceedingHeight))+1)%14;
		tBlock.setHeight(1.5);
		tBlock.x=Root.source.stage.stageWidth;

		if(obstacleQ.first() != null){
			RecycleObstacle(obstacleQ.pop(), tBlock);
		}
	}

	public function RecycleObstacle(type:String, tBlock:TerrainBlock){
		for(obstacle in obstacles){
			if(!obstacle.getActive()) obstacle.setActive(type, tBlock);
		}
	}
}