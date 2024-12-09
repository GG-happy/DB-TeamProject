package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.UserRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.CompanyService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SignUpController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CompanyService companyService;

    @GetMapping("/userInfoEdit")
    public String myInfo(@AuthenticationPrincipal User user, Model model) {
        // 로그인된 사용자 이름 가져오기
        String username = user.getUsername();
        Map<String, Object> userinfo= UserService.getUserInfo(username);
        //userinfo.get("name");

        //기업 리스트 가져오기
        List<Company> companies = companyService.getAllCompanies();

        // 모델에 사용자 이름 추가
        model.addAttribute("username", username);
        model.addAttribute("name", userinfo.get("name"));
        model.addAttribute("title", userinfo.get("title"));
        model.addAttribute("phone", userinfo.get("phone"));
        model.addAttribute("email", userinfo.get("email"));
        model.addAttribute("role", userinfo.get("role"));
        model.addAttribute("companies", companies);

        model.addAttribute("page_title", "회원정보 수정");
        model.addAttribute("submit_button", "수정");
        model.addAttribute("pw_placeholder", "수정안함");
        model.addAttribute("isSignUp", false);

        return "signup"; // managerHome.html 뷰로 이동
    }
    @GetMapping("/signup")
    public String signup(@AuthenticationPrincipal User user, Model model) {
        if (user != null) {
            return "redirect:/userInfoEdit";
        }
        model.addAttribute("page_title", "회원가입");
        model.addAttribute("submit_button", "회원가입");
        model.addAttribute("pw_placeholder", "어렵게 쓰세요");
        model.addAttribute("isSignUp", true);
        return "signup";
    }

    @PostMapping("/userRegister")
    public String handleRegisterForm(
            @RequestParam String username,
            @RequestParam(required = false) String companyId,
            @RequestParam(required = false) String password,
            @RequestParam(required = false) String passwordCheck,
            @RequestParam(required = false) String passwordEdit,
            @RequestParam(required = false) String passwordEditCheck,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String phone,
            @RequestParam String role,
            @RequestParam(required = false) String company,
            @RequestParam boolean isSignUp,
            @RequestParam(required = false) String original_username,
            Model model
    ) {
        // 입력된 데이터 출력 (디버깅용)
        System.out.printf("아이디: %s, 비밀번호: %s, 비밀번호 수정: %s 이름: %s, 이메일: %s, 전화번호: %s, 구분: %s%n",
                username, password, passwordEdit, name, email, phone, role);
        System.out.println("선택된 기업 ID: " + company);

        // 데이터 처리 로직 (예: DB 저장)
        // userService.saveOrUpdateUser(...);
        Map<String, Object> userMap= new HashMap<>();
        userMap.put("username", username);
        userMap.put("password", password);
        userMap.put("passwordCheck", passwordCheck);
        userMap.put("passwordEdit", passwordEdit);
        userMap.put("passwordEditCheck", passwordEditCheck);
        userMap.put("name", name);
        userMap.put("title", title);
        userMap.put("email", email);
        userMap.put("phone", phone);
        userMap.put("role", role);
        userMap.put("isSignUp", isSignUp);
        userMap.put("original_username", original_username);

        if (isSignUp) {
            if (UserService.addUser(userMap)) {
                if(company != null) {
                    UserService.updateClientCode(username,company);
                }
                return "signup-success";
            } else {
                return "something-wrong";
            }
        }else{
            if(UserService.updateUser(userMap)){
                // 기존 사용자 정보 업데이트 후 기업 코드 수정
                if(company != null) {
                    UserService.updateClientCode(username,company);
                }

                if (!username.equals(original_username)){
                    //ID변경시 재로그인 필요
                    return "redirect:/login?logout";
                }
                return "redirect:/";
            }else{
                return "something-wrong";
            }
        }
    }
}
