FROM python:3.5-slim

ADD requirements.txt /

RUN pip install -r requirements.txt

WORKDIR ./

ADD ./ /

CMD /usr/local/bin/gunicorn -b 0.0.0.0:$PORT api:app