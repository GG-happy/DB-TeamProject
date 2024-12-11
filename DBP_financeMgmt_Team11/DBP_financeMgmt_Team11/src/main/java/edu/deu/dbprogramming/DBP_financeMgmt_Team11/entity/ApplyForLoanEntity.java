package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.CompanyRepository;
import edu.deu.dbprogramming.DBP_financeMgmt_Team11.repository.InterestrateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.Random;

@Component
public class ApplyForLoanEntity {
    private String companyCode;
    private String AccountNo;
    private String AccountName;
    private String Classifica;
    private String Branch;
    private LocalDate OpenDate;
    //Balance(잔액)은 대출에 *-1
    private Double LoanAmount;
    private LocalDate RepaymentPeriod;
    private String RepaymentStatus;
    private String InterestId;
    private CompanyRepository companyRepository;
    private InterestrateRepository interestrateRepository;

    @Autowired
    public ApplyForLoanEntity(CompanyRepository companyRepository, InterestrateRepository interestrateRepository) {
        this.companyRepository = companyRepository;
        this.interestrateRepository = interestrateRepository;
        this.AccountNo=generateAccountNumber();
        this.OpenDate= getCurrentDate();
        this.RepaymentStatus="승인대기중";
    }

    private static String generateAccountNumber() {
        Random random = new Random();

        // 은행 코드 (3자리) + 지점 코드 (4자리) + 계좌번호 (7자리)
        String bankCode = String.format("%03d", random.nextInt(1000));  // 000 ~ 999
        String branchCode = String.format("%04d", random.nextInt(10000));  // 0000 ~ 9999
        String accountNumber = String.format("%07d", random.nextInt(10000000));  // 0000000 ~ 9999999
        String checkCode = String.format("%01d", random.nextInt(10));   // 0 ~ 1
        String newAccountNumber = bankCode + "-" + branchCode + "-" + accountNumber + "-" + checkCode;
        System.out.println("newAccountNumber: "+newAccountNumber);

        return newAccountNumber;
    }

    public static LocalDate getCurrentDate() {
        // 현재 날짜 가져오기
        LocalDate currentDate = LocalDate.now();
        // 지정된 포맷으로 변환
        System.out.println("dateString: "+currentDate);
        return currentDate;
    }



    public Account getAccount() {
        Account account = new Account();
        account.setAccountNo(AccountNo);
        account.setAccountName(AccountName);
        account.setClassifica(Classifica);
        account.setBranch(Branch);
        account.setOpenDate(OpenDate);
        account.setBalance(getBalance());
        account.setCompany(companyRepository.findByCompanyId(companyCode));
        return account;
    }

    public Loan getLoan() {
        Loan loan = new Loan();
        loan.setLoanAmount(LoanAmount);
        loan.setRepaymentPeriod(RepaymentPeriod);
        loan.setRepaymentStatus(RepaymentStatus);
        loan.setAccount(getAccount());
        loan.setLoanRate(interestrateRepository.findByInterestId(InterestId));
        return loan;
    }

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    public String getAccountNo() {
        return AccountNo;
    }

    public void setAccountNo(String accountNo) {
        AccountNo = accountNo;
    }

    public String getAccountName() {
        return AccountName;
    }

    public void setAccountName(String accountName) {
        AccountName = accountName;
    }

    public String getClassifica() {
        return Classifica;
    }

    public void setClassifica(String classifica) {
        Classifica = classifica;
    }

    public String getBranch() {
        return Branch;
    }

    public void setBranch(String branch) {
        Branch = branch;
    }

    public LocalDate getOpenDate() {
        return OpenDate;
    }

    public void setOpenDate(LocalDate openDate) {
        OpenDate = openDate;
    }

    public Double getLoanAmount() {
        return LoanAmount;
    }

    public void setLoanAmount(Double loanAmount) {
        LoanAmount = loanAmount;
    }

    public LocalDate getRepaymentPeriod() {
        return RepaymentPeriod;
    }

    public void setRepaymentPeriod(LocalDate repaymentPeriod) {
        RepaymentPeriod = repaymentPeriod;
    }

    public String getRepaymentStatus() {
        return RepaymentStatus;
    }

    public void setRepaymentStatus(String repaymentStatus) {
        RepaymentStatus = repaymentStatus;
    }

    public Long getBalance(){
        return (long) (LoanAmount*-1);
    }

    public String getInterestId() {
        return InterestId;
    }

    public void setInterestId(String interestId) {
        InterestId = interestId;
    }
}
