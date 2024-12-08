package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "FINANCIALSTATEMENT")
public class Financialstatement {
    @Id
    @Size(max = 20)
    @Column(name = "STATEMENT_ID", nullable = false, length = 20)
    private String satementId;

    @Size(max = 20)
    @NotNull
    @Column(name = "QUARTER", nullable = false, length = 20)
    private String quarter;

    @Column(name = "ANNUAL_REVENUE")
    private Long annualRevenue;

    @Column(name = "DEBT_AMOUNT")
    private Long debtAmount;

    @Column(name = "NET_PROFIT")
    private Long netProfit;

    @Column(name = "TOTAL_ASSETS")
    private Long totalAssets;

    @Column(name = "CURRENT_ASSETS")
    private Long currentAssets;

    @Column(name = "FIXED_ASSETS")
    private Long fixedAssets;

    @Column(name = "TOTAL_COST")
    private Long totalCost;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "COMPANY_ID", nullable = false)
    private Company company;

    public String getSatementId() {
        return satementId;
    }

    public void setSatementId(String satementId) {
        this.satementId = satementId;
    }

    public String getQuarter() {
        return quarter;
    }

    public void setQuarter(String quarter) {
        this.quarter = quarter;
    }

    public Long getAnnualRevenue() {
        return annualRevenue;
    }

    public void setAnnualRevenue(Long annualRevenue) {
        this.annualRevenue = annualRevenue;
    }

    public Long getDebtAmount() {
        return debtAmount;
    }

    public void setDebtAmount(Long debtAmount) {
        this.debtAmount = debtAmount;
    }

    public Long getNetProfit() {
        return netProfit;
    }

    public void setNetProfit(Long netProfit) {
        this.netProfit = netProfit;
    }

    public Long getTotalAssets() {
        return totalAssets;
    }

    public void setTotalAssets(Long totalAssets) {
        this.totalAssets = totalAssets;
    }

    public Long getCurrentAssets() {
        return currentAssets;
    }

    public void setCurrentAssets(Long currentAssets) {
        this.currentAssets = currentAssets;
    }

    public Long getFixedAssets() {
        return fixedAssets;
    }

    public void setFixedAssets(Long fixedAssets) {
        this.fixedAssets = fixedAssets;
    }

    public Long getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Long totalCost) {
        this.totalCost = totalCost;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

}