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
    public var menu:Menu;

    public function new() {
        super();
      
    }
    public function initialize(startup:Startup) {
        source = this;
        assets = new AssetManager();

        // enqueue here
        // fonts
        assets.enqueue("assets/fonts/eastwood.png");
        assets.enqueue("assets/fonts/eastwood.fnt");
        assets.enqueue("assets/fonts/pixel_cowboy.png");
        assets.enqueue("assets/fonts/pixel_cowboy.xml");

        // sounds
        assets.enqueue("assets/sounds/track1.mp3");

        // art
        assets.enqueue("assets/loading.png");
        assets.enqueue("assets/test_terrain.png");
        assets.enqueue("assets/hillbillypoint.png");
        assets.enqueue("assets/play_button.png");
        assets.enqueue("assets/tutorial_button.png");
        assets.enqueue("assets/credits_button.png");
        assets.enqueue("assets/menu.png");
        assets.enqueue("assets/Beginning_level_bg1.png");
        assets.enqueue("assets/Beginning_level_bg2.png");
        assets.enqueue("assets/Grass_Ground_proto.png");
        assets.enqueue("assets/hilbilly1.png");
        assets.enqueue("assets/rock.png");
        assets.enqueue("assets/squirrel.png");
        assets.enqueue("assets/stump.png");
        assets.enqueue("assets/tire.png");
        assets.enqueue("assets/hay.png");
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
        menu = new Menu();
        addChild(menu);
    }
}