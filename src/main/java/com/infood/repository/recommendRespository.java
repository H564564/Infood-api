package com.infood.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class recommendRespository {
    @Autowired
    private JdbcTemplate jdbc;

    //接收userid 來查詢 ware
    public List<Map<String,Object>> queryByUser( String userid )
    {
        System.out.println("start query user's recommendation");
        List<Map<String,Object>> recommend = jdbc.queryForList("Select * From `recommendation` Where userid=?", userid);
        
        return recommend;
    }
}
