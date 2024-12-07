import random as r
from datetime import date, timedelta
import oracledb

# 날짜 범위
start_date = date(2020, 1, 1)
end_date = date(2023, 12, 31)

# 계좌번호 생성
def account_num_crate():
    bank_map = {
        1: ('022', 'KDB산업은행'),
        2: ('04', 'IBK기업은행'),
        3: ('25', 'KB국민은행'),
        4: ('22', '하나은행'),
        5: ('05', '신한은행'),
        6: ('17', 'NH농협은행'),
        7: ('005', '우리은행'),
        8: ('20', 'SC제일은행')
    }
    bank_code, bank_name = bank_map[r.randint(1, 8)]
    account_number = bank_code + ''.join(str(r.randint(0, 9)) for _ in range(10))
    return account_number, bank_name

# 랜덤 날짜 생성
def generate_random_date(start_date, end_date):
    delta = end_date - start_date
    random_days = r.randint(0, delta.days)
    return start_date + timedelta(days=random_days)

# 코드 증가
def increment_code(code):
    prefix, num = code.split('-')
    num = int(num) + 1
    return f"{prefix}-{num:06d}"

# 데이터 삽입
def insert_data():
    # 데이터베이스 연결
    con = oracledb.connect(user="DBP", password="1234", dsn="jhlhome.myds.me:1521/")
    cursor = con.cursor()

    # 샘플 데이터
    name_list = ['김민준', '이지혜', '박찬호', '최유진', '정수현', '강민서', '조현우', '윤서준', '고은지', '장하준',
                 '임나연', '한지민', '오세준', '서민지', '구자현', '문현우', '신지수', '안태준', '홍예린', '주시현',
                 '최정우', '송재석', '송동하', '송성우', '홍정환', '권예훈', '송재숙', '김승환', '안승환', '노민준',
                 '백도준', '하희주', '백은재', '서용진', '최신우', '김길현', '문형철', '조민주', '윤서하', '추주현',
                 '김용빈', '김슬아', '김연준', '남종현', '노소영', '류정원', '문영표', '문용식', '박건배', '박관우',
                 '박병규', '박상진', '박성수', '박세창', '박용오', '박정원', '박태준', '박희영', '방시혁', '백종원',
                 '서수길', '서정진', '성신제', '손경식', '손길승', '송병준', '송삼석', '송재경', '신격호', '신동환',
                 '신재호', '신창섭', '안철수', '양정모', '양진호', '양필승', '오광현', '오영국', '유명한', '유일한',
                 '유재청', '윤세영', '윤여을', '윤장섭', '이건희', '이관래', '이기태', '이국철', '이규홍', '이동찬',
                 '이상국', '이상은', '이석희', '이수빈', '이준용', '이창원', '임대홍', '임창욱', '장경호', '정몽규']
    account_class = ['예금', '출금']
    initial_code = "COM-000002"

    for i in range(len(name_list)):
        account_num, bank = account_num_crate()
        name = name_list[i]
        classification = r.choice(account_class)
        random_date = generate_random_date(start_date, end_date).strftime('%Y-%m-%d')  # 문자열 변환
        random_number = r.randint(10**3, 10**6 - 1)  # 4~6자리 숫자 생성
        incremented_code = increment_code(initial_code)
        initial_code = incremented_code  # 코드 업데이트

        # SQL 실행 (바인딩 사용)
        sql = """
        INSERT INTO ACCOUNT (ACCOUNT_ID, ACCOUNT_NO, ACCOUNT_NAME, CLASSIFICA, BRANCH, OPEN_DATE, BALANCE, COMPANY_ID) 
        VALUES (:1, :2, :3, :4, :5, TO_DATE(:6, 'YYYY-MM-DD'), :7, :8)
        """
        cursor.execute(sql, [i + 1, account_num, name, classification, bank, random_date, random_number, incremented_code])

    # 커밋 및 연결 종료
    con.commit()
    cursor.close()
    con.close()

# 실행
insert_data()
