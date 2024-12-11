package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Entity
@Table(name = "FINANCIALFACTOR")
public class Financialfactor {
    @Id
    @Size(max = 20)
    @Column(name = "FACTOR_ID", nullable = false, length = 20)
    private String factorId;

    @NotNull
    @Column(name = "EVALUATION_DATE", nullable = false)
    private LocalDate evaluationDate;

    @NotNull
    @Column(name = "STABILITY", nullable = false)
    private Double stability;

    @NotNull
    @Column(name = "PROFITABILITY", nullable = false)
    private Double profitability;

    @NotNull
    @Column(name = "ACTIVITY", nullable = false)
    private Double activity;

    @NotNull
    @Column(name = "CASH_FLOW", nullable = false)
    private Double cashFlow;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "COMPANY_ID", nullable = false)
    private Company company;

    @Column(name = "TOTAL_SCORE")
    private Double totalScore;

    public String getFactorId() {
        return factorId;
    }

    public void setFactorId(String factorId) {
        this.factorId = factorId;
    }

    public LocalDate getEvaluationDate() {
        return evaluationDate;
    }

    public void setEvaluationDate(LocalDate evaluationDate) {
        this.evaluationDate = evaluationDate;
    }

    public Double getStability() {
        return stability;
    }

    public void setStability(Double stability) {
        this.stability = stability;
    }

    public Double getProfitability() {
        return profitability;
    }

    public void setProfitability(Double profitability) {
        this.profitability = profitability;
    }

    public Double getActivity() {
        return activity;
    }

    public void setActivity(Double activity) {
        this.activity = activity;
    }

    public Double getCashFlow() {
        return cashFlow;
    }

    public void setCashFlow(Double cashFlow) {
        this.cashFlow = cashFlow;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Double getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Double totalScore) {
        this.totalScore = totalScore;
    }

}