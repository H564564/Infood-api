package com.infood.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.infood.model.recommendModel;
import com.infood.repository.recommendRespository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class recommendService {

    @Autowired
    recommendRespository recommendRespository;

    ObjectMapper objectMapper = new ObjectMapper();

    public String findRecommendByUser( String userid) throws JsonProcessingException
    {
        System.out.println("findWareByUser called");
        return objectMapper.writeValueAsString( ListToList( recommendRespository.queryByUser(userid) ) ) ;
    }

    public List<recommendModel> ListToList( List<Map<String, Object>> list )
    {
        List<recommendModel> result = new ArrayList<recommendModel>();
        for( Map<String, Object> m: list )
        {
            recommendModel temp = new recommendModel();
            temp.setUserid( (String) m.get("userid"));
            temp.setFoodid( (String) m.get("foodid"));                     
            result.add(temp);
        }
        return result;        
    }
}
