package edu.deu.dbprogramming.DBP_financeMgmt_Team11;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomeController {
    @GetMapping("/admin-home")
    public String myInfo(@AuthenticationPrincipal User user, Model model) {
        // 로그인된 사용자 이름 가져오기
        String username = user.getUsername();

        // 모델에 사용자 이름 추가
        model.addAttribute("username", username);

        return "admin-home"; // client-home.html 뷰로 이동
    }
}
