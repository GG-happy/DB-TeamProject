package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, String> {

    /**
     * 특정 계좌와 연결된 거래 목록 조회
     * @param accountId 계좌 ID
     * @return 거래 목록
     */
    List<Transaction> findByAccountAccountId(String accountId);

    /**
     * 특정 날짜 이후의 거래 목록 조회
     * @param transactionDatetime 기준 날짜
     * @return 거래 목록
     */
    List<Transaction> findByTransactionDatetimeAfter(LocalDate transactionDatetime);

    /**
     * 특정 금액 이상의 거래 목록 조회
     * @param transactionAmount 최소 거래 금액
     * @return 거래 목록
     */
    List<Transaction> findByTransactionAmountGreaterThanEqual(Long transactionAmount);

    /**
     * 특정 유형의 거래 목록 조회
     * @param transactionType 거래 유형
     * @return 거래 목록
     */
    List<Transaction> findByTransactionType(String transactionType);

    /**
     * 특정 잔액 이하의 거래 목록 조회
     * @param balance 최대 잔액
     * @return 거래 목록
     */
    List<Transaction> findByBalanceLessThanEqual(Long balance);
}
