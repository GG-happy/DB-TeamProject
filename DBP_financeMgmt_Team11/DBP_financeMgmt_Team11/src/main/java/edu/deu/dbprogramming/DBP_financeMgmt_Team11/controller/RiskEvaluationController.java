package edu.deu.dbprogramming.DBP_financeMgmt_Team11.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RiskEvaluationController {
    @GetMapping("/RiskEvaluation")
    public String RiskEvaluation() {

        //TODO: DB 연동 필요

        return "riskEvaluation";
    }
}
