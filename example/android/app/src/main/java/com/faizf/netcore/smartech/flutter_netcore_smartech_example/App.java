package com.faizf.netcore.smartech.flutter_netcore_smartech_example;

import com.netcore.android.Smartech;

import java.lang.ref.WeakReference;

import io.flutter.app.FlutterApplication;

class App extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        Smartech.getInstance(new WeakReference<>(this)).initializeSdk(this);
    }
}
