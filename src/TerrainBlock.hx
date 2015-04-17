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
	private var image:Image;

	public function new(x:Float, y:Float, speed:Float, img_loc:String, parallax:Float=1, height:Int){
		super();
		for(i in 0...height){
			image = new Image(Root.assets.getTexture(img_loc));
			image.y = i*image.height;
			addChild(image);
		}
		
		this.x=x;
		this.y=y;
		this.speed=speed;
		this.parallax=parallax;
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	public function getVelocity(){return this.parallax*this.speed;}

	public function onAddedToStage(event:Event){
		this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event){
		this.x -= Math.ceil(this.speed*this.parallax);
		if(this.x < -this.width) Recycle();
	}

	public function Recycle(){
		this.x=Root.source.stage.stageWidth;
	}
}