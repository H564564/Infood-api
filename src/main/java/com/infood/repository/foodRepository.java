package com.infood.repository;

import java.beans.Statement;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import com.infood.model.foodModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class foodRepository {

    @Autowired
    private JdbcTemplate jdbc;

    public List<Map<String, Object>> queryAllFood() {
        /*
         * ResultSetExtractor<List<foodModel>> allFood = new
         * ResultSetExtractor<List<foodModel>>()
         * {
         * 
         * @Override
         * public List<foodModel> extractData( ResultSet rs ) throws SQLException
         * {
         * List<foodModel> list = new ArrayList<foodModel>();
         * while(rs.next())
         * {
         * foodModel obj = new foodModel();
         * 
         * }
         * }
         * };
         */
        System.out.println("start query all food");
        List<Map<String, Object>> allfood = jdbc.queryForList("Select * From `food`");
        testList(allfood);
        return allfood;
    }

    public void addFood(String userid,foodModel food) {
        String sql = "INSERT INTO `infood`.`food` (`foodid`, `userid`, `wareid`, `foodname`, `foodamount`, `foodunit`, `fooddata`, `foodtime`, `buytime`, `foodfrom`, `buyfrom`, `food_type`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        jdbc.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, food.getFoodID()); // 1st question mark
            ps.setString(2, userid); 
            ps.setString(3, "W"); //固定先放在待分類
            ps.setString(4, food.getFoodName());
            ps.setInt(5, food.getFoodAmount());
            ps.setString(6, food.getFoodUnit());
            ps.setString(7, food.getFoodData());
            ps.setTimestamp(8, java.sql.Timestamp.valueOf(food.getFoodTime()) );
            ps.setTimestamp(9, java.sql.Timestamp.valueOf(food.getBuyTime()) );
            ps.setString(10, food.getFoodFrom());
            ps.setString(11, food.getBuyFrom());
            ps.setString(12, food.getFoodType());
            return ps;
        });
    }

    // 接收userid 和 wareid 來查詢 food
    public List<Map<String, Object>> queryByUserAndWare(String user, String ware) {
        System.out.println("start query some food");
        List<Map<String, Object>> food = jdbc.queryForList("Select * From `food` Where userid=? And  wareid=?", user,
                ware);
        return food;
    }

    // 測試List內容物
    public void testList(List<Map<String, Object>> list) {
        for (Map<String, Object> m : list) {
            System.out.println("-----start of one -----");

            for (String k : m.keySet()) {
                // System.out.println("m.key= " + m);
                System.out.println(k + "\t" + m.get(k));
            }
            System.out.println("-----end of one -----");
        }
    }
}
