FROM python:3.10-alpine
ENV APP_PORT=9000

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir /logs
VOLUME /logs

COPY . .

CMD python main.py