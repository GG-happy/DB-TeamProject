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

    public boolean addUser(Map<String, Object> userMap) {
        String query = """
                    INSERT INTO USERS (USERNAME, PASSWORD, NAME, TITLE, EMAIL, PHONE, ROLE, CLIENT_CODE)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try {
            // jdbcTemplate의 update 메서드로 데이터 삽입
            jdbcTemplate.update(query,
                    userMap.get("username"), // 첫 번째 파라미터: USERNAME
                    userMap.get("password"), // 두 번째 파라미터: PASSWORD
                    userMap.get("name"),     // 세 번째 파라미터: NAME
                    userMap.get("title"),
                    userMap.get("email"),    // 네 번째 파라미터: EMAIL
                    userMap.get("phone"),    // 다섯 번째 파라미터: PHONE
                    userMap.get("role"),     // 여섯 번째 파라미터: ROLE
                    userMap.get("companyID")
            );
            return true; // 성공 시 true 반환
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 실패 시 false 반환
        }
    }

    public boolean updateUser(Map<String, Object> userMap) {
        String query = """
                UPDATE USERS
                SET USERNAME = ?, PASSWORD = ?, NAME = ?, TITLE = ?,  EMAIL = ?, PHONE = ?, ROLE = ?, CLIENT_CODE = ?
                WHERE USERNAME = ?
                """;

        try {
            // jdbcTemplate의 update 메서드로 데이터 삽입
            jdbcTemplate.update(query,
                    userMap.get("username"), // 첫 번째 파라미터: USERNAME
                    userMap.get("passwordEdit"), // 두 번째 파라미터: PASSWORD
                    userMap.get("name"),     // 세 번째 파라미터: NAME
                    userMap.get("title"),
                    userMap.get("email"),    // 네 번째 파라미터: EMAIL
                    userMap.get("phone"),    // 다섯 번째 파라미터: PHONE
                    userMap.get("role"),     // 여섯 번째 파라미터: ROLE
                    userMap.get("companyID"),
                    userMap.get("original_username")
            );
            System.out.println(userMap.get("companyID"));
            return true; // 성공 시 true 반환
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 실패 시 false 반환
        }
    }

    public boolean updateClientCode(String username, String clientCode) {
        String query = "UPDATE USERS SET DBP.USERS.CLIENT_CODE = ? WHERE USERNAME = ?";
        try {
            // jdbcTemplate의 update 메서드로 데이터 삽입
            jdbcTemplate.update(query,
                    clientCode,
                    username
            );
            return true; // 성공 시 true 반환
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 실패 시 false 반환
        }
    }

}
