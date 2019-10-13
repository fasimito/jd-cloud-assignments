package com.jd.service;

import java.util.List;

import com.jd.domain.ShortUrlBase;

public interface ShortUrlBaseService {
    String save(String[] keys, String url, String comments);
    List<ShortUrlBase> pageQueryShortUrls(int currPage, int pageSize);
    ShortUrlBase selectByKey(String shortKey);
}
