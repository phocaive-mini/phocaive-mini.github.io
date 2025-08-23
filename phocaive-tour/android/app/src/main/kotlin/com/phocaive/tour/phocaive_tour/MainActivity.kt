package com.phocaive.tour.phocaive_tour

import android.os.Build
import android.os.Bundle
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Ensure edge-to-edge display
        WindowCompat.setDecorFitsSystemWindows(window, false)
    }
}
