FROM gcc:latest as build
RUN cmake ../cmake-with-flask && \
    cmake --build .
    

# В качестве базового образа используем ubuntu:latest
FROM ubuntu:latest
WORKDIR /bin
RUN Task6
