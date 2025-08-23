package;

import flixel.FlxG;
import StringBuf;
import lime.utils.Assets;
import flixel.util.FlxColor;

using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<String> = ["EASY", "NORMAL"];

	// GITHUB CO-PILOT IS GOATED
	public static function capitalizeFirstLetters(str:String):String
	{
		var words:Array<String> = str.split(" ");
		var newWords:Array<String> = new Array<String>();
		for (i in 0...words.length)
		{
			newWords.push(words[i].charAt(0).toUpperCase() + words[i].substr(1));
		}
		return newWords.join(" ");
	}

	public static function fileExists(path:String):Bool
	{
		return #if !sys lime.utils.Assets.exists(path); #else sys.FileSystem.exists(path); #end
	}

	public static function getFile(path:String):String
	{
		return #if !sys lime.utils.Assets.getText(path); #else sys.io.File.getContent(path); #end
	}

	public static function difficultyString():String
	{
		return difficultyArray[PlayState.storyDifficulty];
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function colorFromString(color:String):FlxColor
	{
		var hideChars = ~/[\t\n\r]/;
		var color:String = hideChars.split(color).join('').trim();
		if(color.startsWith('0x')) color = color.substring(color.length - 6);

		var colorNum:Null<FlxColor> = FlxColor.fromString(color);
		if(colorNum == null) colorNum = FlxColor.fromString('#$color');
		return colorNum != null ? colorNum : FlxColor.WHITE;
	}
	
	public static function reverseString(string:String):String
	{
		var newString:StringBuf = new StringBuf();
		for (i in -string.length + 1...1)
			newString.addChar(string.fastCodeAt(-i));
		return string = newString.toString();
	}

	inline public static function boundTo(value:Float, min:Float, max:Float):Float {
		return Math.max(min, Math.min(max, value));
	}
	
	public static function coolStringFile(path:String):Array<String>
	{
		var daList:Array<String> = path.trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}
	
	public static function showPopUp(message:String, title:String):Void
	{
		/*#if android
		android.Tools.showAlertDialog(title, message, {name: "OK", func: null}, null);
		#else*/
		FlxG.stage.window.alert(message, title);
		//#end
	}
}
