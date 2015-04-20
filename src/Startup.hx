import flash.display.Bitmap;
import flash.display.Sprite;
import flash.geom.Rectangle;
import starling.core.Starling;

@:bitmap("assets/loading.png")
class LoadingBitmapData extends flash.display.BitmapData {}



class Startup extends Sprite {
    public var loadingBitmap:Bitmap;

    public function new(){
        super();

        loadingBitmap = new Bitmap(new LoadingBitmapData(0,0));
        loadingBitmap.x = 0;
        loadingBitmap.y = 0;
        loadingBitmap.width = flash.Lib.current.stage.stageWidth;
        loadingBitmap.height = flash.Lib.current.stage.stageHeight;
        loadingBitmap.smoothing = true;

	addChild(loadingBitmap);

	flash.Lib.current.stage.addEventListener(
            flash.events.Event.RESIZE,
            function(e:flash.events.Event){
                Starling.current.viewPort = new Rectangle(
                    0, 
                    0,
                    flash.Lib.current.stage.stageWidth,
                    flash.Lib.current.stage.stageHeight);
                if (loadingBitmap != null) {
                    loadingBitmap.width = flash.Lib.current.stage.stageWidth;
                    loadingBitmap.height = flash.Lib.current.stage.stageHeight;
                }
        });

        var mStarling = new Starling(Root, flash.Lib.current.stage);
        mStarling.antiAliasing = 0;
        function onRootCreated(event:Dynamic, root:Root) {
            mStarling.removeEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
            root.initialize(this);
            mStarling.start();
        }
        mStarling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
    }

    public static function main(){
        try {
          flash.Lib.current.stage.addChild(new Startup());
        }
        catch(e:Dynamic){
            trace(e);
        }
    }
}