package com.infood.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class wareRepository {

    @Autowired
    private JdbcTemplate jdbc;

    //接收userid 來查詢 ware
    public List<Map<String,Object>> queryByUser( String userid )
    {
        System.out.println("start query user's ware");
        List<Map<String,Object>> ware = jdbc.queryForList("Select * From `ware` Where userid=?", userid);
        testList( ware );
        return ware;
    }

    //測試List內容物
    public void testList( List<Map<String,Object>> list)
    {
        for(Map<String,Object> m: list)
        {
            System.out.println("-----start of one -----");
            
            for(String k: m.keySet())
            {
                //System.out.println("m.key= " + m);
                System.out.println(k + "\t" + m.get(k));                
            }
            System.out.println("-----end of one -----");
        }
    }    
}
