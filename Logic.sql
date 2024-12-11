---------------------------------------------------------------
/* ########  ID : Team ######## */
---------------------------------------------------------------
-----------------------------
/*    �Ļ� �Ӽ� ���       */
-----------------------------
-- 1. Company(�������)
-- credit_grade(�ſ���) : �ſ� �� ���̺��� �ſ� ����(credit_score)�� ����Ǹ� �ſ� ����� �ڵ����� �ٽ� ������.
CREATE OR REPLACE PROCEDURE UpdateCreditGrade(COM_ID VARCHAR2) AS
    GRADE VARCHAR2(10);
    C_SCORE NUMBER;
BEGIN
    SELECT credit_score INTO C_SCORE FROM CreditEvaluation WHERE company_id = COM_ID;
    
    IF C_SCORE >= 900 THEN GRADE := 'AAA';
    ELSIF C_SCORE >= 800 THEN GRADE := 'AA';
    ELSIF C_SCORE >= 700 THEN GRADE := 'A';
    ELSIF C_SCORE >= 600 THEN GRADE := 'BBB';
    ELSIF C_SCORE >= 500 THEN GRADE := 'BB';
    ELSIF C_SCORE >= 400 THEN GRADE := 'B';
    ELSIF C_SCORE >= 300 THEN GRADE := 'CCC';
    ELSIF C_SCORE >= 200 THEN GRADE := 'CC';
    ELSIF C_SCORE >= 100 THEN GRADE := 'C';
    ELSE GRADE := 'D';
    END IF;
    
    UPDATE Company SET credit_grade = GRADE WHERE company_id = COM_ID;
END;
/

/*
CREATE OR REPLACE TRIGGER Update_CG_TRG --> Ʈ���� �浹�� ���ν����� ������ �� �ڹٿ��� Ʈ��������� ����˴ϴ�.
AFTER INSERT OR UPDATE ON CreditEvaluation
FOR EACH ROW
DECLARE
    GRADE VARCHAR2(10);      -- �ſ� ���
BEGIN

    IF :NEW.credit_score >= 900 THEN GRADE := 'AAA';
    ELSIF :NEW.credit_score >= 800 THEN GRADE := 'AA';
    ELSIF :NEW.credit_score >= 700 THEN GRADE := 'A';
    ELSIF :NEW.credit_score >= 600 THEN GRADE := 'BBB';
    ELSIF :NEW.credit_score >= 500 THEN GRADE := 'BB';
    ELSIF :NEW.credit_score >= 400 THEN GRADE := 'B';
    ELSIF :NEW.credit_score >= 300 THEN GRADE := 'CCC';
    ELSIF :NEW.credit_score >= 200 THEN GRADE := 'CC';
    ELSIF :NEW.credit_score >= 100 THEN GRADE := 'C';
    ELSE GRADE := 'D';
    END IF;
    
    -- Company ���̺��� �ſ� ��� ������Ʈ
    UPDATE Company SET credit_grade = GRADE WHERE company_id = :NEW.company_id;
    
END;
/ */

-- 2. FinancialFactor(�繫�����)  
-- ������, ���ͼ�, Ȱ����, ���� �帧��: �繫��ǥ ���̺��� INSERT �Ǵ� UPDATE�� �߻��ϸ� �ڵ����� ����.
-- �� ����: ������, ���ͼ�, Ȱ����, ���� �帧���� ���Ǹ� �Բ� �� ������ �ڵ����� ����.
/*CREATE OR REPLACE TRIGGER Update_FF_TRG ---> ***Ʈ���� �浹�� �ڹٿ��� �����ϵ��� �Ű� Ʈ��������� �����߽��ϴ�.
AFTER INSERT OR UPDATE ON FinancialStatement
FOR EACH ROW
DECLARE
    STAB NUMBER := 0;       -- ������
    PROF NUMBER := 0;       -- ���ͼ�
    ACT  NUMBER := 0;       -- Ȱ����
    CASH NUMBER := 0;       -- ���� �帧��
    TOT  NUMBER := 0;       -- ����
BEGIN
    -- stability(������) : (�� �ڻ� - ��ä) / �� �ڻ� * 100
    IF :NEW.total_assets > 0 THEN
        STAB := ((:NEW.total_assets - :NEW.debt_amount) / :NEW.total_assets) * 100;
    END IF;

    -- profitability(���ͼ�) : ������ / ������ * 100
    IF :NEW.annual_revenue > 0 THEN
        PROF := (:NEW.net_profit / :NEW.annual_revenue) * 100;
    END IF;

    -- activity(Ȱ����) : ������ / �� �ڻ�
    IF :NEW.total_assets > 0 THEN
        ACT := :NEW.annual_revenue / :NEW.total_assets;
    END IF;

    -- cash_flow(���� �帧��) : ���� �ڻ� / ��ä * 100
    IF :NEW.debt_amount > 0 THEN
        CASH := (:NEW.current_assets / :NEW.debt_amount) * 100;
    END IF;

    -- total_score(�� ����) : �� �� ����� ���
    TOT := (STAB + PROF + ACT + CASH) / 4;

    -- �繫�� ��� ���̺��� ������ �߰�
    INSERT INTO FinancialFactor(evaluation_date, stability, profitability, activity, cash_flow, total_score, company_id)
    VALUES(SYSDATE, STAB, PROF, ACT, CASH, TOT, :NEW.company_id);

END;
/ */

-- 3. Transaction(�ŷ�����), Account(��������)
-- Transaction�� balance(�ŷ� �� �ܾ�) : �ŷ� ���� ���̺��� INSERT �Ǵ� UPDATE�� �߻��ϸ� �ڵ����� ����.
-- Account�� balance(�ܾ�) : �ŷ� ���� ���̺��� �ŷ� �� �ܾ��� ����Ǹ� ���� ���̺��� �ܾ׵� �ڵ����� ������Ʈ��.
CREATE OR REPLACE TRIGGER Update_Balance_TRG
BEFORE INSERT OR UPDATE ON Transaction      --> ���� ��
FOR EACH ROW
DECLARE
    AC_BAL NUMBER := 0;
BEGIN
    -- 1. �������� ���̺��� ���� ���� �ܾ� ��������
    SELECT balance INTO AC_BAL FROM Account
    WHERE account_id = :NEW.account_id;

    -- 2. �ŷ����� ���̺��� �ŷ� �� �ܾ� ���
    :NEW.balance := AC_BAL + NVL(:NEW.transaction_amount, 0);

    -- 3. �������� ���̺��� �ܾ� ������Ʈ
    UPDATE Account SET balance = :NEW.balance WHERE account_id = :NEW.account_id;
    
END;
/

-- 4. InterestRate(���� �ݸ�)
-- applied_rate(���� �ݸ�) : �ſ� �� ���̺��� �ſ� ������ ����Ǹ� ���� �ݸ��� �ڵ����� �ٽ� ����.
CREATE OR REPLACE PROCEDURE InsertAppliedRate(COM_ID VARCHAR2) AS
    BASE_RATE NUMBER := 3.25;       -- ���� �ݸ� �ʱ�ȭ(���� �����Ͱ� ������ �������� ����)
    SCORE NUMBER := 0;              -- �ſ� ���� �ʱ�ȭ
    APP_RATE NUMBER := 0;           -- ���� �ݸ� �ʱ�ȭ
BEGIN
    -- ���� �ݸ� ��������
    SELECT base_rate INTO BASE_RATE FROM InterestRate WHERE company_id = COM_ID;
    
    -- �ſ� ���� ��������
    SELECT credit_score INTO SCORE FROM CreditEvaluation WHERE company_id = COM_ID;
    
    -- ���� �ݸ� ����ϱ�
    APP_RATE := BASE_RATE + (100 - SCORE) * 0.01;
    
    --- ���� �ݸ� ���̺��� ���� �ݸ� ������Ʈ
    INSERT INTO InterestRate(base_rate,effective_year,applied_rate, company_id)
    VALUES(BASE_RATE, SYSDATE, APP_RATE, COM_ID);

END;
/

-- �ſ� �� ���̺��� �ٲ�� ���� �ݸ��� �ڵ����� ����
/*
CREATE OR REPLACE TRIGGER Update_AR_TRG     --> �浹 �߻����� Ʈ��������� ����
AFTER INSERT OR UPDATE ON CreditEvaluation  --> ���� ��
FOR EACH ROW
BEGIN
    UpdateAppliedRate(:NEW.company_id);
END;
/
*/

-- 5. CreditEvaluation(�ſ���)
-- credit_score(�ſ�����) : �繫�� ��� ���̺��� �� ������ ����� ��, ����ũ �� ���̺��� �� ������ ����� �� �ڵ����� �ٽ� ����.
-- loan_limit(�����ѵ�) : �ſ� ������ ����� �� �ڵ����� ���� �ѵ��� ������Ʈ��.
CREATE OR REPLACE PROCEDURE UpdateCreditScore(COM_ID VARCHAR2) AS
    F_SCORE NUMBER := 0;     -- �繫�� ��� �� ���� �ʱ�ȭ
    R_SCORE NUMBER := 0;     -- ����ũ �� �� ���� �ʱ�ȭ
    C_SCORE NUMBER := 0;     -- �ſ� ���� �ʱ�ȭ
BEGIN
    -- �ش� ����� �ֽ� �繫�� ��� �� ���� ��������
    SELECT NVL(total_score, 0) INTO F_SCORE FROM FinancialFactor
    WHERE company_id = COM_ID AND
        evaluation_date = (SELECT MAX(evaluation_date) FROM FinancialFactor WHERE company_id = COM_ID);

    -- �ش� ����� �ֽ� ����ũ �� �� ���� ��������
    SELECT NVL(total_score, 0) INTO R_SCORE FROM RiskEvaluation
    WHERE company_id = COM_ID AND
        evaluation_date = (SELECT MAX(evaluation_date) FROM RiskEvaluation WHERE company_id = COM_ID);

    -- �ſ� ���� ���
    C_SCORE := (F_SCORE + R_SCORE) / 2;

    -- �ſ��� ����
    INSERT INTO CreditEvaluation (evaluation_date, credit_score, loan_limit, company_id)
    VALUES ( SYSDATE, C_SCORE, 0, COM_ID); -- �� ��¥, �ſ� ����, �ʱ� ���� �ѵ�(���� ó����), ��� ID

END;
/

-- �繫�� ��� ���̺� ���� �� �ſ� ���� ������Ʈ
/*
CREATE OR REPLACE TRIGGER Update_FF2CS_TRG  --> �浹 ����
AFTER INSERT OR UPDATE ON FinancialFactor 
FOR EACH ROW
BEGIN
    -- �繫�� ��� ���̺��� '�� ����'�� ������ ��쿡�� ����
    IF NVL(:NEW.total_score, 0) != NVL(:OLD.total_score, 0)
        THEN UpdateCreditScore(:NEW.company_id);
    END IF;
END;
/
*/

-- ����ũ �� ���̺� ���� �� �ſ� ���� ������Ʈ
CREATE OR REPLACE TRIGGER Update_RE2CS_TRG
AFTER INSERT OR UPDATE ON RiskEvaluation        -- ���� ��
FOR EACH ROW
BEGIN
    -- ����ũ �� ���̺��� '�� ����'�� ������ ��쿡�� ����
    IF NVL(:NEW.total_score, 0) != NVL(:OLD.total_score, 0)
        THEN UpdateCreditScore(:NEW.company_id);
    END IF;
END;
/
-------------------------------------
-- �ſ� ������ ���� �ſ� �ѵ� ����
-------------------------------------
CREATE OR REPLACE PROCEDURE UpdateLimit(EVA_ID IN VARCHAR2) AS
    SCORE NUMBER := 0;  -- �ſ� ���� �ʱ�ȭ
    LOAN NUMBER := 0;   -- ���� �ѵ� �ʱ�ȭ
BEGIN
    -- �ֽ� �ſ� ���� ��������
    SELECT credit_score INTO SCORE FROM CreditEvaluation WHERE evaluation_id = EVA_ID;
    
    -- �ſ� ������ ���� �ѵ� ����
    IF SCORE >= 900 THEN LOAN := 10000000000;    -- 100��
    ELSIF SCORE >= 800 THEN LOAN := 5000000000;  -- 50��
    ELSIF SCORE >= 700 THEN LOAN := 1000000000;  -- 10��
    ELSIF SCORE >= 600 THEN LOAN := 500000000;   -- 5��
    ELSIF SCORE >= 500 THEN LOAN := 100000000;   -- 1��
    ELSIF SCORE >= 400 THEN LOAN := 50000000;    -- 5õ
    ELSIF SCORE >= 300 THEN LOAN := 10000000;    -- 1õ
    ELSIF SCORE >= 200 THEN LOAN := 5000000;     -- 5��
    ELSIF SCORE >= 100 THEN LOAN := 1000000;     -- 1��
    ELSE LOAN := 0;
    END IF;
    
    UPDATE CreditEvaluation SET loan_limit = LOAN WHERE evaluation_id = EVA_ID;
    
END;
/

-- �ſ� �� ���̺� ���� �� ���� �ѵ� ������Ʈ
/*
CREATE OR REPLACE TRIGGER Update_LL_TRG  --> Ʈ���� �浹 �߻����� Ʈ��������� ����
AFTER INSERT OR UPDATE ON CreditEvaluation      --> ���� ��
FOR EACH ROW
DECLARE
    LOAN NUMBER := 0;   -- ���� �ѵ� �ʱ�ȭ
BEGIN
    -- '�ſ� ����'�� ������ ��쿡�� ����
    IF NVL(:NEW.credit_score, 0) != NVL(:OLD.credit_score, 0) THEN
        -- ���ν����� ȣ���Ͽ� �ѵ� ����
        UpdateLimit(:NEW.evaluation_id, LOAN);
        
        -- ���� �ѵ� ������Ʈ
        UPDATE CreditEvaluation SET loan_limit = LOAN WHERE evaluation_id  = :NEW.evaluation_id;
    END IF;
END;
/
*/

-- 6. RiskEvaluation(����ũ��)
-- �� ����: ����ũ �� ���̺��� INSERT �Ǵ� UPDATE�� �߻��ϸ� �ڵ����� ���.
CREATE OR REPLACE TRIGGER Update_RiskScore_TRG
BEFORE INSERT OR UPDATE ON RiskEvaluation       -- ���� ��
FOR EACH ROW
BEGIN
    -- total_score(�� ����) : ���, �濵, ����, �繫 ���� ���� �ջ�.
    :NEW.total_score := NVL(:NEW.industry_risk, 0) +
                        NVL(:NEW.management_risk, 0) +
                        NVL(:NEW.operation_risk, 0) +
                        NVL(:NEW.financial_risk, 0) +
                        NVL(:NEW.credibility, 0);
END;
/
