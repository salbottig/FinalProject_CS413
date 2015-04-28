import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Root;

class FgLayer extends Sprite{

	public var image1:Image;
	public var image2:Image;

	//Placeholders
	// public var image3:Image;
	// public var image4:Image;
	//end Placeholder

	public var parallax:Float;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		image1 = new Image(Root.assets.getTexture("fence_pixel"));
		image2 = new Image(Root.assets.getTexture("fence_pixel"));

		//Placeholder
		// image3 = new Image(Root.assets.getTexture("MidGround_Beg_1"));
		// image4 = new Image(Root.assets.getTexture("MidGround_Beg_1"));

		// image3.y = 0;
		// image4.x = image4.width;
		// image4.y = 0;
		//end Placeholder

		image1.x = 0;
		image1.y = 536;
		image2.y = 536;
		image2.x = image2.width;

		addChild(image1);
		addChild(image2);

		//Placeholders
		// addChild(image3);
		// addChild(image4);
		//end Placeholder
	}
}