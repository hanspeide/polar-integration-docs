package com.polarb.android;

import android.app.Activity;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.LinearLayout;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        PolarWebView webView = new PolarWebViewBuilder(this, "jcole", PolarEnvironment.PRODUCTION).withPollSetId(926).build();
        ((LinearLayout)findViewById(R.id.container)).addView(webView);
    }
}
