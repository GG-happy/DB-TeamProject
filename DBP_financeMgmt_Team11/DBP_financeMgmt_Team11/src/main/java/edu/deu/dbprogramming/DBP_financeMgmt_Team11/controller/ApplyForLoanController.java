package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApplyForLoanController {
    @GetMapping("/applyForLoan")
    public String showAccountAndLoan(@AuthenticationPrincipal User user, Model model) {


        //TODO:DB연동 필요


        /*

        // 연도 리스트 (예: 2000~현재 연도)
        List<Integer> years = IntStream.rangeClosed(2000, java.time.Year.now().getValue())
                .boxed()
                .collect(Collectors.toList());
        model.addAttribute("years", years);*/
        return "applyForLoan"; // HTML 파일 이름
    }
}
