---------------------------------------------------------------
/* ########  ID : Team ######## */
---------------------------------------------------------------
-----------------------------
/*    파생 속성 목록       */
-----------------------------
-- 1. Company(기업정보)
-- credit_grade(신용등급) : 신용 평가 테이블의 신용 점수(credit_score)가 변경되면 신용 등급이 자동으로 다시 측정됨.
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
CREATE OR REPLACE TRIGGER Update_CG_TRG --> 트리거 충돌로 프로시저로 수정한 후 자바에서 트랜잭션으로 수행됩니다.
AFTER INSERT OR UPDATE ON CreditEvaluation
FOR EACH ROW
DECLARE
    GRADE VARCHAR2(10);      -- 신용 등급
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
    
    -- Company 테이블의 신용 등급 업데이트
    UPDATE Company SET credit_grade = GRADE WHERE company_id = :NEW.company_id;
    
END;
/ */

-- 2. FinancialFactor(재무적요소)  
-- 안정성, 수익성, 활동성, 현금 흐름성: 재무제표 테이블에서 INSERT 또는 UPDATE가 발생하면 자동으로 계산됨.
-- 총 점수: 안정성, 수익성, 활동성, 현금 흐름성이 계산되면 함께 총 점수도 자동으로 계산됨.
/*CREATE OR REPLACE TRIGGER Update_FF_TRG ---> ***트리거 충돌로 자바에서 수행하도록 옮겨 트랜잭션으로 구현했습니다.
AFTER INSERT OR UPDATE ON FinancialStatement
FOR EACH ROW
DECLARE
    STAB NUMBER := 0;       -- 안정성
    PROF NUMBER := 0;       -- 수익성
    ACT  NUMBER := 0;       -- 활동성
    CASH NUMBER := 0;       -- 현금 흐름성
    TOT  NUMBER := 0;       -- 총점
BEGIN
    -- stability(안정성) : (총 자산 - 부채) / 총 자산 * 100
    IF :NEW.total_assets > 0 THEN
        STAB := ((:NEW.total_assets - :NEW.debt_amount) / :NEW.total_assets) * 100;
    END IF;

    -- profitability(수익성) : 순이익 / 연매출 * 100
    IF :NEW.annual_revenue > 0 THEN
        PROF := (:NEW.net_profit / :NEW.annual_revenue) * 100;
    END IF;

    -- activity(활동성) : 연매출 / 총 자산
    IF :NEW.total_assets > 0 THEN
        ACT := :NEW.annual_revenue / :NEW.total_assets;
    END IF;

    -- cash_flow(현금 흐름성) : 유동 자산 / 부채 * 100
    IF :NEW.debt_amount > 0 THEN
        CASH := (:NEW.current_assets / :NEW.debt_amount) * 100;
    END IF;

    -- total_score(총 점수) : 위 네 요소의 평균
    TOT := (STAB + PROF + ACT + CASH) / 4;

    -- 재무적 요소 테이블의 점수들 추가
    INSERT INTO FinancialFactor(evaluation_date, stability, profitability, activity, cash_flow, total_score, company_id)
    VALUES(SYSDATE, STAB, PROF, ACT, CASH, TOT, :NEW.company_id);

END;
/ */

-- 3. Transaction(거래내역), Account(계좌정보)
-- Transaction의 balance(거래 후 잔액) : 거래 내역 테이블에서 INSERT 또는 UPDATE가 발생하면 자동으로 계산됨.
-- Account의 balance(잔액) : 거래 내역 테이블에서 거래 후 잔액이 변경되면 계좌 테이블의 잔액도 자동으로 업데이트됨.
CREATE OR REPLACE TRIGGER Update_Balance_TRG
BEFORE INSERT OR UPDATE ON Transaction      --> 삽입 전
FOR EACH ROW
DECLARE
    AC_BAL NUMBER := 0;
BEGIN
    -- 1. 계좌정보 테이블에서 현재 계좌 잔액 가져오기
    SELECT balance INTO AC_BAL FROM Account
    WHERE account_id = :NEW.account_id;

    -- 2. 거래내역 테이블의 거래 후 잔액 계산
    :NEW.balance := AC_BAL + NVL(:NEW.transaction_amount, 0);

    -- 3. 계좌정보 테이블의 잔액 업데이트
    UPDATE Account SET balance = :NEW.balance WHERE account_id = :NEW.account_id;
    
END;
/

-- 4. InterestRate(대출 금리)
-- applied_rate(적용 금리) : 신용 평가 테이블의 신용 점수가 변경되면 적용 금리가 자동으로 다시 계산됨.
CREATE OR REPLACE PROCEDURE InsertAppliedRate(COM_ID VARCHAR2) AS
    BASE_RATE NUMBER := 3.25;       -- 기준 금리 초기화(기존 데이터가 없으면 수동으로 설정)
    SCORE NUMBER := 0;              -- 신용 점수 초기화
    APP_RATE NUMBER := 0;           -- 적용 금리 초기화
BEGIN
    -- 기준 금리 가져오기
    SELECT base_rate INTO BASE_RATE FROM InterestRate WHERE company_id = COM_ID;
    
    -- 신용 점수 가져오기
    SELECT credit_score INTO SCORE FROM CreditEvaluation WHERE company_id = COM_ID;
    
    -- 적용 금리 계산하기
    APP_RATE := BASE_RATE + (100 - SCORE) * 0.01;
    
    --- 대출 금리 테이블의 적용 금리 업데이트
    INSERT INTO InterestRate(base_rate,effective_year,applied_rate, company_id)
    VALUES(BASE_RATE, SYSDATE, APP_RATE, COM_ID);

END;
/

-- 신용 평가 테이블이 바뀌면 대출 금리가 자동으로 갱신
/*
CREATE OR REPLACE TRIGGER Update_AR_TRG     --> 충돌 발생으로 트랜잭션으로 구현
AFTER INSERT OR UPDATE ON CreditEvaluation  --> 변경 후
FOR EACH ROW
BEGIN
    UpdateAppliedRate(:NEW.company_id);
END;
/
*/

-- 5. CreditEvaluation(신용평가)
-- credit_score(신용점수) : 재무적 요소 테이블의 총 점수가 변경될 때, 리스크 평가 테이블의 총 점수가 변경될 때 자동으로 다시 계산됨.
-- loan_limit(대출한도) : 신용 점수가 변경될 때 자동으로 대출 한도가 업데이트됨.
CREATE OR REPLACE PROCEDURE UpdateCreditScore(COM_ID VARCHAR2) AS
    F_SCORE NUMBER := 0;     -- 재무적 요소 총 점수 초기화
    R_SCORE NUMBER := 0;     -- 리스크 평가 총 점수 초기화
    C_SCORE NUMBER := 0;     -- 신용 점수 초기화
BEGIN
    -- 해당 기업의 최신 재무적 요소 총 점수 가져오기
    SELECT NVL(total_score, 0) INTO F_SCORE FROM FinancialFactor
    WHERE company_id = COM_ID AND
        evaluation_date = (SELECT MAX(evaluation_date) FROM FinancialFactor WHERE company_id = COM_ID);

    -- 해당 기업의 최신 리스크 평가 총 점수 가져오기
    SELECT NVL(total_score, 0) INTO R_SCORE FROM RiskEvaluation
    WHERE company_id = COM_ID AND
        evaluation_date = (SELECT MAX(evaluation_date) FROM RiskEvaluation WHERE company_id = COM_ID);

    -- 신용 점수 계산
    C_SCORE := (F_SCORE + R_SCORE) / 2;

    -- 신용평가 삽입
    INSERT INTO CreditEvaluation (evaluation_date, credit_score, loan_limit, company_id)
    VALUES ( SYSDATE, C_SCORE, 0, COM_ID); -- 평가 날짜, 신용 점수, 초기 대출 한도(따로 처리됨), 기업 ID

END;
/

-- 재무적 요소 테이블 변경 시 신용 점수 업데이트
/*
CREATE OR REPLACE TRIGGER Update_FF2CS_TRG  --> 충돌 생김
AFTER INSERT OR UPDATE ON FinancialFactor 
FOR EACH ROW
BEGIN
    -- 재무적 요소 테이블의 '총 점수'가 변동된 경우에만 실행
    IF NVL(:NEW.total_score, 0) != NVL(:OLD.total_score, 0)
        THEN UpdateCreditScore(:NEW.company_id);
    END IF;
END;
/
*/

-- 리스크 평가 테이블 변경 시 신용 점수 업데이트
CREATE OR REPLACE TRIGGER Update_RE2CS_TRG
AFTER INSERT OR UPDATE ON RiskEvaluation        -- 삽입 후
FOR EACH ROW
BEGIN
    -- 리스크 평가 테이블의 '총 점수'가 변동된 경우에만 실행
    IF NVL(:NEW.total_score, 0) != NVL(:OLD.total_score, 0)
        THEN UpdateCreditScore(:NEW.company_id);
    END IF;
END;
/
-------------------------------------
-- 신용 점수에 따른 신용 한도 변경
-------------------------------------
CREATE OR REPLACE PROCEDURE UpdateLimit(EVA_ID IN VARCHAR2) AS
    SCORE NUMBER := 0;  -- 신용 점수 초기화
    LOAN NUMBER := 0;   -- 대출 한도 초기화
BEGIN
    -- 최신 신용 점수 가져오기
    SELECT credit_score INTO SCORE FROM CreditEvaluation WHERE evaluation_id = EVA_ID;
    
    -- 신용 점수에 따른 한도 측정
    IF SCORE >= 900 THEN LOAN := 10000000000;    -- 100억
    ELSIF SCORE >= 800 THEN LOAN := 5000000000;  -- 50억
    ELSIF SCORE >= 700 THEN LOAN := 1000000000;  -- 10억
    ELSIF SCORE >= 600 THEN LOAN := 500000000;   -- 5억
    ELSIF SCORE >= 500 THEN LOAN := 100000000;   -- 1억
    ELSIF SCORE >= 400 THEN LOAN := 50000000;    -- 5천
    ELSIF SCORE >= 300 THEN LOAN := 10000000;    -- 1천
    ELSIF SCORE >= 200 THEN LOAN := 5000000;     -- 5백
    ELSIF SCORE >= 100 THEN LOAN := 1000000;     -- 1백
    ELSE LOAN := 0;
    END IF;
    
    UPDATE CreditEvaluation SET loan_limit = LOAN WHERE evaluation_id = EVA_ID;
    
END;
/

-- 신용 평가 테이블 변경 시 대출 한도 업데이트
/*
CREATE OR REPLACE TRIGGER Update_LL_TRG  --> 트리거 충돌 발생으로 트랜잭션으로 구현
AFTER INSERT OR UPDATE ON CreditEvaluation      --> 변경 후
FOR EACH ROW
DECLARE
    LOAN NUMBER := 0;   -- 대출 한도 초기화
BEGIN
    -- '신용 점수'가 변동된 경우에만 실행
    IF NVL(:NEW.credit_score, 0) != NVL(:OLD.credit_score, 0) THEN
        -- 프로시저를 호출하여 한도 측정
        UpdateLimit(:NEW.evaluation_id, LOAN);
        
        -- 대출 한도 업데이트
        UPDATE CreditEvaluation SET loan_limit = LOAN WHERE evaluation_id  = :NEW.evaluation_id;
    END IF;
END;
/
*/

-- 6. RiskEvaluation(리스크평가)
-- 총 점수: 리스크 평가 테이블에서 INSERT 또는 UPDATE가 발생하면 자동으로 계산.
CREATE OR REPLACE TRIGGER Update_RiskScore_TRG
BEFORE INSERT OR UPDATE ON RiskEvaluation       -- 삽입 전
FOR EACH ROW
BEGIN
    -- total_score(총 점수) : 산업, 경영, 영업, 재무 위험 점수 합산.
    :NEW.total_score := NVL(:NEW.industry_risk, 0) +
                        NVL(:NEW.management_risk, 0) +
                        NVL(:NEW.operation_risk, 0) +
                        NVL(:NEW.financial_risk, 0) +
                        NVL(:NEW.credibility, 0);
END;
/
