package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.AccountService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository; // CompanyRepository 사용
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccountMakeController {

    @Autowired
    private CompanyRepository companyRepository; // 기존 CompanyService 대신 Repository 사용

    @Autowired
    private AccountService accountService;

    // 계좌 등록 페이지
    @GetMapping("/account/make")
    public String showAccountRegisterPage(Model model) {
        // 기업 정보 추가 (Repository로 변경)
        model.addAttribute("companies", companyRepository.findAll());
        return "AccountRegister"; // account-register.html로 이동
    }

    // 계좌 등록 처리
    @PostMapping("/account/make")
    public String registerAccount(
            @RequestParam String accountNo,
            @RequestParam String accountName,
            @RequestParam String classifica,
            @RequestParam String branch,
            @RequestParam Company companyId) {
        // 계좌 등록 로직 실행
        accountService.registerAccount(accountNo, accountName, classifica, branch, companyId);
        return "redirect:/"; // 메인 페이지로 리다이렉트
    }
}
