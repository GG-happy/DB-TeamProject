package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Map;

@Service
public class UtilityCodeService {

    /**
     * 사용자 정보와 클라이언트 코드를 설정하는 메서드
     */
    public String setupUserInfo(
            @AuthenticationPrincipal User user, Model model, HttpSession session
    ) {
        Map<String, Object> userinfo = UserService.getUserInfo(user);
        String clientCode;
        if ("ROLE_bank-manager".equals(userinfo.get("role"))) {
            clientCode = (String) session.getAttribute("SelectedClientCode");
            model.addAttribute("isManager", true);
        } else {
            clientCode = (String) userinfo.get("client_code");
            model.addAttribute("isManager", false);
        }
        return clientCode;
    }
}
