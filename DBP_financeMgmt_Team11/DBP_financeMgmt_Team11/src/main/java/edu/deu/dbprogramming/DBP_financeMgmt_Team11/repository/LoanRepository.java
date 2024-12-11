package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Loan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface LoanRepository extends JpaRepository<Loan, String> {

    /**
     * 특정 계좌와 연결된 대출 목록 조회
     * @param accountId 계좌 ID
     * @return 대출 목록
     */
    List<Loan> findByAccountAccountId(String accountId);

    /**
     * 특정 금액 이상의 대출 금액 조회
     * @param loanAmount 최소 대출 금액
     * @return 대출 목록
     */
    List<Loan> findByLoanAmountGreaterThanEqual(Long loanAmount);

    /**
     * 상환 기간이 특정 기간 이하인 대출 목록 조회
     * @param repaymentPeriod 최대 상환 기간
     * @return 대출 목록
     */
    List<Loan> findByRepaymentPeriodLessThanEqual(LocalDate repaymentPeriod);

    /**
     * 특정 상환 상태를 가진 대출 목록 조회
     * @param repaymentStatus 상환 상태
     * @return 대출 목록
     */
    List<Loan> findByRepaymentStatus(String repaymentStatus);

    /**
     * 특정 이자율과 연결된 대출 목록 조회
     * @param loanRateId 이자율 ID
     * @return 대출 목록
     */
    List<Loan> findByLoanRateInterestId(String loanRateId);
}
