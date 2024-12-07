package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RiskEvaluationController {
    @GetMapping("/RiskEvaluation")
    public String RiskEvaluation() {
        return "riskEvaluation";
    }
}
