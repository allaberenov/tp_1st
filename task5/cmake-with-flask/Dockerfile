FROM gcc:latest  as build
# Выполним сборку нашего проекта
WORKDIR /opt/techprog
RUN apt-get update
RUN apt-get install -y
RUN apt-get update && apt-get -y install cmake
RUN apt-get install -y python3 python3-pip
RUN python3 -m pip install flask
COPY . /app
ADD . /app
WORKDIR /app/build
RUN cmake ..
RUN make

FROM ubuntu:latest

# Добавим пользователя, потому как в Docker по умолчанию используется root
# Запускать незнакомое приложение под root'ом неприлично :)

RUN useradd tp2022user
USER tp2022user

# Установим рабочую директорию нашего приложения
WORKDIR /app

# Скопируем приложение со сборочного контейнера в рабочую директорию
COPY --from=build /app .

# Установим точку входа
#RUN 
EXPOSE 8898

ENTRYPOINT ["bash", "-l", "-", "./bin/C"]
ENTRYPOINT ["python3", "app.py", "--port", "8898", "--host", "0.0.0.0"]
