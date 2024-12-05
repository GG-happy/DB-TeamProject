---------------------------------------------------------------
/* ########  ID : Team ######## */
---------------------------------------------------------------
----------------------
/* DDL ���̺� ����   */
----------------------
-- 1. �������
CREATE TABLE Company (
	company_id      VARCHAR2(20)	PRIMARY KEY,   --����ڵ�(PK)
	business_no     VARCHAR2(30)	NOT NULL,      -- ����� ��Ϲ�ȣ
	company_name    VARCHAR2(100)   NOT NULL,      -- �����
	company_size    VARCHAR2(50),                  -- ��� �Ը�
	credit_grade    VARCHAR2(10)                   -- �ſ���
);

-- 2. �繫��ǥ
CREATE TABLE FinancialStatement(
    satement_id     VARCHAR2(20)	 PRIMARY KEY,   -- �繫��ǥ�ڵ�(PK)
    quarter         VARCHAR2(20)	 NOT NULL,      -- �б�
    annual_revenue  NUMBER,                         -- ������
    debt_amount     NUMBER,                         -- ��ä�ݾ�
    net_profit      NUMBER,                         -- ������
    total_assets    NUMBER,                         -- �� �ڻ�
    current_assets  NUMBER,                         -- �����ڻ�
    fixed_assets    NUMBER,                         -- �����ڻ�
    total_cost      NUMBER,                         -- �Ѻ��
    company_id      VARCHAR2(20)     NOT NULL,      -- ����ڵ�(FK)
    CONSTRAINT FK_FS_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 3. �繫�����
CREATE TABLE FinancialFactor(
    factor_id       VARCHAR2(20) PRIMARY KEY,   -- �繫����ڵ�(PK)
    evaluation_date DATE         NOT NULL,      -- �򰡳�¥
    stability       NUMBER       NOT NULL,      -- ������
    profitability   NUMBER       NOT NULL,      -- ���ͼ�
    activity        NUMBER       NOT NULL,      -- Ȱ����
    cash_flow       NUMBER       NOT NULL,      -- ���� �帧��
    company_id      VARCHAR2(20) NOT NULL,      -- ����ڵ�(FK)
    CONSTRAINT FK_FF_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 4. ��������
CREATE TABLE Account(
    account_id      VARCHAR2(20)	 PRIMARY KEY,   -- �����ڵ�(PK)
    account_no      VARCHAR2(20)	 NOT NULL,      -- ���¹�ȣ
    account_name    VARCHAR2(30),                   -- ���¸�
    classifica      VARCHAR2(10)	 NOT NULL,      -- �з�
    branch          VARCHAR2(10),                   -- ���� ������
    open_date       DATE             NOT NULL,      -- ������
    balance         NUMBER           NOT NULL,      -- �ܾ�
    company_id      VARCHAR2(20)     NOT NULL,      -- ����ڵ�(FK)
    CONSTRAINT FK_AC_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 5. ����ݸ�
CREATE TABLE InterestRate(
    interest_id        VARCHAR2(20)	 PRIMARY KEY,   -- ����ݸ��ڵ�(PK)
    base_rate          NUMBER        NOT NULL,      -- ���رݸ�
    effective_year     DATE          NOT NULL,      -- ���뿬��
    applied_rate       NUMBER        NOT NULL,      -- ����ݸ�
    company_id         VARCHAR2(20)  NOT NULL,      -- ����ڵ�(FK)
    CONSTRAINT FK_IR_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 6. ��������
CREATE TABLE Loan(
    loan_id             VARCHAR2(20)	 PRIMARY KEY,   -- �����ڵ�(PK)
    loan_amount         NUMBER           NOT NULL,      -- ����ݾ�
    repayment_period    NUMBER           NOT NULL,      -- ��ȯ�Ⱓ
    repayment_status    VARCHAR2(20)	 NOT NULL,      -- ��ȯ����
    account_id          VARCHAR2(20)     NOT NULL,      -- �����ڵ�(FK)
    loan_rate           VARCHAR2(20)     NOT NULL,      -- ����ݸ�(FK)
    CONSTRAINT FK_LOAN_AC FOREIGN KEY(account_id) REFERENCES Account(account_id),
    CONSTRAINT FK_LOAN_IR FOREIGN KEY(loan_rate) REFERENCES InterestRate(interest_id)
);

-- 7. �ſ���
CREATE TABLE CreditEvaluation(
    evaluation_id    VARCHAR2(20)    PRIMARY KEY,   -- �ſ����ڵ�(PK)
    evaluation_date  DATE            NOT NULL,      -- �򰡳�¥
    credit_score     NUMBER          NOT NULL,      -- �ſ�����
    loan_limit       NUMBER          NOT NULL,      -- �����ѵ�
    company_id       VARCHAR2(20)    NOT NULL,      -- ����ڵ�(FK)
    CONSTRAINT FK_CE_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 8. ����ũ��
CREATE TABLE RiskEvaluation(
    risk_id             VARCHAR2(20)    PRIMARY KEY,    -- ����ũ���ڵ�(PK)
    evaluation_date     DATE            NOT NULL,       -- �򰡳�¥
    evaluator           VARCHAR2(30)    NOT NULL,       -- ����
    industry_risk       NUMBER          NOT NULL,       -- �������
    management_risk     NUMBER          NOT NULL,       -- �濵����
    operation_risk      NUMBER          NOT NULL,       -- ��������
    financial_risk      NUMBER          NOT NULL,       -- �繫����
    credibility         NUMBER          NOT NULL,       -- �ŷڼ�
    total_score         NUMBER          NOT NULL,       -- ������
    company_id          VARCHAR2(20)    NOT NULL,       -- ����ڵ�(FK)
    CONSTRAINT FK_RE_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
);

-- 9. �ŷ�����
CREATE TABLE Transaction(
    transaction_id          VARCHAR2(20)    PRIMARY KEY,    -- �ŷ������ڵ�(PK)
    transaction_datetime    DATE            NOT NULL,       -- �ŷ��Ͻ�
    transaction_amount      NUMBER          NOT NULL,       -- �ŷ��ݾ�
    transaction_type        VARCHAR2(30),                   -- �ŷ�����
    balance                 NUMBER          NOT NULL,       -- �ܾ�
    account_id              VARCHAR2(20)    NOT NULL,       -- �����ڵ�(FK)
    remarks                 VARCHAR2(100),                  -- ���
    CONSTRAINT FK_TRAN_AC FOREIGN KEY(account_id) REFERENCES Account(account_id)
);

-- 10. ȸ������(Spring ���� Users DB ������� Oracle DB ��� X)
--CREATE TABLE UserInfo(
--    user_id     VARCHAR2(30)    PRIMARY KEY,    -- ���̵�
--    pwd         VARCHAR2(50)    NOT NULL,       -- ��й�ȣ
--    email       VARCHAR2(100)   NOT NULL,       -- �̸���
--    user_name   VARCHAR2(50)    NOT NULL,       -- �̸�
--    phone       VARCHAR2(20)    NOT NULL,       -- ��ȭ��ȣ
--    role        VARCHAR2(20)    NOT NULL,       -- ����(���/����)
--    company_id  VARCHAR2(20),                   -- ����ڵ�(FK, ��� ����ڸ� �ش�)
--    CONSTRAINT FK_USER_COM FOREIGN KEY(company_id) REFERENCES Company(company_id)
--);

commit;

-----------------------------
/*   DDL ������ �� Ʈ����      */
-----------------------------
-- 1. ������� ������ �� Ʈ����
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

-- 2. �繫��ǥ ������ �� Ʈ����
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

-- 3. �繫��� ������ �� Ʈ����
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

-- 4. �������� ������ �� Ʈ����
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

-- 5. ����ݸ� ������ �� Ʈ����
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

-- 6. �������� ������ �� Ʈ����
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

-- 7. �ſ��� ������ �� Ʈ����
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

-- 8. ����ũ�� ������ �� Ʈ����
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

-- 9. �ŷ����� ������ �� Ʈ����
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

-- 10. ȸ������ ������ �� Ʈ���� (Spring ���� Users DB ������� Oracle DB ��� X)
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