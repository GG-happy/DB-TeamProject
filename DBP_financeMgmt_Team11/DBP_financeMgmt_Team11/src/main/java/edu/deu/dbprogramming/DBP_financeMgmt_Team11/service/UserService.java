package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.UserDao;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.UserRepository;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {

    private static UserDao userDao = null;
    private static final UserRepository userRepository = null;
    private static PasswordEncoder passwordEncoder = null;

    public UserService(UserDao userDao, PasswordEncoder passwordEncoder) {
        UserService.userDao = userDao;
        UserService.passwordEncoder = passwordEncoder;
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

    public static String getClientCode(User user) {
        String clientCode=userDao.getClientCodeByUserId(user.getUsername());

        // 추가 로직 (예: 특정 필드 검증, 데이터 가공 등)
        if (clientCode == null || clientCode.isEmpty()) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }
        return clientCode;
    }

    public static boolean addUser(Map<String, Object> userMap) {
        try {
            userMap.put("password", passwordEncoder.encode(userMap.get("password").toString()));
            return userDao.addUser(userMap);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateUser(Map<String, Object> userMap) {
        try {
            //ID 수정 여부 확인
            // 비밀번호 수정 여부 확인
            if (userMap.get("passwordEdit") == null || ((String) userMap.get("passwordEdit")).trim().isEmpty()) {
                // 기존 비밀번호 가져오기
                Map<String, Object> userInfo = getUserInfo((String) userMap.get("original_username"));
                if (userInfo.get("password") == null) {
                    throw new IllegalStateException("기존 사용자 정보를 찾을 수 없습니다."); // 예외 처리
                }
                userMap.put("passwordEdit", userInfo.get("password")); // 기존 비밀번호 유지
            } else {
                // 새 비밀번호 암호화
                userMap.put("passwordEdit", passwordEncoder.encode(userMap.get("passwordEdit").toString()));
            }

            // 사용자 정보 업데이트
            return userDao.updateUser(userMap);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }



    public static boolean updateClientCode(String username, String clientCode) {
        try {
            return userDao.updateClientCode(username,clientCode);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String encryptPassword(String rawPassword) {
        return passwordEncoder.encode(rawPassword);
    }
}
