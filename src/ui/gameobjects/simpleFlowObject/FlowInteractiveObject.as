package ui.gameobjects.simpleFlowObject 
{
	import core.locators.ServicesLocator;
	import core.view.gameobject.config.GameobjectConfig;
	import core.view.gameobject.physicalpropeties.PhysicModel;
	import core.view.gameobject.physicalpropeties.SimplePhysicalProperties;
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	import ui.gameobjects.BaseInteractiveGameObject;
	import ui.gameobjects.datavalues.InteractiveObjectConfiguration;

	
	/**
	 * ...
	 * @author 
	 */
	public class FlowInteractiveObject extends BaseInteractiveGameObject 
	{
		private var flowStopped:Boolean = false;
		
		public function FlowInteractiveObject(config:GameobjectConfig, interactiveObjectConfig:InteractiveObjectConfiguration, instance:DisplayObjectContainer, eventFlowTarget:IEventDispatcher=null) 
		{
			var physicModel:PhysicModel = new PhysicModel(2.2, 0.3, 0.1);
			
			super(config, interactiveObjectConfig, physicModel, instance, eventFlowTarget);
		}
		
		override protected function initilize():void 
		{
			super.initilize();
			
			//physicalProperties
			// :C~~~~~
			(physicalProperties as SimplePhysicalProperties).physicBodyKey.GetFixtureList().SetSensor(true);
			
		}
		
		override public function render():void 
		{
			flowerEffect();
			
			super.render();
		}
		
		/**
		 * Эфект парения, линейное ускорение по Y гасится и объект как бы падает плавно
		 */
		private function flowerEffect():void 
		{
			
			//this.applyImpulseFromCenter(new b2Vec2(0, -1));
			//var linearVelocity:Point = physicalProperties.linearVelocity
			
			if (!(ServicesLocator.cameraService.camera.target.y > 200) && !flowStopped )
			{
				//TODO: вынести куда нибудь
				//(physicalProperties as SimplePhysicalProperties).physicBodyKey.GetFixtureList().SetDensity(2);
				physicalProperties.physicModel.density = 2;
				(physicalProperties as SimplePhysicalProperties).physicBodyKey.ResetMassData();
				
				flowStopped = true;
			}
			//else
			//	linearVelocity.y = -0.4;
			
			//physicalProperties.linearVelocity = linearVelocity;
			
			//
			
		}
		
	}

}