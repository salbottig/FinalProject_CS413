import starling.display.*;
import starling.utils.AssetManager;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.textures.TextureSmoothing;
import starling.textures.Texture;
import starling.text.*;
import starling.events.*;
import flash.ui.Keyboard;
import flash.media.SoundChannel;

import Game;

class Root extends Sprite {

    public static var source:Root;
    public static var assets:AssetManager;
    public var game:Game;
    public var menu:Menu;
    var musicChannel:SoundChannel;  


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
        // sounds
        assets.enqueue("assets/sounds/track1.mp3");

        // art
        assets.enqueue("assets/loading.png");

        assets.enqueue("assets/test_terrain.png");
        assets.enqueue("assets/hillbillypoint.png");
        assets.enqueue("assets/hillbilly_1.png");
        assets.enqueue("assets/hillbilly_2.png");
        assets.enqueue("assets/hillbilly_3.png");
        assets.enqueue("assets/empty.png");
        assets.enqueue("assets/play_button.png");
        assets.enqueue("assets/tutorial_button.png");
        assets.enqueue("assets/title_text.png");
        assets.enqueue("assets/tutorial.png");
        assets.enqueue("assets/credits.png");        
        assets.enqueue("assets/credits_button.png");
        assets.enqueue("assets/menu_button.png");
        assets.enqueue("assets/menu.png");
        assets.enqueue("assets/Beginning_level_bg1.png");
        assets.enqueue("assets/Beginning_level_bg2.png");
        assets.enqueue("assets/fence_ground.png");
        assets.enqueue("assets/pond_pixel.png");
        assets.enqueue("assets/scene3_background.png");
        assets.enqueue("assets/MidGround_Beg_1.png");
        assets.enqueue("assets/hilbilly1walk1.png");
        assets.enqueue("assets/hilbilly1walk2.png");
        assets.enqueue("assets/rock.png");
        assets.enqueue("assets/squirrel.png");
        assets.enqueue("assets/stump.png");
        assets.enqueue("assets/tire.png");
        assets.enqueue("assets/hay.png");
        assets.enqueue("assets/main_button.png");
        assets.loadQueue(function onProgress(ratio:Float) {
            if(ratio == 1) {
                musicChannel = assets.playSound("track1");
                starling.text.TextField.registerBitmapFont(new BitmapFont(assets.getTexture("eastwood.png"), assets.getXml("eastwood.fnt")), "eastwood");
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