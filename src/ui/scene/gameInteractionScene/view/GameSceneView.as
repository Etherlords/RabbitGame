package  ui.scene.gameInteractionScene.view
{
	//import com.sociodox.theminer.TheMiner;
	import core.locators.ServicesLocator;
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import starling.events.Event;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import ui.scoreboard.Scoreboard;
import ui.services.scores.ScoresService;
import ui.snow.FallingSnowAnimation;
	
	/**
	 * ...
	 * @author 
	 */
	
	public class GameSceneView extends Sprite 
	{
		
		[Embed(source="../../../../../../assets/compiled/bt_moon_masked_but_not_filtered.png")]
		private var moonClass:Class;
		
		private var _gameObjectsInstance:DisplayObjectContainer;
		
		private var trackCameraInstances:Vector.<DisplayObjectContainer>
		
		private var _scoreboard:Scoreboard;
		private var _snow:FallingSnowAnimation;

        private var scoresService:ScoresService;
		
		private var moon:Sprite;
		private var startBack:Sprite;
		private var _effects:Sprite;

		public function GameSceneView() 
		{
			super();
			initilize();
		}
		
		/**
		 * TODO вынести все эти бэкграунды все же в класс бэкграунд но для этого его нужно сначала написать :)
		 * И избавится от хардкодной логики поведения бэкграундов степень их движения и порядок расположения должны задаватся zoomFactor-ом
		 * 
		 * А внутри класса бекграунд уже можно будет описывать всякую логику рендера, эффектов и тд
		 */
		
		public function render():void
		{
			scoresView.scores = scoresService.scores;
			//this.y = stage.stageHeight / 2 - rabbit.dimensionalProperties.y;
			
			//if (this.y < 0)	
			//	this.y = 0;
			
			var target:Point = ServicesLocator.cameraService.camera.target;
			
			for (var i:int = 0; i < trackCameraInstances.length; i++)
			{
				if (trackCameraInstances[i].y != stage.stageHeight / 2 - target.y)
					trackCameraInstances[i].y += ((stage.stageHeight / 2 - target.y) - trackCameraInstances[i].y) / 2;
				
				//trackCameraInstances[i].y = stage.stageHeight / 2 - target.y;
				
				if (trackCameraInstances[i].y < 0)
					trackCameraInstances[i].y = 0
			}
			
			moon.y = (trackCameraInstances[0].y - moon.y) / 100;
			_snow.drawingY = (trackCameraInstances[0].y);
			//_effects.y = -trackCameraInstances[0].y + 550;
		}
		
		public function get gameObjectsInstance():DisplayObjectContainer 
		{
			return _gameObjectsInstance;
		}
		
		public function get scoresView():Scoreboard 
		{
			return _scoreboard;
		}
		
		public function get effects():Sprite 
		{
			return _effects;
		}
		
		public function initilize():void 
		{
            scoresService = ServicesLocator.instance.getServiceByClass(ScoresService) as ScoresService;
			trackCameraInstances = new Vector.<DisplayObjectContainer>;
			createInstances();
			
			this.addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		
		private function onInit(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onInit);
			this.y = (stage.stageHeight - startBack.height);
		}
		
		private function createInstances():void 
		{
			_snow = new FallingSnowAnimation(760);
			_effects = new Sprite();
			
			_gameObjectsInstance = new Sprite();
			
			_scoreboard = new Scoreboard();
			_scoreboard.y = 100;
			
			startBack = new Sprite();
			var bg:Bitmap = new Bitmap(new StartBackground());
			
			var background:Shape = new Shape();
			background.graphics.beginFill(0x0);
			background.graphics.drawRect(0, 0, 760, 650);
			
			startBack.addChild(bg);
			startBack.addChild(new StartBackgroundMask());
			startBack.addChild(new StartBackgroundMask());
			
			trackCameraInstances.push(_gameObjectsInstance);
			trackCameraInstances.push(_snow);
			trackCameraInstances.push(startBack);
			//trackCameraInstances.push(_effects);
			
			moon = new Sprite();
			moon.y -= 35;
			moon.x -= 160;
			
			createMoon();
			
			
			addChild(background);
			addChild(startBack);
			
			addChild(moon);
			
			addChild(_snow);
			addChild(_effects);
			addChild(_gameObjectsInstance);
			addChild(_scoreboard);
			
			removeFromMouseWorld(_scoreboard);
			removeFromMouseWorld(_snow);
			removeFromMouseWorld(_gameObjectsInstance);
			removeFromMouseWorld(startBack);
			removeFromMouseWorld(moon);
		}
		
		private function removeFromMouseWorld(obj:DisplayObjectContainer):void
		{
			obj.mouseEnabled = false;
			obj.mouseChildren = false;
		}
		
		private function createMoon():void 
		{
			var moonImage:Bitmap = new Bitmap(new moonClass().bitmapData);
			
			
			var moonMask:Sprite = new Sprite();
			moonMask.graphics.beginFill(0x0, 0.8);
			moonMask.graphics.drawCircle(115, 110, 93);
			
			moonImage.cacheAsBitmap = moonMask.cacheAsBitmap = true;
			
			moonImage.mask = moonMask;
			moon.addChild(moonImage);
			moon.addChild(moonMask);
			moonImage.x = moonMask.x = 730;
			moon.filters = [new GlowFilter(0xFF0000, .5, 20, 20, 3, 3, false), new GlowFilter(0xFF0000, .5, 40, 40, 3, 3, true)];
		}
		
		
		
	}

}