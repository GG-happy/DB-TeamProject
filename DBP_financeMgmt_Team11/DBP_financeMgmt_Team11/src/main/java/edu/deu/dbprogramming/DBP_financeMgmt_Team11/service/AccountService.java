package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Account;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.Company;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public void registerAccount(String accountNo, String accountName, String classifica, String branch, Company companyId) {
        Account account = new Account();
        account.setAccountNo(accountNo);
        account.setAccountName(accountName);
        account.setClassifica(classifica);
        account.setBranch(branch);
        account.setOpenDate(LocalDate.now()); // 현재 날짜를 개설일로 설정
        account.setCompany(companyId);
        account.setBalance((long) 0);

        accountRepository.save(account);
    }
}
