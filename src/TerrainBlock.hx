import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Root;

class TerrainBlock extends Sprite{

	public var image:Image;

	public var parallax:Float;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		image = new Image(Root.assets.getTexture("test_terrain"));

		image.x = (Root.source.stage.stageWidth)/2;
		image.y = 500;
		addChild(image);
	}
}