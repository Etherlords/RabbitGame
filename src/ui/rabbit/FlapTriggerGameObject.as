/**
 * author: chaos-encoder
 * Date: 06.02.12 Time: 9:41
 */
package ui.rabbit 
{
	import core.view.gameobject.config.GameobjectConfig;
	import core.view.gameobject.physicalpropeties.PhysicModel;
	import core.view.lifetimeobject.LifeTimeGameObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	
	


	public class FlapTriggerGameObject extends LifeTimeGameObject
	{

		private var _isAbleToFlap:Boolean;

		public function FlapTriggerGameObject(config:GameobjectConfig, physicModel:PhysicModel, instance:DisplayObjectContainer, eventFlowTarget:IEventDispatcher = null) {
			super(config, physicModel, instance, eventFlowTarget);
		}


		override protected function initilize():void {
			super.initilize();
			_isAbleToFlap = true;
		}

		override protected function addLife(time:uint):void {
			super.addLife(time);
			if (lifeTime > 150) {
				_isAbleToFlap = true;

			}
		}

		public function flap():void {
			_isAbleToFlap = false;
			resetLifeTime();
		}

		public function isAbleToFlap():Boolean {
			return _isAbleToFlap;
		}


	}
}
