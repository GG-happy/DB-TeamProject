package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Financialfactor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface FinancialfactorRepository extends JpaRepository<Financialfactor, String> {

    /**
     * 특정 회사의 재무요소 목록 조회
     * @param companyId 회사 ID
     * @return 재무요소 목록
     */
    List<Financialfactor> findByCompanyCompanyId(String companyId);

    /**
     * 특정 날짜 이후에 평가된 재무요소 조회
     * @param date 기준 날짜
     * @return 재무요소 목록
     */
    List<Financialfactor> findByEvaluationDateAfter(LocalDate date);

    /**
     * 총 점수가 특정 값 이상인 재무요소 조회
     * @param totalScore 최소 총 점수
     * @return 재무요소 목록
     */
    List<Financialfactor> findByTotalScoreGreaterThanEqual(Long totalScore);

    /**
     * 안정성이 특정 값 이상인 재무요소 조회
     * @param stability 최소 안정성
     * @return 재무요소 목록
     */
    List<Financialfactor> findByStabilityGreaterThanEqual(Long stability);

    /**
     * 수익성이 특정 값 이상인 재무요소 조회
     * @param profitability 최소 수익성
     * @return 재무요소 목록
     */
    List<Financialfactor> findByProfitabilityGreaterThanEqual(Long profitability);

    /**
     * 활동성이 특정 값 이상인 재무요소 조회
     * @param activity 최소 활동성
     * @return 재무요소 목록
     */
    List<Financialfactor> findByActivityGreaterThanEqual(Long activity);

    /**
     * 현금 흐름성이 특정 값 이상인 재무요소 조회
     * @param cashFlow 최소 현금 흐름성
     * @return 재무요소 목록
     */
    List<Financialfactor> findByCashFlowGreaterThanEqual(Long cashFlow);
}
