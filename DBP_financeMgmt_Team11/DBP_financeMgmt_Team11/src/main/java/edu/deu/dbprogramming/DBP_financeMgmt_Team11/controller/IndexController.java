package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;


@Controller
public class IndexController {

    private final UserService userService;

    // 생성자 주입 방식
    public IndexController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(@AuthenticationPrincipal User user, Model model, HttpSession session) {

        if (user != null) {
            String username = user.getUsername();
            Map<String, Object> userinfo = userService.getUserInfo(username); // 수정된 부분

            model.addAttribute("isAuthentication", true);
            model.addAttribute("username", username);
            model.addAttribute("name", userinfo.get("name"));
            model.addAttribute("title", userinfo.get("title"));
            model.addAttribute("phone", userinfo.get("phone"));
            model.addAttribute("email", userinfo.get("email"));
            model.addAttribute("role", userinfo.get("role"));

            if ("ROLE_bank-manager".equals(userinfo.get("role"))) {
                model.addAttribute("isManager", true);
            } else {
                model.addAttribute("isManager", false);
            }

            model.addAttribute("isClientLinked", userinfo.get("client_code") != null);
        } else {
            model.addAttribute("isAuthentication", false);
            model.addAttribute("isManager", false);
            model.addAttribute("isClientLinked", false);
        }
        return "index";
    }

    @PostMapping("/connectClientCode")
    public String connectClientCode(
            @RequestParam String companyID,
            @RequestParam String companyName,
            @AuthenticationPrincipal User user) {

        Map<String, Object> userinfo = userService.getUserInfo(user.getUsername()); // 수정된 부분
        userService.updateClientCode((String) userinfo.get("username"), companyID);

        return "redirect:/";
    }
}
