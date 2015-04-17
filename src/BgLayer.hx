import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Root;

class BgLayer extends Sprite{

	public var image1:Image;
	public var image2:Image;

	//Placeholders
	public var image3:Image;
	public var image4:Image;
	//end Placeholder

	public var parallax:Float;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		image1 = new Image(Root.assets.getTexture("Beginning_level_bg1"));
		image2 = new Image(Root.assets.getTexture("Beginning_level_bg2"));

		//Placeholder
		image3 = new Image(Root.assets.getTexture("Grass_Ground_proto"));
		image4 = new Image(Root.assets.getTexture("Grass_Ground_proto"));

		image3.y = 490;
		image4.x = image4.width;
		image4.y = 490;
		//end Placeholder

		image1.x = 0;
		image2.x = image2.width;

		addChild(image1);
		addChild(image2);

		//Placeholders
		addChild(image3);
		addChild(image4);
		//end Placeholder
	}
}