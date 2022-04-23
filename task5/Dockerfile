FROM gcc:latest  as build
# Выполним сборку нашего проекта
RUN apt-get update
RUN apt-get install -y
RUN apt-get update && apt-get -y install cmake

COPY . /app
ADD . /app
WORKDIR /app/cmake-with-flask/build
RUN cmake ..
RUN make

FROM ubuntu:latest

# Добавим пользователя, потому как в Docker по умолчанию используется root
# Запускать незнакомое приложение под root'ом неприлично :)

RUN useradd -ms /bin/bash tp2022user
USER tp2022user
WORKDIR /home/tp2022user

# Установим рабочую директорию нашего приложения
WORKDIR /app

# Скопируем приложение со сборочного контейнера в рабочую директорию
COPY --from=build /app .

# Установим точку входа
ENTRYPOINT ["bash", "-l", "-c", "./cmake-with-flask/bin/C"]
#RUN Task6
