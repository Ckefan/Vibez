package com.example.flutter_app

import android.content.Context
import android.view.View
import android.webkit.WebView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

class MyFlutterView(context: Context, messenger: BinaryMessenger, viewId: Int, args: Map<String, Any>?) : PlatformView {

    val WebView: WebView = WebView(context)

    init {
//        EditText.text = "我是Android View123"
    }

    override fun getView(): View {
        return WebView
    }
    override fun dispose() {
        TODO("Not yet implemented")
    }
}
