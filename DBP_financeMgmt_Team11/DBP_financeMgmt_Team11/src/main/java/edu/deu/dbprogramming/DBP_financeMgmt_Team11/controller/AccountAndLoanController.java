package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.AccountAndLoanDto;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.AccountAndLoanService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Map;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class AccountAndLoanController {

    @Autowired
    private UserService userService;

    @Autowired
    private AccountAndLoanService accountAndLoanService;


    @GetMapping("/AccountAndLoanEdit")
    public String showAccountAndLoan(@AuthenticationPrincipal User user, Model model, HttpSession session,
                                     @RequestParam(value = "accountId", required = false) String accountId) {

        Map<String, Object> userinfo = UserService.getUserInfo(user);
        String clientCode;
        if(userinfo.get("role").equals("ROLE_bank-manager")) {
            clientCode=(String) session.getAttribute("SelectedClientCode");
            model.addAttribute("isManager", true);
        }else {
            clientCode = (String) userinfo.get("client_code");
            model.addAttribute("isManager", false);
            if (clientCode == null) {
                return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
            }
        }

        AccountAndLoanDto accountAndLoanDto = accountAndLoanService.getAccountAndLoanDto(clientCode,accountId);
        model.addAttribute("accountAndLoan", accountAndLoanDto);

        return "accountAndLoanEdit"; // HTML 파일 이름
    }
}
