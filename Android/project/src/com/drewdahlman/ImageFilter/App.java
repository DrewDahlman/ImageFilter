package com.drewdahlman.ImageFilter;

import android.content.Context;
import android.os.Bundle;
import com.phonegap.*;

public class App extends DroidGap {
	public static Context context;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        super.loadUrl("file:///android_asset/www/index.html");
        context = getApplicationContext();
        
    }
}