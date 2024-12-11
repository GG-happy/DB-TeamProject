package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.ApplyForLoanEntity;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.ApplyForLoanService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UtilityCodeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Map;

@Controller
public class ApplyForLoanController {

    private final ApplyForLoanService applyForLoanService;
    private final UtilityCodeService utilityCodeService;
    private final ApplyForLoanEntity applyForLoanEntity;

    public ApplyForLoanController(ApplyForLoanService applyForLoanService, UtilityCodeService utilityCodeService, ApplyForLoanEntity applyForLoanEntity) {
        this.applyForLoanService = applyForLoanService;
        this.utilityCodeService = utilityCodeService;
        this.applyForLoanEntity = applyForLoanEntity;
    }

    @GetMapping("/applyForLoan")
    public String showAccountAndLoan(@AuthenticationPrincipal User user, Model model, HttpSession session) {

        String clientCode = utilityCodeService.setupUserInfo(user, model, session);
        //String clientCode = setupUserInfo(user, model, session);
        if (clientCode == null) {
            return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
        }

        Long loanLimit=applyForLoanService.checkLoanLimit(clientCode);
        Long apppliedRate=applyForLoanService.checkApppliedRate(clientCode);

        model.addAttribute("loanLimit", loanLimit);
        model.addAttribute("apppliedRate", apppliedRate);

        return "applyForLoan"; // HTML 파일 이름
    }

    @PostMapping("/applyForLoan/save")
    public String saveApplyForLoan(@AuthenticationPrincipal User user, Model model, HttpSession session,
                                   @RequestParam Map<String, String> formData) {
        String clientCode = utilityCodeService.setupUserInfo(user, model, session);
        if (clientCode == null) {
            return "redirect:/";
        }


        Long new_loanLimit = applyForLoanService.checkLoanLimit(clientCode);
        Long new_appliedRate = applyForLoanService.checkApppliedRate(clientCode);
        Long formAppliedRate = Long.parseLong(formData.get("appliedRate"));
        Long formLoanLimit = Long.parseLong(formData.get("loanLimit"));
        long formLoanAmount = Long.parseLong(formData.get("loanAmount"));

        //대출신청 전 이율과 한도 변경 확인
        if (!formAppliedRate.equals(new_appliedRate) || !formLoanLimit.equals(new_loanLimit)) {
            return "something-wrong";
        }
        //대출한도 초과 확인
        if (formLoanLimit<formLoanAmount) {
            return "something-wrong";
        }
        //ApplyForLoanEntity aflEntity = new ApplyForLoanEntity();
        applyForLoanEntity.setAccountName(formData.get("accountName"));
        applyForLoanEntity.setClassifica(formData.get("classification"));
        applyForLoanEntity.setBranch(formData.get("branch"));
        applyForLoanEntity.setLoanAmount(Double.parseDouble(formData.get("loanAmount")));
        applyForLoanEntity.setRepaymentPeriod(LocalDate.parse(formData.get("repaymentPeriod")));

        applyForLoanEntity.setCompanyCode(clientCode);
        applyForLoanEntity.setInterestId(applyForLoanService.checkInterestId());

        if(applyForLoanService.requestLoan(clientCode,applyForLoanEntity)){
            return "redirect:/clientHome";
        }else{
            return "something-wrong";
        }

    }
}
