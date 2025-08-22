#if !macro
// Android
#if android
import android.content.Context as AndroidContext;
import android.widget.Toast as AndroidToast;
import android.os.Environment as AndroidEnvironment;
import android.Permissions as AndroidPermissions;
import android.Settings as AndroidSettings;
import android.Tools as AndroidTools;
import android.os.Build.VERSION as AndroidVersion;
import android.os.Build.VERSION_CODES as AndroidVersionCode;
import android.os.BatteryManager as AndroidBatteryManager;
#end
import mobile.StorageUtil;

#if sys
import sys.*;
import sys.io.*;
#elseif js
import js.html.*;
#end

import Paths;
import flixel.math.FlxMath;
import meta.ClientPrefs;
import meta.CostumeHandler;
import meta.achievements.AchievementHandler;
import states.*;
import states.editors.*;
import states.internal.*;
import states.menus.*;
import states.substates.*;
#end
