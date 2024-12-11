package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialstatement;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialfactor;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.FinancialfactorRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.FinancialstatementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
public class FinancialFactorTransactionService {

    private final FinancialfactorRepository financialFactorRepository;

    public FinancialFactorTransactionService(FinancialfactorRepository financialFactorRepository) {
        this.financialFactorRepository = financialFactorRepository;
    }
    @Transactional
    public void UpdateFinancialFactor(Financialstatement financialStatement) {
        // 변수 초기화
        double stability = 0.0;
        double profitability = 0.0;
        double activity = 0.0;
        double cashFlow = 0.0;
        double totalScore = 0.0;

        // 안정성 계산
        if (financialStatement.getTotalAssets() > 0) {
            stability = ( (double) (financialStatement.getTotalAssets() - financialStatement.getDebtAmount()) /
                    financialStatement.getTotalAssets()) * 100;
        }

        // 수익성 계산
        if (financialStatement.getAnnualRevenue() > 0) {
            profitability = ((double) financialStatement.getNetProfit() / financialStatement.getAnnualRevenue()) * 100;
        }

        // 활동성 계산
        if (financialStatement.getTotalAssets() > 0) {
            activity = (double) financialStatement.getAnnualRevenue() / financialStatement.getTotalAssets();
        }

        // 현금 흐름성 계산
        if (financialStatement.getDebtAmount() > 0) {
            cashFlow = ((double) financialStatement.getCurrentAssets() / financialStatement.getDebtAmount()) * 100;
        }

        // 총점 계산
        totalScore = (stability + profitability + activity + cashFlow) / 4;

        // 재무적 요소 테이블 업데이트 또는 삽입
        Financialfactor financialFactor = financialFactorRepository.findLatestByCompanyId(financialStatement.getCompany().getCompanyId());
        if (financialFactor != null) {
            financialFactor.setStability(stability);
            financialFactor.setProfitability(profitability);
            financialFactor.setActivity(activity);
            financialFactor.setCashFlow(cashFlow);
            financialFactor.setTotalScore(totalScore);
            financialFactor.setEvaluationDate(financialFactor.getEvaluationDate());
        } else {
            financialFactor = new Financialfactor();
            financialFactor.setCompany(financialStatement.getCompany());
            financialFactor.setStability(stability);
            financialFactor.setProfitability(profitability);
            financialFactor.setActivity(activity);
            financialFactor.setCashFlow(cashFlow);
            financialFactor.setTotalScore(totalScore);
            financialFactor.setEvaluationDate(LocalDate.now());
        }
        financialFactorRepository.save(financialFactor);
    }
}
