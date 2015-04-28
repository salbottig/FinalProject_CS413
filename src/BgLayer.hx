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
	}
}