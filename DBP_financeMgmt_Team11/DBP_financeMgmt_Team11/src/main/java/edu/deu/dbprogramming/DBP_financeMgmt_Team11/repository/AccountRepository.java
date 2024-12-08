package edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {

    Account findByCompanyCompanyIdAndAccountId(String companyId , String accountId);

    // 특정 회사의 모든 계좌를 가져오기
    List<Account> findByCompanyCompanyId(String companyId);

    // 잔액이 특정 금액 이상인 계좌 검색
    List<Account> findByBalanceGreaterThan(Long balance);

    // 특정 분류를 가진 계좌 검색
    List<Account> findByClassifica(String classifica);

    // 계좌 이름이 특정 이름과 일치하는 계좌 검색
    List<Account> findByAccountName(String accountName);
}
