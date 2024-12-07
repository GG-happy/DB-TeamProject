package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(@AuthenticationPrincipal User user, Model model) {
        // 인증 정보를 Thymeleaf에서 처리 (SecurityContext는 자동 사용)
        if (user != null) {
            String username = user.getUsername();
            Map<String, Object> userinfo= UserService.getUserInfo(username);

            model.addAttribute("isAuthentication",true);
            model.addAttribute("username", username);
            model.addAttribute("name", userinfo.get("name"));
            model.addAttribute("title", userinfo.get("title"));
            model.addAttribute("phone", userinfo.get("phone"));
            model.addAttribute("email", userinfo.get("email"));
            model.addAttribute("role", userinfo.get("role"));
            return "index";
        } else {
            System.out.println("사용자가 로그인되어 있지 않습니다.");
            model.addAttribute("isAuthentication",false);
            return "index";
        }

    }
}
