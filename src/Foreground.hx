import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Math;
import Root;
import FgLayer;

class Foreground extends Sprite{
	public var layer:FgLayer;

	public var speed:Float = 0;

	public function new(){
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

	}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		layer = new FgLayer();
		layer.parallax = .4;
		this.addChild(layer);

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event){
		layer.x -= Math.ceil(speed*layer.parallax);
		if(layer.x < -stage.stageWidth) layer.x = 0;
	}
	public function cleanup(){
		this.removeChildren();
		this.removeEventListeners();
	}
}