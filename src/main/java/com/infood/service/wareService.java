package com.infood.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.infood.model.wareModel;
import com.infood.repository.wareRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class wareService{
    @Autowired
    wareRepository wareRepository;
    
    ObjectMapper objectMapper = new ObjectMapper();

    public String findWareByUser( String userid) throws JsonProcessingException
    {
        System.out.println("findWareByUser called");
        return objectMapper.writeValueAsString( ListToList( wareRepository.queryByUser(userid) ) ) ;
    }

    public List<wareModel> ListToList( List<Map<String, Object>> list )
    {
        List<wareModel> result = new ArrayList<wareModel>();
        for( Map<String, Object> m: list )
        {
            wareModel temp = new wareModel();
            temp.setLastSaw( (String) m.get("lastSaw"));
            temp.setWareID( (String) m.get("wareid"));
            temp.setWareName((String) m.get("warename") );
            temp.setColor((String) m.get("color") );                 
            result.add(temp);
        }
        return result;        
    }
}