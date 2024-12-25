FROM redhat/ubi8

RUN yum -y install python3 && pip3 install Flask

WORKDIR /myapp

COPY app.py  /myapp/bharath.py

ENTRYPOINT ["python3", "bharath.py"]

