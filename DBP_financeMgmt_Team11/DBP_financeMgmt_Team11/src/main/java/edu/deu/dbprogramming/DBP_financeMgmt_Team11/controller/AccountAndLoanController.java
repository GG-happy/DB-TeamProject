package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.AccountAndLoanDto;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.AccountAndLoanService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AccountAndLoanController {
    @GetMapping("/AccountAndLoanEdit")
    public String showAccountAndLoan(@AuthenticationPrincipal User user, Model model) {


        //TODO:DB연동 필요


        /*

        // 연도 리스트 (예: 2000~현재 연도)
        List<Integer> years = IntStream.rangeClosed(2000, java.time.Year.now().getValue())
                .boxed()
                .collect(Collectors.toList());
        model.addAttribute("years", years);*/
        return "accountAndLoanEdit"; // HTML 파일 이름
    }
}
