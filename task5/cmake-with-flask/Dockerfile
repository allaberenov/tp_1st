FROM ubuntu:latest
FROM gcc:latest

WORKDIR /opt/techprog
COPY . .
RUN apt-get update && apt-get install -y cmake && apt-get install -y python3 python3-pip 
RUN python3 -m pip install flask
RUN useradd tp2022user
RUN cmake .
RUN make
EXPOSE 8898
USER tp2022user
CMD ["python3", "app.py", "--port", "8898", "--host", "0.0.0.0"]