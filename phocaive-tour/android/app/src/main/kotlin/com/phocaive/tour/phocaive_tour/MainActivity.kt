package com.phocaive.tour.phocaive_tour

import android.os.Build
import android.os.Bundle
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // Disable Android 12+ splash screen API
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            // Make sure splash screen is not shown
            splashScreen.setOnExitAnimationListener { splashScreenView ->
                splashScreenView.remove()
            }
        }
        
        // Ensure edge-to-edge display
        WindowCompat.setDecorFitsSystemWindows(window, false)
        
        super.onCreate(savedInstanceState)
    }
}
