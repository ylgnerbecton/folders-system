FROM python:3.9

RUN apt-get update && apt-get install -qq -y \
  build-essential libpq-dev libffi-dev git --no-install-recommends

EXPOSE 8000
RUN mkdir /app
WORKDIR /app

ADD requirements.txt /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

ADD clicksign-backend /app

CMD /app/manage.py runserver 0.0.0.0:8000