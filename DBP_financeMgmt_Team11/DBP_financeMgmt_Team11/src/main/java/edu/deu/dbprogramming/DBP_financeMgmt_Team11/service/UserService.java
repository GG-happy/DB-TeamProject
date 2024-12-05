package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.UserDao;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {

    private static UserDao userDao = null;

    public UserService(UserDao userDao) {
        UserService.userDao = userDao;
    }

    // 모든 사용자 정보 조회
    public List<Map<String, Object>> getAllUsers() {
        return userDao.getAllUsers();
    }

    // 특정 사용자 정보 조회
    public static Map<String, Object> getUserInfo(String userId) {
        Map<String, Object> user = userDao.getUserById(userId);

        // 추가 로직 (예: 특정 필드 검증, 데이터 가공 등)
        if (user == null || user.isEmpty()) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }

        return user;
    }

    public static Map<String, Object> getUserInfo(User user) {
        Map<String, Object> userMap = userDao.getUserById(user.getUsername());

        // 추가 로직 (예: 특정 필드 검증, 데이터 가공 등)
        if (userMap == null || userMap.isEmpty()) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }
        return userMap;
    }

    public String getClientCode(String userId) {
        String clientCode=userDao.getClientCodeByUserId(userId);

        // 추가 로직 (예: 특정 필드 검증, 데이터 가공 등)
        if (clientCode == null || clientCode.isEmpty()) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }
        return clientCode;
    }

    public String getClientCode(User user) {
        String clientCode=userDao.getClientCodeByUserId(user.getUsername());

        // 추가 로직 (예: 특정 필드 검증, 데이터 가공 등)
        if (clientCode == null || clientCode.isEmpty()) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }
        return clientCode;
    }
}
