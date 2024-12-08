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
    private Long industryRisk;

    @NotNull
    @Column(name = "MANAGEMENT_RISK", nullable = false)
    private Long managementRisk;

    @NotNull
    @Column(name = "OPERATION_RISK", nullable = false)
    private Long operationRisk;

    @NotNull
    @Column(name = "FINANCIAL_RISK", nullable = false)
    private Long financialRisk;

    @NotNull
    @Column(name = "CREDIBILITY", nullable = false)
    private Long credibility;

    @NotNull
    @Column(name = "TOTAL_SCORE", nullable = false)
    private Long totalScore;

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

    public Long getIndustryRisk() {
        return industryRisk;
    }

    public void setIndustryRisk(Long industryRisk) {
        this.industryRisk = industryRisk;
    }

    public Long getManagementRisk() {
        return managementRisk;
    }

    public void setManagementRisk(Long managementRisk) {
        this.managementRisk = managementRisk;
    }

    public Long getOperationRisk() {
        return operationRisk;
    }

    public void setOperationRisk(Long operationRisk) {
        this.operationRisk = operationRisk;
    }

    public Long getFinancialRisk() {
        return financialRisk;
    }

    public void setFinancialRisk(Long financialRisk) {
        this.financialRisk = financialRisk;
    }

    public Long getCredibility() {
        return credibility;
    }

    public void setCredibility(Long credibility) {
        this.credibility = credibility;
    }

    public Long getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Long totalScore) {
        this.totalScore = totalScore;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

}