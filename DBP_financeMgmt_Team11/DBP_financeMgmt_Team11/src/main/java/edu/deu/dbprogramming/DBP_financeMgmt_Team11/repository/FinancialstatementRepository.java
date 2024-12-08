package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialstatement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FinancialstatementRepository extends JpaRepository<Financialstatement, String> {

    Financialstatement findByQuarterAndCompany(String quarter , Company company);
    /**
     * 특정 회사의 재무제표 목록 조회
     * @param companyId 회사 ID
     * @return 재무제표 목록
     */

    List<Financialstatement> findByCompanyCompanyId(String companyId);

    /**
     * 특정 분기의 재무제표 조회
     * @param quarter 분기
     * @return 재무제표 목록
     */
    List<Financialstatement> findByQuarter(String quarter);

    /**
     * 연 매출이 특정 값 이상인 재무제표 조회
     * @param annualRevenue 최소 연 매출
     * @return 재무제표 목록
     */
    List<Financialstatement> findByAnnualRevenueGreaterThanEqual(Long annualRevenue);

    /**
     * 부채 금액이 특정 값 이하인 재무제표 조회
     * @param debtAmount 최대 부채 금액
     * @return 재무제표 목록
     */
    List<Financialstatement> findByDebtAmountLessThanEqual(Long debtAmount);

    /**
     * 순이익이 특정 값 이상인 재무제표 조회
     * @param netProfit 최소 순이익
     * @return 재무제표 목록
     */
    List<Financialstatement> findByNetProfitGreaterThanEqual(Long netProfit);

    /**
     * 총 자산이 특정 값 이상인 재무제표 조회
     * @param totalAssets 최소 총 자산
     * @return 재무제표 목록
     */
    List<Financialstatement> findByTotalAssetsGreaterThanEqual(Long totalAssets);
}
