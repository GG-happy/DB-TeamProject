package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Creditevaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface CreditevaluationRepository extends JpaRepository<Creditevaluation, String> {

    /**
     * 특정 회사의 가장 최근 신용평가 조회
     * @param companyId 회사 ID
     * @return 가장 최근 신용평가
     */
    Creditevaluation findFirstByCompanyCompanyIdOrderByEvaluationDateDesc(String companyId);

    // 특정 회사의 신용평가 목록 조회
    List<Creditevaluation> findByCompanyCompanyId(String companyId);

    // 특정 날짜 이후의 신용평가 목록 조회
    List<Creditevaluation> findByEvaluationDateAfter(LocalDate date);

    // 신용 점수가 특정 값 이상인 신용평가 목록 조회
    List<Creditevaluation> findByCreditScoreGreaterThanEqual(Long creditScore);

    // 대출 한도가 특정 값 이상인 신용평가 목록 조회
    List<Creditevaluation> findByLoanLimitGreaterThanEqual(Long loanLimit);
}
