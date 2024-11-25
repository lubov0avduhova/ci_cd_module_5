# Указываем базовый образ
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл JAR (результат сборки вашего Spring MVC приложения) в образ
COPY target/avduhova_lubov-1.jar /app/avduhova_lubov-1.jar

# Указываем порт, который будет использоваться приложением
EXPOSE 8080

# Команда для запуска Spring MVC приложения
ENTRYPOINT ["java", "-jar", "/app/avduhova_lubov-1.jar"]