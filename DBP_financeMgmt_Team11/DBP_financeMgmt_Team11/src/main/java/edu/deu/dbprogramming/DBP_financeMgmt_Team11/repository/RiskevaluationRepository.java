package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Riskevaluation;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface RiskevaluationRepository extends JpaRepository<Riskevaluation, String> {

    // 특정 risk_id에 해당하는 데이터 조회 (특정 회사)
    @Query("SELECT r FROM Riskevaluation r WHERE r.riskId = :riskId AND r.company.companyId = :companyId")
    List<Riskevaluation> findByRiskIdAndCompanyId(@Param("riskId") String riskId, @Param("companyId") String companyId);

    // 이전 데이터 (evaluation_date가 주어진 날짜보다 작은 가장 큰 값, 특정 회사)
    @Query("SELECT r FROM Riskevaluation r WHERE r.evaluationDate < :evaluationDate AND r.company.companyId = :companyId ORDER BY r.evaluationDate DESC")
    List<Riskevaluation> findPreviousRiskByDateAndCompanyId(@Param("evaluationDate") LocalDate evaluationDate, @Param("companyId") String companyId);

    // 이후 데이터 (evaluation_date가 주어진 날짜보다 큰 가장 작은 값, 특정 회사)
    @Query("SELECT r FROM Riskevaluation r WHERE r.evaluationDate >= :evaluationDate AND r.company.companyId = :companyId ORDER BY r.evaluationDate ASC")
    List<Riskevaluation> findNextRiskByDateAndCompanyId(@Param("evaluationDate") LocalDate evaluationDate, @Param("companyId") String companyId);

    // 가장 최근의 리스크 평가 보고서 가져오기 (evaluationDate 기준 최신 데이터 1개, 특정 회사)
    @Query("SELECT r FROM Riskevaluation r WHERE r.company.companyId = :companyId ORDER BY r.evaluationDate DESC")
    List<Riskevaluation> findLatestRiskEvaluationByCompanyId(@Param("companyId") String companyId);



    /**
     * 특정 회사의 리스크 평가 목록 조회
     * @param companyId 회사 ID
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByCompanyCompanyId(String companyId);

    /**
     * 특정 날짜 이후에 수행된 리스크 평가 조회
     * @param evaluationDate 기준 날짜
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByEvaluationDateAfter(LocalDate evaluationDate);

    /**
     * 평가자가 특정 이름인 리스크 평가 조회
     * @param evaluator 평가자 이름
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByEvaluator(String evaluator);

    /**
     * 총 점수가 특정 값 이상인 리스크 평가 조회
     * @param totalScore 최소 총 점수
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByTotalScoreGreaterThanEqual(Long totalScore);

    /**
     * 특정 산업 위험 이상인 리스크 평가 조회
     * @param industryRisk 최소 산업 위험
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByIndustryRiskGreaterThanEqual(Long industryRisk);

    /**
     * 특정 경영 위험 이상인 리스크 평가 조회
     * @param managementRisk 최소 경영 위험
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByManagementRiskGreaterThanEqual(Long managementRisk);

    /**
     * 특정 영업 위험 이상인 리스크 평가 조회
     * @param operationRisk 최소 영업 위험
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByOperationRiskGreaterThanEqual(Long operationRisk);

    /**
     * 특정 재무 위험 이상인 리스크 평가 조회
     * @param financialRisk 최소 재무 위험
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByFinancialRiskGreaterThanEqual(Long financialRisk);

    /**
     * 특정 신뢰도 이상인 리스크 평가 조회
     * @param credibility 최소 신뢰도
     * @return 리스크 평가 목록
     */
    List<Riskevaluation> findByCredibilityGreaterThanEqual(Long credibility);
}
