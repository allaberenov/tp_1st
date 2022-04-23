FROM gcc:latest 
# Выполним сборку нашего проекта
RUN apt-get update
RUN apt-get install -y
RUN apt-get update && apt-get -y install cmake

COPY . /app
ADD . /app
WORKDIR /app/cmake_with_flask/build
RUN cmake ..
RUN make

FROM ubuntu:latest as base

#WORKDIR /app/cmake_with_flask

COPY --from=build /app/cmake_with_flask/bin/C /cmake_with_flask
CMD [ "./cmake_with_flask/C" ]

#RUN cmake .. && \ cmake --build

# В качестве базового образа используем ubuntu:latest



# Установим рабочую директорию нашего приложения
#WORKDIR /app

# Установим точку входа

#CMD [ "./bin/C" ]
    

# В качестве базового образа используем ubuntu:latest
#FROM ubuntu:latest
#WORKDIR /bin
#RUN Task6
