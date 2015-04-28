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
	public var image3:Image;

	//Placeholders
	public var image4:Image;
	public var image5:Image;
	public var image6:Image;
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
		image3 = new Image(Root.assets.getTexture("Beginning_level_bg1"));

		//Placeholder
		image4 = new Image(Root.assets.getTexture("MidGround_Beg_1"));
		image5 = new Image(Root.assets.getTexture("MidGround_Beg_1"));
		image6 = new Image(Root.assets.getTexture("MidGround_Beg_1"));

		image3.y = 0;
		image5.x = image5.width;
		image4.y = 0;
		image6.x = image5.width + image6.width;
		//end Placeholder

		image1.x = 0;
		image2.x = image2.width;
		image3.x = image2.width+image3.width;

		addChild(image1);
		addChild(image2);
		addChild(image3);
		//Placeholders
		addChild(image4);
		addChild(image5);
		addChild(image6);
		//end Placeholder
	}
}