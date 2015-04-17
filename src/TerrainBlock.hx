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
	private var img_loc:String;
	private var callBack:TerrainBlock->Void;
	private var rHeight:Int;

	public function new(x:Float, y:Float, speed:Float, img_loc:String, parallax:Float, rHeight:Int, callBack:TerrainBlock->Void){
		super();
		this.img_loc=img_loc;
		setHeight(rHeight);
		this.x=x;
		this.y=y;
		this.speed=speed;
		this.parallax=parallax;
		this.callBack=callBack;
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function setHeight(rHeight:Int){
		this.rHeight = rHeight;
		removeChildren();
		for(i in 0...rHeight){
			//Might be better to instead have an entire screen/colum of Images already instantiated so we can
			//just show how ever many the height is. Since we are already spooling our Terrain Blocks it'd
			// make sense opposed to removing and creating the repeated images.
			var image = new Image(Root.assets.getTexture(img_loc));
			image.y = i*image.height;
			addChild(image);
		}
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