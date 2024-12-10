package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialstatement;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.FinancialFactorTransactionService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.FinancialStatementEditService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.StoredProcedureService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class FinancialStatementEditController {

    private final FinancialStatementEditService financialStatementEditService;
    private final FinancialFactorTransactionService financialFactorTransactionService;
    private final StoredProcedureService storedProcedureService;
    public FinancialStatementEditController(FinancialStatementEditService financialStatementEditService,
                                            FinancialFactorTransactionService financialFactorTransactionService,
                                            StoredProcedureService storedProcedureService) {
        this.financialStatementEditService = financialStatementEditService; // DI 처리
        this.financialFactorTransactionService = financialFactorTransactionService;
        this.storedProcedureService = storedProcedureService;
    }

    @GetMapping("/FinancialStatementEdit")
    public String showFinancialStatementEdit(@AuthenticationPrincipal User user, Model model,
                                             HttpSession session,
                                             @RequestParam(value = "year", required = false) String select_year,
                                             @RequestParam(value = "quarter", required = false) String select_quarter) {


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


        List<Integer> years = IntStream.rangeClosed(2000, java.time.Year.now().getValue())
                .boxed()
                .sorted(Collections.reverseOrder()) // 내림차순으로 정렬
                .collect(Collectors.toList());


        model.addAttribute("years", years);
        model.addAttribute("select_year", select_year);
        model.addAttribute("select_quarter", select_quarter);

        Financialstatement financialstatement = null;
        if (select_year != null || select_quarter != null) {
            financialstatement = financialStatementEditService.getFinancialStatement(select_year, select_quarter, clientCode);

        }
        model.addAttribute("financial_statement", financialstatement);
        return "financialStatementEdit"; // HTML 파일 이름
    }

    @PostMapping("/FinancialStatementEdit/save")
    public String saveFinancialStatementEdit(@AuthenticationPrincipal User user, Model model, HttpSession session,
                                             @RequestParam Map<String, String> formData){

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

        Financialstatement financialstatement = new Financialstatement();
        financialstatement.setAnnualRevenue(parseLong(formData.get("annualRevenue")));
        financialstatement.setDebtAmount(parseLong(formData.get("debtAmount")));
        financialstatement.setNetProfit(parseLong(formData.get("netProfit")));
        financialstatement.setTotalAssets(parseLong(formData.get("totalAssets")));
        financialstatement.setCurrentAssets(parseLong(formData.get("currentAssets")));
        financialstatement.setFixedAssets(parseLong(formData.get("fixedAssets")));
        financialstatement.setTotalCost(parseLong(formData.get("totalCost")));

        boolean result=financialStatementEditService.saveFinancialStatement(formData.get("year"),formData.get("quarter"),clientCode,financialstatement);
        if(result){
            financialFactorTransactionService.UpdateFinancialFactor(financialstatement);
            storedProcedureService.callUpdateCreditScore(financialstatement);
            return "redirect:/FinancialStatementEdit?year="+formData.get("year")+"&quarter="+formData.get("quarter");
        }else{
            return "something-wrong";
        }
    }

    private Long parseLong(Object value) {
        if (value == null) {
            return null; // null 허용
        }
        try {
            return Long.parseLong(value.toString());
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid number format: " + value);
        }
    }
}