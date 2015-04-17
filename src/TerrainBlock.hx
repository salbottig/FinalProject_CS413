import starling.display.*;
import starling.animation.*;
import starling.events.*;
import starling.textures.TextureSmoothing;
import flash.geom.*;
import flash.media.SoundChannel;
import Root;

class TerrainBlock extends Sprite{
	public var parallax:Float;
	private var speed:Float;
	private var callBack:TerrainBlock->Void;
	private var rHeight:Int;

	public function new(x:Float, speed:Float, img_loc:String, parallax:Float, rHeight:Int, callBack:TerrainBlock->Void){
		super();
		var tex = Root.assets.getTexture(img_loc);
		for(i in 0...Math.ceil(Root.source.stage.stageHeight/(tex.height))){
			var image = new Image(tex);
			image.y=tex.height*i;
			addChild(image);
		}

		setHeight(rHeight);
		this.x=x;
		this.speed=speed;
		this.parallax=parallax;
		this.callBack=callBack;
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function setHeight(rHeight:Int){
		this.y=Root.source.stage.stageHeight-(this.getChildAt(0).height*rHeight);
		this.rHeight=rHeight;
	}
	public function getHeight(){return this.rHeight;}
	public function getVelocity(){return this.parallax*this.speed;}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event){
		this.x -= Math.ceil(this.speed*this.parallax);
		if(this.x < -this.width) this.callBack(this);
	}
}