import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Root;


class Obstacle extends Image{
	public var active:Bool=false;
	private var type:String;
	private var velocity:Int;

	public function new(){
		super(Root.assets.getTexture("rock"));
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function getType(){return this.type;}

	public function setActive(type:String, sTBlock:TerrainBlock, img_loc:String=null){
		this.texture = Root.assets.getTexture( (img_loc==null)?type:img_loc );
		this.active = true;
		this.type = type;
		this.x = sTBlock.x;
		this.y = sTBlock.y - this.height;
		this.velocity = sTBlock.getVelocity();

		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	public function setNotActive(){
		this.active = false;
		this.x=-this.width;
		this.y=-this.height;
		this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onAddedToStage(event:Event){
		this.x=-this.width;
		this.y=-this.height;
	}
	public function onEnterFrame(event:Event){
		this.x -= velocity;
		if(this.x < -this.width) setNotActive();
	}
}