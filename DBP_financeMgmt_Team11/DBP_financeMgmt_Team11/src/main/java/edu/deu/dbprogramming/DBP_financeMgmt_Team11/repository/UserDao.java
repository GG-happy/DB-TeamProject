package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserDao {

    private final JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 모든 사용자 조회
    public List<Map<String, Object>> getAllUsers() {
        String query = "SELECT * FROM USERS";
        return jdbcTemplate.queryForList(query);
    }

    // 특정 사용자 조회
    public Map<String, Object> getUserById(String userId) {
        String query = "SELECT * FROM USERS WHERE USERNAME = ?";
        return jdbcTemplate.queryForMap(query, userId);
    }


    public String getClientCodeByUserId(String userId) {
        String query = "SELECT CLIENT_CODE FROM USERS WHERE USERNAME = ?";
        try {
            return jdbcTemplate.queryForObject(query, new Object[]{userId}, String.class);
        } catch (EmptyResultDataAccessException e) {
            return null; // 결과가 없을 경우 null 반환
        }
    }



}
