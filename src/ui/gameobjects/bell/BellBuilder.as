package ui.gameobjects.bell 
{
	import core.Box2D.utils.Box2DWorldController;
	import core.camera.Camera;
	import core.locators.ServicesLocator;
	import core.view.gameobject.config.GameobjectConfig;
	import core.view.skin.EmptyBoxSkin;
	import features.gameactions.SimpleInteractiveObjectCreationAction;
	import features.gameactions.SimpleInteractiveObjectDestroyAction;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;
	import ui.BellSkin;
	
	import ui.gameobjects.BaseInteractiveGameObject;
	import ui.gameobjects.datavalues.InteractiveObjectConfiguration;
	import ui.gameobjects.InteractiveGameObjectBuilder;
	import ui.gameobjects.simpleFlowObject.FlowInteractiveObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class BellBuilder extends InteractiveGameObjectBuilder 
	{
		private var lastCreatedObject:BaseInteractiveGameObject;
		private var camera:Camera;
		
		private var lastBellX:Number = 0;
		
		public function BellBuilder(viewInstance:DisplayObjectContainer, displayWidth:Number, worldController:Box2DWorldController) 
		{
			super(viewInstance, displayWidth, worldController);
			this.camera = ServicesLocator.cameraService.camera;
			
		}
		
		override protected function initilize():void 
		{
			super.initilize();
			
			gameobjectConfiguration = new GameobjectConfig(true);
			gameobjectConfiguration.type = 2; //todo replace
			gameobjectConfiguration.skinClass = BellSkin;
			
			
			interactiveObjectConfig = new InteractiveObjectConfiguration(getQualifiedClassName(this), new SimpleInteractiveObjectDestroyAction(), new SimpleInteractiveObjectCreationAction());
		}
		
		public function make(lastCreatedObject:BaseInteractiveGameObject):BaseInteractiveGameObject 
		{
			this.camera = camera;
			this.lastCreatedObject = lastCreatedObject;
			
			return internalMake();
		}
		
		override protected function craeteGameObject():BaseInteractiveGameObject 
		{
			return new FlowInteractiveObject(gameobjectConfiguration, interactiveObjectConfig, viewInstance);
		}
		
		override protected function preInitilizeObjectSettings(interactiveGameObject:BaseInteractiveGameObject):void 
		{
			super.preInitilizeObjectSettings(interactiveGameObject);
			
			interactiveGameObject.body.x = Math.random() * displayWidth
			
			if (Point.distance(new Point(interactiveGameObject.body.x, 0), new Point(lastBellX, 0)) > 200)
			{
				interactiveGameObject.body.x = lastBellX + ( -250 + Math.random() * 500) * 2;
			}
			
			if (interactiveGameObject.body.x > displayWidth - 150)
					interactiveGameObject.body.x = displayWidth - (200 + 100 * Math.random());
				else if (interactiveGameObject.body.x  < 0)
					interactiveGameObject.body.x = 50 + Math.random() * 100;
			
			lastBellX = interactiveGameObject.body.x
			
			if (lastCreatedObject)
				if (!lastCreatedObject.markToDestroy)
				{
					
						
					interactiveGameObject.body.y = lastCreatedObject.body.y - 150;
				}
				else
					interactiveGameObject.body.y = 300
			else
				interactiveGameObject.body.y = 300
				
			
		}
		
	}

}