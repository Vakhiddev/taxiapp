package com.example.taxiapp

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setApiKey("acadbce8-d53f-4f79-baf4-1b55852aa9a4") // Your generated API key
  }
}
