FROM python:3.9

RUN apt-get update && apt-get install -qq -y \
  build-essential libpq-dev libffi-dev git --no-install-recommends

RUN mkdir /app
WORKDIR /app

ADD requirements.txt /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD . /app

EXPOSE 8001
CMD ["gunicorn", "--bind", "0.0.0.0:8001", "settings.wsgi:application"]