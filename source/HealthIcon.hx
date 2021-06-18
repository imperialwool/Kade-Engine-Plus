package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	public var changeHealthIcons:Bool = true; //u can change it but better think about wut is it
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		if (changeHealthIcons) {
			loadGraphic(Paths.image('iconGrid'), true, 150, 150);
			//first - normal icon, second - losing icon, third - winning icon. UNDERSTAAAND???
			antialiasing = true;
			animation.add('bf', [1, 0, 2], 0, false, isPlayer);
			animation.add('bfAndGf', [1, 0, 2], 0, false, isPlayer);
			animation.add('bf-car', [1, 0, 2], 0, false, isPlayer);
			animation.add('bf-christmas', [1, 0, 2], 0, false, isPlayer);
			animation.add('bf-pixel', [27, 26, 28], 0, false, isPlayer);
			animation.add('spooky', [11, 10, 12], 0, false, isPlayer);
			animation.add('pico', [14, 13, 15], 0, false, isPlayer);
			animation.add('gf-picoTEMP', [14, 13, 15], 0, false, isPlayer);
			animation.add('mom', [17, 16, 18], 0, false, isPlayer);
			animation.add('mom-car', [17, 16, 18], 0, false, isPlayer);
			animation.add('tankman', [9, 29, 19], 0, false, isPlayer);
			animation.add('face', [25,25,25], 0, false, isPlayer);
			animation.add('agoti', [25,25,25], 0, false, isPlayer);
			animation.add('dad', [7, 6, 8], 0, false, isPlayer);
			animation.add('senpai', [31, 30, 32], 0, false, isPlayer);
			animation.add('senpai-angry', [31, 30, 32], 0, false, isPlayer);
			animation.add('spirit', [34, 33, 35], 0, false, isPlayer);
			animation.add('bf-old', [1, 0, 2], 0, false, isPlayer);
			animation.add('gf', [4, 3, 5], 0, false, isPlayer);
			animation.add('gf-christmas', [4, 3, 5], 0, false, isPlayer);
			animation.add('gf-pixel', [4, 3, 5], 0, false, isPlayer);
			animation.add('gfTankmen', [4, 3, 5], 0, false, isPlayer);
			animation.add('parents-christmas', [21, 20, 22], 0, false, isPlayer);
			animation.add('monster', [24, 23, 25], 0, false, isPlayer);
			animation.add('monster-christmas', [24, 23, 25], 0, false, isPlayer);
		} else {
			loadGraphic(Paths.image('iconGrid_OLD'), true, 150, 150);

			antialiasing = true;
			animation.add('bf', [0, 1], 0, false, isPlayer);
			animation.add('bfAndGf', [0, 1], 0, false, isPlayer);
			animation.add('bf-car', [0, 1], 0, false, isPlayer);
			animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
			animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
			animation.add('spooky', [2, 3], 0, false, isPlayer);
			animation.add('pico', [4, 5], 0, false, isPlayer);
			animation.add('gf-picoTEMP', [4, 5], 0, false, isPlayer);
			animation.add('mom', [6, 7], 0, false, isPlayer);
			animation.add('mom-car', [6, 7], 0, false, isPlayer);
			animation.add('tankman', [8, 9], 0, false, isPlayer);
			animation.add('face', [10, 11], 0, false, isPlayer);
			animation.add('agoti', [10, 11], 0, false, isPlayer);
			animation.add('dad', [12, 13], 0, false, isPlayer);
			animation.add('senpai', [22, 22], 0, false, isPlayer);
			animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
			animation.add('spirit', [23, 23], 0, false, isPlayer);
			animation.add('bf-old', [14, 15], 0, false, isPlayer);
			animation.add('gf', [16], 0, false, isPlayer);
			animation.add('gf-christmas', [16], 0, false, isPlayer);
			animation.add('gf-pixel', [16], 0, false, isPlayer);
			animation.add('gfTankmen', [16], 0, false, isPlayer);
			animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
			animation.add('monster', [19, 20], 0, false, isPlayer);
			animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		}
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
