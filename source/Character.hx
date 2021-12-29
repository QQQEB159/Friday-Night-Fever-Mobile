package;

import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';
	public var iconColor:String = "50a5eb";

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			// FEVER + FEVER VARIANTS \\
			/*case 'bf':
				iconColor = 'C353E3';
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking', 24);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('transition', 'BF Transition', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -28, 13);
				addOffset("singRIGHT", -55, -9);
				addOffset("singLEFT", 14, -2);
				addOffset("singDOWN", -29, -75);
				addOffset("singUPmiss", -56, 10);
				addOffset("singRIGHTmiss", -48, -15);
				addOffset("singLEFTmiss", 21, -3);
				addOffset("singDOWNmiss", -33, -75);
				addOffset("hey", -10, 3);
				addOffset("transition", -10, 3);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 20);
				addOffset('scared', -26, -9);

				playAnim('idle');

				flipX = true;*/

				case 'bf' | 'bfdemoncesar':
					iconColor = 'C353E3';
					switch (curCharacter)
					{
						case 'bfdemoncesar':
							frames = Paths.getSparrowAtlas('characters/demon_fever_assets', 'shared');
						default:
							frames = Paths.getSparrowAtlas('characters/fever_assets', 'shared');
					}
	
					//trace(tex.frames.length);
	
					animation.addByPrefix('idle', 'fever idle0', 24, false);
					animation.addByPrefix('singUP', 'fever up0', 24, false);
					animation.addByPrefix('singLEFT', 'fever left0', 24, false);
					animation.addByPrefix('singRIGHT', 'fever right0', 24, false);
					animation.addByPrefix('singDOWN', 'fever down0', 24, false);
					animation.addByPrefix('singUPmiss', 'fever up miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'fever left miss', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'fever right miss', 24, false);
					animation.addByPrefix('singDOWNmiss', 'fever down miss', 24, false);
					animation.addByPrefix('scared', 'fever fear', 24);
					animation.addByPrefix('hey', 'fever hey', 24, false);
					//animation.addByPrefix('transition', 'BF Transition', 24, false);
	
					animation.addByPrefix('firstDeath', "fever dies", 24, false);
					animation.addByPrefix('deathLoop', "fever dead loop", 24, true);
					animation.addByPrefix('deathConfirm', "fever dead confirm", 24, false);
					animation.addByPrefix('dodge', 'fever dodge', 24, false);
	
					if (curCharacter != 'bfdemoncesar')
					{
						addOffset('idle', 6, 93);
						addOffset("singUP", -25, 106);
						addOffset("singRIGHT", -19, 92);
						addOffset("singLEFT", 43, 95);
						addOffset("singDOWN", 12, 10);
						addOffset("singUPmiss", -14, 103);
						addOffset("singRIGHTmiss", -20, 91);
						addOffset("singLEFTmiss", 40, 93);
						addOffset("singDOWNmiss", 11, 14);
						addOffset("hey", -3, 93);
					//	addOffset("transition", -10, 3);
						addOffset('firstDeath', 42, 108);
						addOffset('deathLoop', 20, 109);
						addOffset('deathConfirm', 87, 131);
						addOffset('scared', -1, 92);
						addOffset('dodge', 21, 92);
					}
					else
					{
						addOffset('idle', 6, 93);
						addOffset("singUP", -35, 96);
						addOffset("singRIGHT", -6, 87);
						addOffset("singLEFT", 43, 95);
						addOffset("singDOWN", 40, 15);
						addOffset("singUPmiss", -14, 103);
						addOffset("singRIGHTmiss", -20, 91);
						addOffset("singLEFTmiss", 40, 93);
						addOffset("singDOWNmiss", 45, 14);
						addOffset("hey", 0, 89);
					//	addOffset("transition", -10, 3);
						addOffset('firstDeath', 52, 98);
						addOffset('deathLoop', 31, 95);
						addOffset('deathConfirm', 97, 121);
						addOffset('scared', 2, 92);
						addOffset('dodge', 21, 92);
					}
	
					playAnim('idle');
	
					flipX = true;
	
			case 'bfiso':
				iconColor = 'C353E3';
				var tex = Paths.getSparrowAtlas('characters/iso', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				addOffset('idle', 0, -10);
				addOffset("singUP", -38, 3);
				addOffset("singRIGHT", -42, -17);
				addOffset("singLEFT", 4, -19);
				addOffset("singDOWN", -20, -64);
				addOffset("singUPmiss", -42, 2);
				addOffset("singRIGHTmiss", -37, -4);
				addOffset("singLEFTmiss", 21, -3);
				addOffset("singDOWNmiss", -25, -41);
				addOffset("hey", 3, -8);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				playAnim('idle');

				flipX = true;

			case 'bf-casual':
				iconColor = 'C353E3';
				var tex = Paths.getSparrowAtlas('characters/casFEVER', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('transition', 'BF Transition', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -28, 13);
				addOffset("singRIGHT", -55, -9);
				addOffset("singLEFT", 14, -2);
				addOffset("singDOWN", -29, -75);
				addOffset("singUPmiss", -56, 10);
				addOffset("singRIGHTmiss", -48, -15);
				addOffset("singLEFTmiss", 21, -3);
				addOffset("singDOWNmiss", -33, -75);
				addOffset("hey", -10, 3);
				addOffset("transition", -10, 3);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -26, -9);

				playAnim('idle');

				flipX = true;

			case 'bf-casualdemon':
				iconColor = 'E353C8';
				var tex = Paths.getSparrowAtlas('characters/casDEMON', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('transition', 'BF Transition', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -28, 13);
				addOffset("singRIGHT", -55, -9);
				addOffset("singLEFT", 14, -2);
				addOffset("singDOWN", -29, -75);
				addOffset("singUPmiss", -56, 10);
				addOffset("singRIGHTmiss", -48, -15);
				addOffset("singLEFTmiss", 21, -3);
				addOffset("singDOWNmiss", -33, -75);
				addOffset("hey", -10, 3);
				addOffset("transition", -10, 3);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -26, -9);

				playAnim('idle');

				flipX = true;
			case 'bf-car':
				iconColor = 'C353E3';
				var tex = Paths.getSparrowAtlas('characters/bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -23, 15);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 27, -3);
				addOffset("singDOWN", -4, -60);
				addOffset("singUPmiss", -21, 11);
				addOffset("singRIGHTmiss", -32, 15);
				addOffset("singLEFTmiss", 27, -3);
				addOffset("singDOWNmiss", -21, -65);
				playAnim('idle');

				flipX = true;

			case 'bf-carnight':
				iconColor = 'E353C8';
				var tex = Paths.getSparrowAtlas('characters/bfCarNIGHT', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -23, 15);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 27, -3);
				addOffset("singDOWN", -4, -60);
				addOffset("singUPmiss", -21, 11);
				addOffset("singRIGHTmiss", -32, 15);
				addOffset("singLEFTmiss", 27, -3);
				addOffset("singDOWNmiss", -21, -65);
				playAnim('idle');

				flipX = true;

			case 'bf-pixel':
				iconColor = 'C353E3';
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;


			case 'bdbfever':
				iconColor = 'C353E3';
				frames = Paths.getSparrowAtlas('characters/bdbFever');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bfiso-pixel':
				iconColor = 'C353E3';
				frames = Paths.getSparrowAtlas('characters/isoPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-pixeldemon':
				iconColor = 'E353C8';
				frames = Paths.getSparrowAtlas('characters/demonCesarPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

			case 'bf-pixel-dead':
				iconColor = 'E353C8';
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;
			case 'bf-hallow-dead':
				frames = Paths.getSparrowAtlas('characters/Hallow_Death');
				animation.addByPrefix('singUP', "BF dies", 24, false);
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop',-93, -75);
				addOffset('deathConfirm', -30, -121);
				playAnim('firstDeath');

				flipX = true;

			// TEA + TEA VARIANTS \\

			case 'gf-notea':
				iconColor = '99DBF6';
				tex = Paths.getSparrowAtlas('characters/wheredaTea');
				frames = tex;
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				playAnim('danceRight');

				case 'gfpainting':
					iconColor = '99DBF6';
					tex = Paths.getSparrowAtlas('characters/tea_painting');
					frames = tex;
					animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
					animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	
					addOffset('danceLeft', 0, -9);
					addOffset('danceRight', 0, -9);
	
					playAnim('danceRight');

			case 'gf':
				iconColor = '99DBF6';
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -21);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -13);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 1, -8);
				addOffset('hairFall', 0, -8);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-christmas':
				iconColor = '99DBF6';
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-car':
				iconColor = '99DBF6';
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'gf-carnight':
				iconColor = '99DBF6';
				tex = Paths.getSparrowAtlas('characters/gfCarNIGHT', 'shared');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'cherry-pixel':
				iconColor = '99DBF6';
				tex = Paths.getSparrowAtlas('characters/cherryPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;


			case 'gf-pixel':
				iconColor = '99DBF6';
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			// PEAKEK + PEAKEK VARIANT \\

			case 'dad':
				iconColor = '99D4F4';
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -141, 25);
				addOffset("singRIGHT", -181, 6);
				addOffset("singLEFT", -29, 12);
				addOffset("singDOWN", -189, -68);

				playAnim('idle');

			case 'feverbob':
				iconColor = '000000';
				tex = Paths.getSparrowAtlas('characters/feverRun', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'feverRun idle', 24);
				animation.addByPrefix('singUP', 'lol', 24);
				animation.addByPrefix('singRIGHT', 'lol', 24);
				animation.addByPrefix('singDOWN', 'lol', 24);
				animation.addByPrefix('singLEFT', 'lol', 24);

				addOffset('idle');

				flipX = true;
	
				playAnim('idle');

			case 'tea-bat':
				tex = Paths.getSparrowAtlas('characters/tea_bat', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'tea bat idle', 24);
				animation.addByPrefix('singUP', 'tea bat up', 24);
				animation.addByPrefix('singRIGHT', 'tea bat right', 24);
				animation.addByPrefix('singDOWN', 'tea bat down', 24);
				animation.addByPrefix('singLEFT', 'tea bat left', 24);

				addOffset('idle');
				addOffset("singUP", 18, 17);
				addOffset("singRIGHT", -108, -6);
				addOffset("singLEFT", 22, 0);
				addOffset("singDOWN", -21, -8);

				playAnim('idle');

			case 'hallow':
				tex = Paths.getSparrowAtlas('characters/Hallow', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Hallow idle', 24);
				animation.addByPrefix('singUP', 'Hallow up', 24);
				animation.addByPrefix('singRIGHT', 'Hallow right', 24);
				animation.addByPrefix('singDOWN', 'Hallow down', 24);
				animation.addByPrefix('singLEFT', 'Hallow left', 24);

				addOffset('idle');
				addOffset("singUP", -133, 74);
				addOffset("singRIGHT", -208, 4);
				addOffset("singLEFT", -8, 20);
				addOffset("singDOWN", -179, -48);

				playAnim('idle');

			case 'peasus':
				iconColor = '99D4F4';
				tex = Paths.getSparrowAtlas('characters/peaky_horny', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -135, 54);
				addOffset("singRIGHT", -211, -16);
				addOffset("singLEFT", -152, 30);
				addOffset("singDOWN", -200, -66);

				playAnim('idle');
	
			case 'peacensored':
				iconColor = '99D4F4';
				tex = Paths.getSparrowAtlas('characters/peaky_censored', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'dad sing note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -135, 54);
				addOffset("singRIGHT", -211, -16);
				addOffset("singLEFT", -152, 30);
				addOffset("singDOWN", -200, -66);

				playAnim('idle');

			case 'spooky': // WEE
				iconColor = '5CBEFF';
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight', 1 , -7);

				addOffset("singUP", 139, 12);
				addOffset("singRIGHT", 1, -7);
				addOffset("singLEFT", 3, -2);
				addOffset("singDOWN", -7, 1);

				playAnim('danceRight');

			case 'feralspooky': // WEE 
				iconColor = '5CBEFF';
				tex = Paths.getSparrowAtlas('characters/feral_wee_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'feral UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'feral DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'feral note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'feral sing right', 24, false);
				animation.addByPrefix('idle', 'feral dance idle', 24, false);
		

				addOffset('idle');

				addOffset("singUP", -12, 4);
				addOffset("singRIGHT", 1, -7);
				addOffset("singLEFT", 3, -2);
				addOffset("singDOWN", -7, 1);

				playAnim('idle');

			case 'taki': // TAKI
				iconColor = 'D34470';
				tex = Paths.getSparrowAtlas('characters/taki_assets');
				frames = tex;
				animation.addByPrefix('idle', 'takiidle', 24, false);
				animation.addByPrefix('singUP', 'takiup', 24, false);
				animation.addByPrefix('singDOWN', 'takidown', 24, false);
				animation.addByPrefix('singLEFT', 'takileft', 24, false);
				animation.addByPrefix('singRIGHT', 'takiright', 24, false);

				addOffset('idle');
				addOffset("singUP", -39, 17);
				addOffset("singRIGHT", -21, -5);
				addOffset("singLEFT", 38, -18);
				addOffset("singDOWN", 21, -180);

				playAnim('idle');
			case 'monster': // TAKI
				iconColor = 'D34470';
				tex = Paths.getSparrowAtlas('characters/taki_assets');
				frames = tex;
				animation.addByPrefix('idle', 'takiidle', 24, false);
				animation.addByPrefix('singUP', 'takiup', 24, false);
				animation.addByPrefix('singDOWN', 'takidown', 24, false);
				animation.addByPrefix('singLEFT', 'takileft', 24, false);
				animation.addByPrefix('singRIGHT', 'takiright', 24, false);

				addOffset('idle');
				addOffset("singUP", -80, 17);
				addOffset("singRIGHT", -21, -5);
				addOffset("singLEFT", 38, -18);
				addOffset("singDOWN", -30, -210);

				setGraphicSize(Std.int(width * 1.4));
				
				playAnim('idle');

			case 'robo-cesar': // MAKO
				iconColor = '9236B4';
				tex = Paths.getSparrowAtlas('characters/roboCesar');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);

				addOffset('idle');
				addOffset("singUP", -8, 5);
				addOffset("singRIGHT", -1, 2);
				addOffset("singLEFT", 5, -7);
				addOffset("singDOWN", 13, -9);

				flipX = true;

				playAnim('idle');

			
			case 'pico': // MAKO
				iconColor = '47CC40';
				tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);

				addOffset('idle');
				addOffset("singUP", 17, -1);
				addOffset("singRIGHT", 4, 1);
				addOffset("singLEFT", -4, 2);
				addOffset("singDOWN", 43, -2);

				playAnim('idle');

			case 'makocorrupt': // OWO BROKEN EMO MAKO
				iconColor = '47CC40';
				flipX = true;

				setGraphicSize(Std.int(width * 0.95));
				frames = Paths.getSparrowAtlas('characters/makoCorrupt');
				
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				
				addOffset('idle');
				addOffset("singUP", 21, -37);
				addOffset("singRIGHT", -12, 14);
				addOffset("singLEFT", 26, 12);
				addOffset("singDOWN", 21, 61);
				
				playAnim('idle');

			case 'mom-car': // HUNNII
				iconColor = 'FF517E';
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);


				addOffset('idle', 0, 4);
				addOffset("singUP", 63, 37);
				addOffset("singLEFT", 92, 8);
				addOffset("singRIGHT", 5, -24);
				addOffset("singDOWN", -20, -193);

				setGraphicSize(Std.int(width * 0.8));

				playAnim('idle');

			case 'mom-carnight': // HUNNII DARK
				iconColor = 'FF517E';
				tex = Paths.getSparrowAtlas('characters/momCarNIGHT', 'shared');
				frames = tex;
				
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);


				addOffset('idle', 0, 4);
				addOffset("singUP", 63, 37);
				addOffset("singLEFT", 92, 8);
				addOffset("singRIGHT", 5, -24);
				addOffset("singDOWN", -20, -193);

				setGraphicSize(Std.int(width * 0.8));

				playAnim('idle');

			case 'monster-christmas': // THE PEPPER DEMON
				iconColor = '7F64DA';
				tex = Paths.getSparrowAtlas('characters/dickbutt');
				frames = tex;
				animation.addByPrefix('idle', 'Pepper Idle', 24, false);
				animation.addByPrefix('singUP', 'Pepper Up', 24, false);
				animation.addByPrefix('singDOWN', 'Pepper Down', 24, false);
				animation.addByPrefix('singLEFT', 'Pepper Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Pepper Right', 24, false);

				addOffset('idle');
				addOffset("singUP", 32, 26);
				addOffset("singRIGHT", -54, 13);
				addOffset("singLEFT", 312, -160);
				addOffset("singDOWN", 165, -206);
				playAnim('idle');
			
			case 'yukichi': // YUKICHI
				iconColor = 'FF97F0';
				frames = Paths.getSparrowAtlas('characters/yukichi_leader_assets', 'shared');

				animation.addByPrefix('idle', 'yukichi idle', 24);
				animation.addByPrefix('singUP', 'yukichi up note', 24);
				animation.addByPrefix('singRIGHT', 'yukichi right note', 24);
				animation.addByPrefix('singDOWN', 'yukichi down note', 24);
				animation.addByPrefix('singLEFT', 'yukichi left note', 24);

				addOffset('idle');
				addOffset("singUP", -27, 17);
				addOffset("singRIGHT", -54, -7);
				addOffset("singLEFT", 47, 4);
				addOffset("singDOWN", -139, -62);

				setGraphicSize(Std.int(width * 0.8));

				playAnim('idle');

			case 'senpai': // MEGA
				iconColor = '9F0030';
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 1, 2);
				addOffset("singRIGHT", 1, 3);
				addOffset("singLEFT");
				addOffset("singDOWN", 1, 2);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'senpai-angry': // PISSED MEGA
				iconColor = '9F0030';
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", -1, -3);
				addOffset("singRIGHT", 0, -1);
				addOffset("singLEFT");
				addOffset("singDOWN", -1, 0);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit': //FLIPPY
				iconColor = '4E4E4E';
				frames = Paths.getPackerAtlas('characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -496, -106);
				addOffset("singRIGHT", -244, -316);
				addOffset("singLEFT", -316, -310);
				addOffset("singDOWN", -628, -616);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf') && !curCharacter.toLowerCase().startsWith('demon'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!isPlayer && !PlayState.opponent || isPlayer && PlayState.opponent)
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;

			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			if(animOffsets.exists('danceLeft'))
			{
				if (!animation.curAnim.name.startsWith('hair'))
				{
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				}
			}
			else
			{
				switch(curCharacter)
				{
					default: playAnim('idle');
				}
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		if(animOffsets.exists(AnimName))
		{
			animation.play(AnimName, Force, Reversed, Frame);

			var daOffset = animOffsets.get(AnimName);
			if (animOffsets.exists(AnimName))
			{
				offset.set(daOffset[0], daOffset[1]);
			}
			else
				offset.set(0, 0);
	
			if (curCharacter == 'gf')
			{
				if (AnimName == 'singLEFT')
				{
					danced = true;
				}
				else if (AnimName == 'singRIGHT')
				{
					danced = false;
				}
	
				if (AnimName == 'singUP' || AnimName == 'singDOWN')
				{
					danced = !danced;
				}
			}			
		}
		else
		{
			if (AnimName.endsWith('miss'))
			{
				FlxTween.cancelTweensOf(this);
				color = FlxColor.fromString('#84009E');
				playAnim(AnimName.replace('miss', ''), Force, Reversed, Frame);
				FlxTween.color(this, 0.33, this.color, FlxColor.WHITE);
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
