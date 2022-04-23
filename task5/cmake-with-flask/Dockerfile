FROM gcc:latest  as build
# Выполним сборку нашего проекта
WORKDIR /opt/techprog
RUN apt-get update
RUN apt-get install -y
RUN apt-get update && apt-get -y install cmake
RUN apt-get install -y python3 python3-pip
RUN python3 -m pip install flask
COPY . .
ADD . /app
RUN cmake .
RUN make

RUN useradd tp2022user
# Установим точку входа
#RUN 
#COPY --from=build . .
EXPOSE 8898
USER tp2022user

CMD ["python3" , "app.py", "--port", "8898", "--host", "0.0.0.0"]


