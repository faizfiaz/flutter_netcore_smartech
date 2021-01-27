package com.faizf.netcore.smartech.flutter_netcore_smartech;

import android.app.Application;
import android.content.Context;

import androidx.annotation.NonNull;

import com.netcore.android.Smartech;
import com.netcore.android.logger.SMTDebugLevel;

import java.lang.ref.WeakReference;
import java.util.HashMap;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * FlutterNetcoreSmartechPlugin
 */
public class FlutterNetcoreSmartechPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Application application = null;
    private Context context;
    private Smartech smartechInstance;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_netcore_smartech");
        channel.setMethodCallHandler(this);

        context = flutterPluginBinding.getApplicationContext();
        application = (Application) (flutterPluginBinding.getApplicationContext());
        initializeSmartech(context, application);
    }

    private void initializeSmartech(Context context, Application application) {
        smartechInstance = Smartech.getInstance(new WeakReference<>(context));
        smartechInstance.initializeSdk(application);
        smartechInstance.setDebugLevel(SMTDebugLevel.Level.VERBOSE);
        try {
            smartechInstance.fetchAlreadyGeneratedTokenFromFCM();
        } catch (Exception e) {
            Log.e("TAG", "Fetching FCM token failed.");
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("trackingEvent")) {

            HashMap<String, Object> payload = new HashMap<>();
            payload.put("name", "Nexus 5");
            payload.put("prid", 2);
            payload.put("price", 15000.00);
            payload.put("prqt", 1);
            smartechInstance.trackEvent("Add To Cart", payload);

            result.success(Smartech.getInstance(new WeakReference<>(context)).getAppID());
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
