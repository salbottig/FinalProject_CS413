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

	public var parallax:Float;

	public var scenecount:Float = 0;
	public var layercount:Float = 0;

	public function new(t:String){
		super();
		image1 = new Image(Root.assets.getTexture(t));
		image2 = new Image(Root.assets.getTexture(t));
		image3 = new Image(Root.assets.getTexture(t));
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		image1.x = 0;
		image2.x = image2.width-1;
		image3.x = image2.width+image3.width-2;

		addChild(image1);
		addChild(image2);
		addChild(image3);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame() {
		// trace(scenecount);
		if (scenecount / 2 == 1) {
			removeChild(image1);
			image1 = new Image(Root.assets.getTexture("scene3_background"));
			image1.x = 0;
			addChild(image1);
			removeChild(image2);
			image2 = new Image(Root.assets.getTexture("scene3_background"));
			image2.x = image2.width-1;
			addChild(image2);
			removeChild(image3);
			image3 = new Image(Root.assets.getTexture("scene3_background"));
			image3.x = image2.width+image3.width-2;
			addChild(image3);
		}
		if (layercount / 2 == 1) {
			removeChild(image1);
			image1 = new Image(Root.assets.getTexture("scene3_midground"));
			image1.x = 0;
			image1.y = 490;
			addChild(image1);
			removeChild(image2);
			image2 = new Image(Root.assets.getTexture("scene3_midground"));
			image2.x = image2.width-1;
			image2.y = 490;
			addChild(image2);
			removeChild(image3);
			image3 = new Image(Root.assets.getTexture("scene3_midground"));
			image3.x = image2.width+image3.width-2;
			image3.y = 490;
			addChild(image3);
		}
	}
}