# Указываем базовый образ
FROM maven:3.8.5-openjdk-17 AS builder

# Устанавливаем рабочую директорию для сборки
WORKDIR /build

# Копируем pom.xml и загружаем зависимости Maven
COPY pom.xml .
RUN mvn dependency:go-offline

# Копируем исходный код и собираем проект
COPY src ./src
RUN mvn clean package -DskipTests

# Используем минимальный образ для запуска JAR
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию для запуска приложения
WORKDIR /app

# Копируем собранный JAR из предыдущего этапа
COPY --from=builder /build/target/*.jar /app/app.jar

# Указываем порт, который будет использоваться приложением
EXPOSE 8080

# Команда для запуска приложения
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
