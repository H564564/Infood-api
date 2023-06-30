package com.infood.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.infood.model.foodModel;
import com.infood.service.foodService;
import com.infood.service.recommendService;
import com.infood.service.wareService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController // This means that this class is a Controller
@RequestMapping(path="/user") // This means URL's start with /demo (after Application path)
public class mainController {

    @Autowired
    foodService foodservice;
    @Autowired
    wareService wareService;
    @Autowired
    recommendService recommendService;
    

    //query 所有user
    @GetMapping
    public String hello()
    {
        return "just all user";
    }

    //query 特定user
    @GetMapping("{id}")
    public String hello2(@PathVariable("id") String id)
    {
        return String.format("just user + %s", id);
    }


    @GetMapping("/food")
    public String findAllFood() throws JsonProcessingException
    {
        return foodservice.findAllFood();
    }

    //query 特定user 的 recommendList
    @GetMapping("{id}/recommend")
    public String getRecommendation(@PathVariable("id") String id) throws JsonProcessingException
    {
        return recommendService.findRecommendByUser(id);        
    }

    @PostMapping("/{id}/food")
    public void addFood( @PathVariable("id") String userid, @RequestBody foodModel food ) throws Exception
    {
        foodservice.AddFood(userid, food);
    }    

    //query 特定user 的wareList
	@GetMapping("/{id}/ware")
	public String getUserWare(@PathVariable("id") String userid) throws Exception
    {
        System.out.println("getUserWare called");
		return wareService.findWareByUser(userid);
	}

    //query 特定user 的 特定ware裡面的食物
	@GetMapping("/{id}/ware/{wareid}")
	public String getUserFood(@PathVariable("id") String userid, @PathVariable("wareid") String wareid) throws Exception
    {
		return foodservice.findFoodByUserAndWare(userid, wareid);
	}

   


    
   
  
}