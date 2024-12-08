package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Entity
@Table(name = "RISKEVALUATION")
public class Riskevaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // DB에서 ID를 자동 생성
    @Size(max = 20)
    @Column(name = "RISK_ID", length = 20)
    private String riskId;

    @NotNull
    @Column(name = "EVALUATION_DATE", nullable = false)
    private LocalDate evaluationDate;

    @Size(max = 30)
    @NotNull
    @Column(name = "EVALUATOR", nullable = false, length = 30)
    private String evaluator;

    @NotNull
    @Column(name = "INDUSTRY_RISK", nullable = false)
    private Double industryRisk;

    @NotNull
    @Column(name = "MANAGEMENT_RISK", nullable = false)
    private Double managementRisk;

    @NotNull
    @Column(name = "OPERATION_RISK", nullable = false)
    private Double operationRisk;

    @NotNull
    @Column(name = "FINANCIAL_RISK", nullable = false)
    private Double financialRisk;

    @NotNull
    @Column(name = "CREDIBILITY", nullable = false)
    private Double credibility;

    @NotNull
    @Column(name = "TOTAL_SCORE", nullable = false)
    private Double totalScore;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "COMPANY_ID", nullable = false)
    private Company company;

    public String getRiskId() {
        return riskId;
    }

    public void setRiskId(String riskId) {
        this.riskId = riskId;
    }

    public LocalDate getEvaluationDate() {
        return evaluationDate;
    }

    public void setEvaluationDate(LocalDate evaluationDate) {
        this.evaluationDate = evaluationDate;
    }

    public String getEvaluator() {
        return evaluator;
    }

    public void setEvaluator(String evaluator) {
        this.evaluator = evaluator;
    }

    public Double getIndustryRisk() {
        return industryRisk;
    }

    public void setIndustryRisk(Double industryRisk) {
        this.industryRisk = industryRisk;
    }

    public Double getManagementRisk() {
        return managementRisk;
    }

    public void setManagementRisk(Double managementRisk) {
        this.managementRisk = managementRisk;
    }

    public Double getOperationRisk() {
        return operationRisk;
    }

    public void setOperationRisk(Double operationRisk) {
        this.operationRisk = operationRisk;
    }

    public Double getFinancialRisk() {
        return financialRisk;
    }

    public void setFinancialRisk(Double financialRisk) {
        this.financialRisk = financialRisk;
    }

    public Double getCredibility() {
        return credibility;
    }

    public void setCredibility(Double credibility) {
        this.credibility = credibility;
    }

    public Double getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Double totalScore) {
        this.totalScore = totalScore;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

}