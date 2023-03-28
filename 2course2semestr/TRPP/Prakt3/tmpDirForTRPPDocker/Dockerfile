FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y patch

RUN mkdir /mnt/files

COPY data/student.txt /mnt/files/student.txt

EXPOSE 8821

WORKDIR /mnt/files

CMD ["python3", "-m", "http.server", "8821"]