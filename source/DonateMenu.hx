package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class DonateMenu extends MusicBeatState
{
	var menuItems:Array<String> = ['Support Original Game', 'KadeDeveloper in Twitter', 'codeeater in Twitter','','Github Page', 'Leave'];
	var miDesc:Array<String> = ['Ninjamuffin99 and other guys is creators of original game. You can support them.',
	"He's created Kade Engine. Cool guy. Read him.",
	"Just who modified Kade Engine. I'm here! :)",
	"Thanks for looking here! Support us, if you aren't lazy! :)", //copypasta bcause lazy to do if-else condition
	'Github page (i need to upload source code((9()',
	'Leaving to Main Menu.'];
	var curSelected:Int = 0;
	var currentDescription:String = "Thanks for looking here! Support us, if you aren't lazy! :)";
	var grpMenuShit:FlxTypedGroup<Alphabet>;

	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Credits", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('donateLoop'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBGUnderwater'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.15;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		//text
		grpMenuShit = new FlxTypedGroup<Alphabet>();
		add(grpMenuShit);

		for (i in 0...menuItems.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, menuItems[i], true, false);
			songText.isMenuItem = true;
			//songText.targetY = i;
			grpMenuShit.add(songText);
		}
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
		//end

		var versionShit:FlxText = new FlxText(5, FlxG.height - 36, 0, (Main.watermarks ? "FNF " + MainMenuState.gameVer + " | KADE ENGINE+ " + MainMenuState.kadeEngineVer + " | BUILD " + MainMenuState.w7build : ""), 12);
		var beforeVersionShit:FlxText = new FlxText(5, FlxG.height - 18 - 5, 0, "Description: " + currentDescription, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		beforeVersionShit.scrollFactor.set();
		beforeVersionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		add(beforeVersionShit);

		// NG.core.calls.event.logEvent('swag').send();

		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeSelection();

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollDonate'));
				changeSelection(-1);
			}

			if (controls.DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollDonate'));
				changeSelection(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new MainMenuState());
			}

			if (controls.ACCEPT)
			{
				var daSelected:String = menuItems[curSelected];

				switch (daSelected)
				{
					case "Support Original Game":
						{
							#if linux
							Sys.command('/usr/bin/xdg-open', ["https://www.kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game", "&"]);
							#else
							FlxG.openURL('https://www.kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game');
							#end
						}
					case "KadeDeveloper in Twitter":
						{
							#if linux
							Sys.command('/usr/bin/xdg-open', ["https://twitter.com/KadeDeveloper", "&"]);
							#else
							FlxG.openURL('https://twitter.com/KadeDeveloper');
							#end
						}
					case "codeeater in Twitter":
						{
							#if linux
							Sys.command('/usr/bin/xdg-open', ["https://twitter.com/codeeater_", "&"]);
							#else
							FlxG.openURL('https://twitter.com/codeeater_');
							#end
						}
					case "Github Page":
						{
							#if linux
							Sys.command('/usr/bin/xdg-open', ["https://github.com/toxichead/Kade-Engine-Plus", "&"]);
							#else
							FlxG.openURL('https://github.com/toxichead/Kade-Engine-Plus');
							#end
						}
					case "Leave": {
						FlxG.sound.music.stop();
						FlxG.switchState(new MainMenuState());
					}
				}
			}
		}

		super.update(elapsed);

	}

	function changeSelection(change:Int = 0):Void
	{
		curSelected += change;

		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		if (curSelected >= menuItems.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpMenuShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}
