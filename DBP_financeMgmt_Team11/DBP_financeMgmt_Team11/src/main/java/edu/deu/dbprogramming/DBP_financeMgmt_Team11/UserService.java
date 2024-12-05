package edu.deu.dbprogramming.DBP_financeMgmt_Team11;

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
    public static Map<String, Object> getUserById(String userId) {
        Map<String, Object> user = userDao.getUserById(userId);

        // 추가 로직 (예: 특정 필드 검증, 데이터 가공 등)
        if (user == null || user.isEmpty()) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }

        return user;
    }

    public Map<String, Object> getUserByClientCode(String userId) {
        String clientcode = userDao.getClientCodeByUserId(userId);
        Map<String, Object> user = userDao.getUserById(userId);

        // 추가 로직 (예: 특정 필드 검증, 데이터 가공 등)
        if (user == null || user.isEmpty()) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }


        return user;
    }
}
