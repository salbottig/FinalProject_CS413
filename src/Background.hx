import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Math;
import Root;
import BgLayer;

class Background extends Sprite{
	public var layer:BgLayer;
	public var midLayer:BgLayer;

	public var speedBack:Float = 0;
	public var speedMid:Float = 0;

	public var GrantCount:Float = 0;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		layer = new BgLayer("Beginning_level_bg1");
		layer.parallax = .1;
		this.addChild(layer);

		midLayer = new BgLayer("MidGround_Beg_1");
		midLayer.parallax = .2;
		this.addChild(midLayer);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event){
		if (GrantCount / 10 == 1) {
			this.removeChild(layer);
			layer = new BgLayer("scene3_background");
			layer.parallax = .1;
			this.addChild(layer);

			this.removeChild(midLayer);
			midLayer = new BgLayer("MidGround_Beg_1");
			midLayer.parallax = .2;
			this.addChild(midLayer);
		}
		layer.x -= Math.ceil(speedBack*layer.parallax);
		if(layer.x < -2*stage.stageWidth) {
			layer.x = 0;
			GrantCount = GrantCount + 1;
		}
		midLayer.x -= Math.ceil(speedMid*midLayer.parallax);
		if(midLayer.x < -2*stage.stageWidth) midLayer.x = 0;
	}

	public function cleanup(){
		this.removeChildren();
		this.removeEventListeners();
	}
}