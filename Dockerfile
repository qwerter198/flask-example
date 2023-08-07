FROM python:3.8
COPY / /web/
WORKDIR /web
RUN pip install -r requirements.txt