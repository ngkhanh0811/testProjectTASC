package com.example.testprojecttasc.service.impl;

import java.util.Arrays;

public abstract class FilterBy {
    String[] texts;
    void FilterBy(int role, boolean isAccess, boolean isLead, boolean isActive){
        FilterBy(role, isAccess, isLead, isActive);
    }

    void FilterBy(int role, boolean isAccess, boolean isLead){
        FilterBy(role, isAccess, isLead);
    }

    void FilterBy(int role, boolean isAccess){
        FilterBy(role, isAccess);
    }

    void FilterBy(int role){
        FilterBy(role);
    }
}
