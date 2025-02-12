package com.example.scanner

import io.flutter.embedding.android.FlutterActivity
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.WindowInsetsControllerCompat
import android.graphics.Color

class MainActivity : FlutterActivity() {
    override fun onResume() {
        super.onResume()

        WindowCompat.setDecorFitsSystemWindows(window, false)

        val windowInsetsController = WindowInsetsControllerCompat(window, window.decorView)
        windowInsetsController.isAppearanceLightStatusBars = true // Icônes noires
        windowInsetsController.systemBarsBehavior = WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE

        window.statusBarColor = Color.TRANSPARENT

        windowInsetsController.hide(WindowInsetsCompat.Type.navigationBars())
    }
}
