package com.polarb.android;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class PolarWebView extends WebView {

    private String userName;
    private PolarEnvironment environment;
    private int width;
    private int height;
    private int pollId = -1;
    private int pollSetId = -1;

    public PolarWebView(Context context) {
        super(context);
    }

    public PolarWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PolarWebView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public PolarEnvironment getEnvironment() {
        return environment;
    }

    public void setEnvironment(PolarEnvironment environment) {
        this.environment = environment;
    }

    public int getWebViewWidth() {
        return width;
    }

    public void setWebViewWidth(int width) {
        this.width = width;
    }

    public int getWebViewHeight() {
        return height;
    }

    public void setWebViewHeight(int height) {
        this.height = height;
    }

    public int getPollSetId(){
        return pollSetId;
    }

    public void setPollSetId(int pollSetId) {
        this.pollSetId = pollSetId;
    }

    public int getPollId(){
        return this.pollId;
    }
    public void setPollId(int pollId){
        this.pollId = pollId;
    }


}
