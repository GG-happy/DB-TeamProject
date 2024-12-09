# JDK 23 이미지를 베이스로 설정
FROM openjdk:23-jdk

# 작성자 정보 (옵션)
LABEL maintainer="jfttstudio@gmail.com"

# 워킹 디렉토리 설정
WORKDIR /app

# 애플리케이션 JAR 파일 복사
COPY build/libs/DBP_financeMgmt_Team11-0.0.1-SNAPSHOT.jar /app/app.jar

# 컨테이너 내부에서 실행될 포트 지정
EXPOSE 8080

# 애플리케이션 실행 명령어
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
