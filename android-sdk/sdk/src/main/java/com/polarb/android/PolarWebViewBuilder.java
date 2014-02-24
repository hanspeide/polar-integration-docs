package com.polarb.android;

import android.content.Context;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/**
 * Created by hanspeide on 2/21/14.
 */
public class PolarWebViewBuilder {

    private PolarWebView polarWebView;

    public PolarWebViewBuilder(Context context, String userName, PolarEnvironment polarEnvironment){
        polarWebView = new PolarWebView(context);
        polarWebView.setUserName(userName);
        polarWebView.setEnvironment(polarEnvironment);
    }

    public PolarWebViewBuilder withPollSetId(int pollSetId){
        polarWebView.setPollSetId(pollSetId);

        return this;
    }

    public PolarWebViewBuilder withPoll(int pollId){
        polarWebView.setPollId(pollId);

        return this;
    }

    public PolarWebViewBuilder withWidth(int width){
        polarWebView.setWebViewWidth(width);

        return this;
    }

    public PolarWebViewBuilder withHeight(int height){
        polarWebView.setWebViewHeight(height);

        return this;
    }

    public PolarWebView build(){
        String pollUrl = "";

        if (polarWebView.getPollId() != -1 && polarWebView.getPollSetId() != -1){
            throw new IllegalArgumentException("Both pollId and pollSetId are set. You can only set one of them");
        } else {
            if (polarWebView.getPollId() != -1){
                pollUrl = "/publishers/%s/embedded_polls/iframe?poll_id=%d";
            } else if (polarWebView.getPollSetId() != -1){
                pollUrl = "/publishers/%s/embedded_polls/iframe?pollset_id=%d";
            }
        }

        polarWebView.getSettings().setJavaScriptEnabled(true);
        polarWebView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);
        polarWebView.getSettings().setDomStorageEnabled(true);
        polarWebView.setWebViewClient(new WebViewClient(){
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                return true;
            }
        });

        if (polarWebView.getPollId() != -1){
            polarWebView.loadUrl(String.format(polarWebView.getEnvironment().toString().concat(pollUrl),
                    polarWebView.getUserName(),
                    polarWebView.getPollId()));
        } else if (polarWebView.getPollSetId() != -1){
            polarWebView.loadUrl(String.format(polarWebView.getEnvironment().toString().concat(pollUrl),
                    polarWebView.getUserName(),
                    polarWebView.getPollSetId()));
        }


        return polarWebView;
    }
}
