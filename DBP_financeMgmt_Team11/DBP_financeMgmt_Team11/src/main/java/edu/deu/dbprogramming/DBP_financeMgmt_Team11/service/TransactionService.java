package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Account;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Transaction;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.AccountRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionService {

    private final TransactionRepository transactionRepository;
    private final AccountRepository accountRepository;

    // 생성자를 통한 의존성 주입
    public TransactionService(TransactionRepository transactionRepository, AccountRepository accountRepository) {
        this.transactionRepository = transactionRepository;
        this.accountRepository = accountRepository;
    }

    // 특정 계좌와 회사 코드로 트랜잭션 조회
    public List<Transaction> findTransactionByClientCodeAndAccountId(String clientCode, String accountId) {
        // Account 조회
        Account account = accountRepository.findByCompanyCompanyIdAndAccountId(clientCode, accountId);

        // Account와 관련된 트랜잭션 정렬 조회
        return transactionRepository.findByAccountOrderByTransactionDatetimeDesc(account);
    }

    // 모든 트랜잭션 조회
    public List<Transaction> getAllTransactions() {
        return transactionRepository.findAll();
    }
}

