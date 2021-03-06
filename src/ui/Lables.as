package ui 
{
	/**
	 * ...
	 * @author 
	 */
	public class Lables 
	{
		
		public static var GAME_OVER:String = '<font size="30">GAME OVER</font>'
												+ '\n\n\n\n'
												+ '<header>Your score</header>'
												+ '\n\n\n\n'
												+ '<scores>%score%</scores>'
												+ '\n\n\n\n'
												+ '<header>Your highest in this game session score</header>'
												+ '\n\n\n\n'
												+ '<scores>%highScore%</scores>'
												+ '\n\n\n\n'
												+ '<button><a href="event:playAgain">Play again?</a></button>'
												
		public static function getGAME_OVER_LABLE(score:Number, highestScore:Number):String
		{
			return GAME_OVER.split('%score%').join(score).split('%highScore%').join(highestScore);
		}
		
		public static var START_SCREEN:String = 
												
													'ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ'
												+	'\n\n\n\n\n\n'
												+'<font size="35">PING PONG</font>\n'
												+	'\n'
												+   'TO START THE GAME\n'
												+   'PRESS\n'
												+	'\n\n\n\n\n\n'
												+	'\n\n\n\n\n\n'
												+	'<button><a href="event:startGame">SPACE</a></button>\n'
												+   'OR FOR RESTART RAUND'
												+	'\n\n\n\n\n\n'

												+	'ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ ʕ·ᴥ·ʔ'
		
		
	}

}