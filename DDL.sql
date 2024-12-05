---------------------------------------------------------------
/* ########  ID : Team ######## */
---------------------------------------------------------------
----------------------
/* DDL 테이블 생성   */
----------------------
-- 1. 기업정보
CREATE TABLE Company (
	company_id      VARCHAR2(20)	PRIMARY KEY,   --기업코드(PK)
	business_no     VARCHAR2(30)	NOT NULL,      -- 사업장 등록번호
	company_name    VARCHAR2(100)   NOT NULL,      -- 기업명
	company_size    VARCHAR2(50),                  -- 기업 규모
	credit_grade    VARCHAR2(10)                   -- 신용등급
);

-- 2. 재무제표
CREATE TABLE FinancialStatement(
    satement_id     VARCHAR2(20)	 PRIMARY KEY,   -- 재무제표코드(PK)
    quarter         VARCHAR2(20)	 NOT NULL,      -- 분기
    annual_revenue  NUMBER,                         -- 연매출
    debt_amount     NUMBER,                         -- 부채금액
    net_profit      NUMBER,                         -- 순이익
    total_assets    NUMBER,                         -- 총 자산
    current_assets  NUMBER,                         -- 유동자산
    fixed_assets    NUMBER,                         -- 고정자산
    total_cost      NUMBER,                         -- 총비용
    company_id      VARCHAR2(20)     NOT NULL,      -- 기업코드(FK)
    CONSTRAINT FK_FS_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 3. 재무적요소
CREATE TABLE FinancialFactor(
    factor_id       VARCHAR2(20) PRIMARY KEY,   -- 재무요소코드(PK)
    evaluation_date DATE         NOT NULL,      -- 평가날짜
    stability       NUMBER       NOT NULL,      -- 안정성
    profitability   NUMBER       NOT NULL,      -- 수익성
    activity        NUMBER       NOT NULL,      -- 활동성
    cash_flow       NUMBER       NOT NULL,      -- 현금 흐름성
    company_id      VARCHAR2(20) NOT NULL,      -- 기업코드(FK)
    CONSTRAINT FK_FF_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 4. 계좌정보
CREATE TABLE Account(
    account_id      VARCHAR2(20)	 PRIMARY KEY,   -- 계좌코드(PK)
    account_no      VARCHAR2(20)	 NOT NULL,      -- 계좌번호
    account_name    VARCHAR2(30),                   -- 계좌명
    classifica      VARCHAR2(10)	 NOT NULL,      -- 분류
    branch          VARCHAR2(10),                   -- 계좌 관리점
    open_date       DATE             NOT NULL,      -- 개설일
    balance         NUMBER           NOT NULL,      -- 잔액
    company_id      VARCHAR2(20)     NOT NULL,      -- 기업코드(FK)
    CONSTRAINT FK_AC_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 5. 대출금리
CREATE TABLE InterestRate(
    interest_id        VARCHAR2(20)	 PRIMARY KEY,   -- 대출금리코드(PK)
    base_rate          NUMBER        NOT NULL,      -- 기준금리
    effective_year     DATE          NOT NULL,      -- 적용연도
    applied_rate       NUMBER        NOT NULL,      -- 적용금리
    company_id         VARCHAR2(20)  NOT NULL,      -- 기업코드(FK)
    CONSTRAINT FK_IR_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 6. 대출정보
CREATE TABLE Loan(
    loan_id             VARCHAR2(20)	 PRIMARY KEY,   -- 대출코드(PK)
    loan_amount         NUMBER           NOT NULL,      -- 대출금액
    repayment_period    NUMBER           NOT NULL,      -- 상환기간
    repayment_status    VARCHAR2(20)	 NOT NULL,      -- 상환상태
    account_id          VARCHAR2(20)     NOT NULL,      -- 계좌코드(FK)
    loan_rate           VARCHAR2(20)     NOT NULL,      -- 대출금리(FK)
    CONSTRAINT FK_LOAN_AC FOREIGN KEY(account_id) REFERENCES Account(account_id),
    CONSTRAINT FK_LOAN_IR FOREIGN KEY(loan_rate) REFERENCES InterestRate(interest_id)
);

-- 7. 신용평가
CREATE TABLE CreditEvaluation(
    evaluation_id    VARCHAR2(20)    PRIMARY KEY,   -- 신용평가코드(PK)
    evaluation_date  DATE            NOT NULL,      -- 평가날짜
    credit_score     NUMBER          NOT NULL,      -- 신용점수
    loan_limit       NUMBER          NOT NULL,      -- 대출한도
    company_id       VARCHAR2(20)    NOT NULL,      -- 기업코드(FK)
    CONSTRAINT FK_CE_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 8. 리스크평가
CREATE TABLE RiskEvaluation(
    risk_id             VARCHAR2(20)    PRIMARY KEY,    -- 리스크평가코드(PK)
    evaluation_date     DATE            NOT NULL,       -- 평가날짜
    evaluator           VARCHAR2(30)    NOT NULL,       -- 평가자
    industry_risk       NUMBER          NOT NULL,       -- 산업위험
    management_risk     NUMBER          NOT NULL,       -- 경영위험
    operation_risk      NUMBER          NOT NULL,       -- 영업위험
    financial_risk      NUMBER          NOT NULL,       -- 재무위험
    credibility         NUMBER          NOT NULL,       -- 신뢰성
    total_score         NUMBER          NOT NULL,       -- 총점수
    company_id          VARCHAR2(20)    NOT NULL,       -- 기업코드(FK)
    CONSTRAINT FK_RE_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 9. 거래내역
CREATE TABLE Transaction(
    transaction_id          VARCHAR2(20)    PRIMARY KEY,    -- 거래내역코드(PK)
    transaction_datetime    DATE            NOT NULL,       -- 거래일시
    transaction_amount      NUMBER          NOT NULL,       -- 거래금액
    transaction_type        VARCHAR2(30),                   -- 거래유형
    balance                 NUMBER          NOT NULL,       -- 잔액
    account_id              VARCHAR2(20)    NOT NULL,       -- 계좌코드(FK)
    remarks                 VARCHAR2(100),                  -- 비고
    CONSTRAINT FK_TRAN_AC FOREIGN KEY(account_id) REFERENCES Account(account_id)
);

-- 10. 회원정보(Spring 제공 Users DB 사용으로 Oracle DB 사용 X)
--CREATE TABLE UserInfo(
--    user_id     VARCHAR2(30)    PRIMARY KEY,    -- 아이디
--    pwd         VARCHAR2(50)    NOT NULL,       -- 비밀번호
--    email       VARCHAR2(100)   NOT NULL,       -- 이메일
--    user_name   VARCHAR2(50)    NOT NULL,       -- 이름
--    phone       VARCHAR2(20)    NOT NULL,       -- 전화번호
--    role        VARCHAR2(20)    NOT NULL,       -- 구분(기업/은행)
--    company_id  VARCHAR2(20),                   -- 기업코드(FK, 기업 사용자만 해당)
--    CONSTRAINT FK_USER_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
--);

commit;

-----------------------------
/*   DDL 시퀀스 및 트리거      */
-----------------------------
-- 1. 기업정보 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'Company_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE Company_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER Company_TRG
BEFORE INSERT ON Company
FOR EACH ROW
BEGIN
    :NEW.company_id := 'COM-' || LPAD(Company_SEQ.NEXTVAL, 6, '0');
END;
/

-- 2. 재무제표 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'Financia_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE Financia_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER Financia_TRG
BEFORE INSERT ON FinancialStatement
FOR EACH ROW
BEGIN
    :NEW.satement_id := 'FS-' || LPAD(Financia_SEQ.NEXTVAL, 6, '0');
END;
/

-- 3. 재무요소 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'Factor_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE Factor_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER Factor_TRG
BEFORE INSERT ON FinancialFactor
FOR EACH ROW
BEGIN
    :NEW.factor_id := 'FF-' || LPAD(Factor_SEQ.NEXTVAL, 6, '0');
END;
/

-- 4. 계좌정보 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'ACC_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE ACC_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER ACC_TRG
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    :NEW.account_id := 'ACC-' || LPAD(ACC_SEQ.NEXTVAL, 6, '0');
END;
/

-- 5. 대출금리 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'IR_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE IR_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER IR_TRG
BEFORE INSERT ON InterestRate
FOR EACH ROW
BEGIN
    :NEW.interest_id := 'IR-' || LPAD(IR_SEQ.NEXTVAL, 6, '0');
END;
/

-- 6. 대출정보 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'LOAN_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE LOAN_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER LOAN_TRG
BEFORE INSERT ON Loan
FOR EACH ROW
BEGIN
    :NEW.loan_id := 'LOAN-' || LPAD(LOAN_SEQ.NEXTVAL, 6, '0');
END;
/

-- 7. 신용평가 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'CE_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE CE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER CE_TRG
BEFORE INSERT ON CreditEvaluation
FOR EACH ROW
BEGIN
    :NEW.evaluation_id := 'CE-' || LPAD(CE_SEQ.NEXTVAL, 6, '0');
END;
/

-- 8. 리스크평가 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'RE_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE RE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER RE_TRG
BEFORE INSERT ON RiskEvaluation
FOR EACH ROW
BEGIN
    :NEW.risk_id := 'RE-' || LPAD(RE_SEQ.NEXTVAL, 6, '0');
END;
/

-- 9. 거래내역 시퀀스 및 트리거
DECLARE
    CNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'TRAN_SEQ';
    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE TRAN_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRAN_TRG
BEFORE INSERT ON Transaction
FOR EACH ROW
BEGIN
    :NEW.transaction_id := 'TRAN-' || LPAD(TRAN_SEQ.NEXTVAL, 6, '0');
END;
/

-- 10. 회원정보 시퀀스 및 트리거 (Spring 제공 Users DB 사용으로 Oracle DB 사용 X)
--DECLARE
--    CNT INTEGER;
--BEGIN
--    SELECT COUNT(*) INTO CNT FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'USER_SEQ';
--    IF CNT = 0 THEN EXECUTE IMMEDIATE 'CREATE SEQUENCE USER_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
--    END IF;
--END;
--/
--
--CREATE OR REPLACE TRIGGER USER_TRG
--BEFORE INSERT ON UserInfo
--FOR EACH ROW
--BEGIN
--    :NEW.user_id := 'USER-' || LPAD(USER_SEQ.NEXTVAL, 6, '0');
--END;
--/

commit;