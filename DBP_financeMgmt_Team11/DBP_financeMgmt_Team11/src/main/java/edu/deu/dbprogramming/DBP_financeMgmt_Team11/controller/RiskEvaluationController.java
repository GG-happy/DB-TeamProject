package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Riskevaluation;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.RiskEvaluationService;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.service.UserService;
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
import java.util.NoSuchElementException;
import java.util.Objects;

@Controller
public class RiskEvaluationController {

    private final RiskEvaluationService riskEvaluationService;
    private final CompanyRepository companyRepository;

    public RiskEvaluationController(RiskEvaluationService riskEvaluationService, CompanyRepository companyRepository) {
        this.riskEvaluationService = riskEvaluationService;
        this.companyRepository = companyRepository;
    }


    @GetMapping("/RiskEvaluation")
    public String latestRiskEvaluation(
            @AuthenticationPrincipal User user, Model model, HttpSession session
    ) {
        String clientCode = setupUserInfo(user, model, session);
        if (clientCode == null) {
            return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
        }

        Riskevaluation riskEvaluation = new Riskevaluation();
        try{
            riskEvaluation=riskEvaluationService.getLatestRiskEvaluation(clientCode);
            model.addAttribute("status", "success");
        }catch (NoSuchElementException e){
            e.printStackTrace();
            riskEvaluation.setRiskId("null");
            model.addAttribute("status", "none");
        }
        model.addAttribute("risk", riskEvaluation);

        return "riskEvaluation";
    }

    @GetMapping("/RiskEvaluation/new")
    public String newRiskEvaluation(
            @AuthenticationPrincipal User user, Model model, HttpSession session
    ) {
        String clientCode = setupUserInfo(user, model, session);
        if (clientCode == null) {
            return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
        }
        Riskevaluation riskEvaluation = new Riskevaluation();
        model.addAttribute("status", "success");
        riskEvaluation.setRiskId("null");
        model.addAttribute("risk", riskEvaluation);
        return "riskEvaluation";
    }

    @GetMapping("/RiskEvaluation/prev")
    public String prevRiskEvaluation(
            @AuthenticationPrincipal User user, Model model, HttpSession session,
            @RequestParam(value = "nowRiskId") String riskId
    ) {
        String clientCode = setupUserInfo(user, model, session);
        if (clientCode == null) {
            return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
        }

        if (riskId.equals("null")) {
            return latestRiskEvaluation(user, model, session);
        }

        Riskevaluation riskEvaluation;
        try{
            riskEvaluation=riskEvaluationService.getPreviousRisk(riskId, clientCode);
            model.addAttribute("status", "success");
        }catch (NoSuchElementException e){
            e.printStackTrace();
            riskEvaluation=riskEvaluationService.getCurrentRisk(riskId, clientCode);
            model.addAttribute("status", "last");
        }
        model.addAttribute("risk", riskEvaluation);
        return "riskEvaluation";
    }

    @GetMapping("/RiskEvaluation/next")
    public String nextRiskEvaluation(
            @AuthenticationPrincipal User user, Model model, HttpSession session,
            @RequestParam(value = "nowRiskId") String riskId
    ) {
        String clientCode = setupUserInfo(user, model, session);
        if (clientCode == null) {
            return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
        }

        if (riskId.equals("null")) {
            return latestRiskEvaluation(user, model, session);
        }

        Riskevaluation riskEvaluation;
        try{
            riskEvaluation=riskEvaluationService.getNextRisk(riskId, clientCode);
            model.addAttribute("status", "success");
        }catch (NoSuchElementException e){
            e.printStackTrace();
            riskEvaluation=riskEvaluationService.getCurrentRisk(riskId, clientCode);
            model.addAttribute("status", "last");
        }
        System.out.println(riskEvaluation.getRiskId());
        model.addAttribute("risk", riskEvaluation);
        return "riskEvaluation";
    }

    @PostMapping("/RiskEvaluation/save")
    public String saveRiskEvaluation(@AuthenticationPrincipal User user, Model model, HttpSession session,
                                     @RequestParam Map<String, String> formData){

        String clientCode = setupUserInfo(user, model, session);
        if (clientCode == null) {
            return "redirect:/"; // client_code가 없는 경우 홈으로 리다이렉션
        }


        Riskevaluation riskEvaluation = new Riskevaluation();
        riskEvaluation.setRiskId(formData.get("risk_id"));
        riskEvaluation.setEvaluationDate(LocalDate.parse(formData.get("evaluation_date")));
        riskEvaluation.setEvaluator(formData.get("evaluator"));
        riskEvaluation.setIndustryRisk(Double.parseDouble(formData.get("industry_risk")));
        riskEvaluation.setManagementRisk(Double.parseDouble(formData.get("management_risk")));
        riskEvaluation.setOperationRisk(Double.parseDouble(formData.get("operation_risk")));
        riskEvaluation.setFinancialRisk(Double.parseDouble(formData.get("financial_risk")));
        riskEvaluation.setCredibility(Double.parseDouble(formData.get("credibility")));
        //riskEvaluation.setTotalScore(Double.parseDouble(formData.get("total_score")));
        riskEvaluation.setCompany(companyRepository.findByCompanyId(clientCode));

        try{
            Riskevaluation result=riskEvaluationService.saveRiskEvaluation(riskEvaluation);
            model.addAttribute("status", "success");    //안씀
            model.addAttribute("risk", result); //안씀
            return "redirect:/RiskEvaluation";
        }catch (Exception e){
            e.printStackTrace();
            return "something-wrong";
        }

    }



    /**
     * 사용자 정보와 클라이언트 코드를 설정하는 메서드
     */
    private String setupUserInfo(
            @AuthenticationPrincipal User user, Model model, HttpSession session
    ) {
        Map<String, Object> userinfo = UserService.getUserInfo(user);
        String clientCode;
        if ("ROLE_bank-manager".equals(userinfo.get("role"))) {
            clientCode = (String) session.getAttribute("SelectedClientCode");
            model.addAttribute("isManager", true);
        } else {
            clientCode = (String) userinfo.get("client_code");
            model.addAttribute("isManager", false);
        }
        return clientCode;
    }
}
