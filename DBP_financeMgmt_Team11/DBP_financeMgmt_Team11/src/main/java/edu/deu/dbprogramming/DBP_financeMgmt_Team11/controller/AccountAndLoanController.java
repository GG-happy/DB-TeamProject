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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Map;

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
        if (accountAndLoanDto.getLoanId() == null) {
            model.addAttribute("isLoan", false);
        }else{
            model.addAttribute("isLoan", true);
        }
        model.addAttribute("accountAndLoan", accountAndLoanDto);

        return "accountAndLoanEdit"; // HTML 파일 이름
    }

    @PostMapping("/AccountAndLoanEdit/save")
    public String saveAccountAndLoan(@AuthenticationPrincipal User user,
                                     Model model,
                                     HttpSession session,
                                     @RequestParam Map<String, String> formData) {

        // 사용자 정보 확인
        Map<String, Object> userinfo = UserService.getUserInfo(user);
        String clientCode;
        if (userinfo.get("role").equals("ROLE_bank-manager")) {
            clientCode = (String) session.getAttribute("SelectedClientCode");
            model.addAttribute("isManager", true);
        } else {
            clientCode = (String) userinfo.get("client_code");
            model.addAttribute("isManager", false);
            if (clientCode == null) {
                return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
            }
        }

        // AccountAndLoanDto 객체 생성 및 데이터 매핑
        AccountAndLoanDto accountAndLoanDto = new AccountAndLoanDto();
        accountAndLoanDto.setAccountId(formData.get("accountId"));
        accountAndLoanDto.setAccountNo(formData.get("accountNo"));
        accountAndLoanDto.setAccountName(formData.get("accountName"));
        accountAndLoanDto.setClassifica(formData.get("classifica"));
        accountAndLoanDto.setBalance(Double.parseDouble(formData.get("balance")));
        accountAndLoanDto.setBranch(formData.get("branch"));
        accountAndLoanDto.setOpenDate(formData.get("openDate"));
        if(formData.get("loanId") != null) {
            accountAndLoanDto.setLoanId(formData.get("loanId"));
            accountAndLoanDto.setLoanAmount(Double.parseDouble(formData.get("loanAmount")));
            accountAndLoanDto.setRepaymentPeriod(Integer.parseInt(formData.get("repaymentPeriod")));
            accountAndLoanDto.setRepaymentStatus(formData.get("repaymentStatus"));
            accountAndLoanDto.setAppliedRate(Double.parseDouble(formData.get("loanRate")));
        }

        // 서비스 계층을 통해 데이터 저장
        accountAndLoanService.updateAccountAndLoan(clientCode, accountAndLoanDto);

        // 수정 완료 후 리다이렉트
        return "redirect:/clientHome";
    }

}
