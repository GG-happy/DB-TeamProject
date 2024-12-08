package edu.deu.dbprogramming.DBP_financeMgmt_Team11.service;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity.*;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.AccountRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CreditevaluationRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.InterestrateRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.LoanRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ApplyForLoanService {

    private final AccountRepository accountRepository;
    private final LoanRepository loanRepository;
    private final InterestrateRepository interestrateRepository;
    private final CreditevaluationRepository creditevaluationRepository;
    private String interestId;

    public ApplyForLoanService(AccountRepository accountRepository, LoanRepository loanRepository, InterestrateRepository interestrateRepository, CreditevaluationRepository creditevaluationRepository) {
        this.accountRepository = accountRepository;
        this.loanRepository = loanRepository;
        this.interestrateRepository = interestrateRepository;
        this.creditevaluationRepository = creditevaluationRepository;
    }

    public Long checkApppliedRate(String companyId) {
        Interestrate interestrate = interestrateRepository.findFirstByCompanyCompanyIdOrderByEffectiveYearDesc(companyId);
        if (interestrate == null) {
            System.out.println("interest rate == null");
            return null;
        }else{
            System.out.println("interest rate == " + interestrate.getAppliedRate());
            interestId = interestrate.getInterestId();
            return interestrate.getAppliedRate();
        }

    }
    public String checkInterestId() {
        return interestId;

    }
    public Long checkLoanLimit(String companyId) {
        Creditevaluation creditevaluation = creditevaluationRepository.findFirstByCompanyCompanyIdOrderByEvaluationDateDesc(companyId);
        if (creditevaluation == null) {
            System.out.println("credit evaluation == null");
            return null;
        }else{
            System.out.println("credit evaluation == " + creditevaluation.getLoanLimit());
            return creditevaluation.getLoanLimit();
        }
    }
    @Transactional
    public boolean requestLoan(String companyId, ApplyForLoanEntity applyForLoanEntity) {
        try {
            Account account = applyForLoanEntity.getAccount();
            accountRepository.save(account);

            Loan loan = applyForLoanEntity.getLoan();
            loan.setAccount(account);
            loanRepository.save(loan);

            System.out.println("requestLoan Success");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
