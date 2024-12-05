package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class ManagerHomeController {
    @GetMapping("/manager-home")
    public String myInfo(@AuthenticationPrincipal User user, Model model) {
        // 로그인된 사용자 이름 가져오기
        String username = user.getUsername();
        Map<String, Object> userinfo= UserService.getUserInfo(username);
        userinfo.get("name");

        // 모델에 사용자 이름 추가
        model.addAttribute("name", userinfo.get("name"));
        model.addAttribute("title", userinfo.get("title"));
        model.addAttribute("phone", userinfo.get("phone"));
        model.addAttribute("email", userinfo.get("email"));

        return "manager-home"; // manager-home.html 뷰로 이동
    }
}
