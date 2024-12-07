package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class ClientHomeController {

    @GetMapping("/client-home")
    public String myInfo(@AuthenticationPrincipal User user, Model model) {
        // 로그인된 사용자 이름 가져오기
        Map<String, Object> userinfo= UserService.getUserInfo(user);
        userinfo.get("name");
        try{
            String clientCode=userinfo.get("client_code").toString();

        }catch (NullPointerException e){
            return "redirect:/";
        }


        // 모델에 사용자 이름 추가
        model.addAttribute("name", userinfo.get("name"));
        model.addAttribute("title", userinfo.get("title"));



        model.addAttribute("phone", userinfo.get("phone"));
        model.addAttribute("email", userinfo.get("email"));

        return "client-home"; // client-home.html 뷰로 이동
    }
}
