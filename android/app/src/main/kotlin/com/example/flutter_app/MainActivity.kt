package com.example.Vibez

import io.flutter.embedding.android.FlutterActivity

import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Bundle
import androidx.annotation.NonNull
import com.example.flutter_app.MyPlugin
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery" //跟flutter对应的唯一标示

    override fun configureFlutterEngine(@NonNull flutterEngine :FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        flutterEngine.plugins.add(MyPlugin()) //注册原生页面

        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState);
//
//
//    }

    //获取电量
    private  fun getBatteryLevel():Int{
        val batteryLevel: Int
        if(VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP){
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        }else{
            val intent = ContextWrapper(applicationContext).registerReceiver(null,IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL,-1)*100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE,-1)
        }
        return  batteryLevel
    }
}
