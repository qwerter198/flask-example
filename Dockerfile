FROM python:3.11
COPY / /web/
WORKDIR /web
RUN pip install -r requirements.txt