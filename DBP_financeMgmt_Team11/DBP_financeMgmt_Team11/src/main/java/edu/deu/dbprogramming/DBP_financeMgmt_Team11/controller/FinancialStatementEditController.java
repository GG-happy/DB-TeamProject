package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class FinancialStatementEditController {

    @GetMapping("/FinancialStatementEdit")
    public String showFinancialStatementEdit(@AuthenticationPrincipal User user, Model model,
                                             HttpSession httpSession,
                                             @RequestParam(value = "year", required = false) String select_year,
                                             @RequestParam(value = "quarter", required = false) String select_quarter) {

        //TODO:DB연동 필요

        List<Integer> years = IntStream.rangeClosed(2000, java.time.Year.now().getValue())
                .boxed()
                .sorted(Collections.reverseOrder()) // 내림차순으로 정렬
                .collect(Collectors.toList());

        model.addAttribute("years", years);
        model.addAttribute("select_year", select_year);
        model.addAttribute("select_quarter", select_quarter);
        return "financialStatementEdit"; // HTML 파일 이름

    }
}
