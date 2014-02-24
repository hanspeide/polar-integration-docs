package com.polarb.android;

public enum PolarEnvironment {
    PRODUCTION("http://assets-polarb-com.a.ssl.fastly.net/api/v4"),
    TEST("http://polar-rails-staging.herokuapp.com/api/v4");

    private final String environment;

    private PolarEnvironment(final String environment){
        this.environment = environment;
    }

    public String toString() {
        return environment;
    }
}
