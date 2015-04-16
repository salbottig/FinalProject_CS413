import starling.display.*;
import starling.utils.AssetManager;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.textures.TextureSmoothing;
import starling.textures.Texture;
import starling.text.TextField;
import starling.events.*;
import flash.ui.Keyboard;
import Game;

class Root extends Sprite {

    public static var source:Root;
    public static var assets:AssetManager;
    public var game:Game;

    public function new() {
        super();
      
    }
    public function initialize(startup:Startup) {
        source = this;
        assets = new AssetManager();
        // enqueue here
        assets.enqueue("assets/loading.png");
        assets.enqueue("assets/test_terrain.png");
        assets.enqueue("assets/test_player.png");
        assets.loadQueue(function onProgress(ratio:Float) {
            if(ratio == 1) {
                Starling.juggler.tween(startup.loadingBitmap,
                    1.0,
                    {
                        transition: Transitions.EASE_OUT,
                        delay: 1.0,
                        alpha: 0,
                        onComplete: function()
                        {
                            startup.removeChild(startup.loadingBitmap);
                        }
                    });
                start();
            }
        });
    }

    public function start(){
        removeChildren(0,-1,true);
        removeEventListeners();
        game = new Game();
        addChild(game);
    }
}