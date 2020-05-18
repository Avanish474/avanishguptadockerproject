FROM python:3.6
ADD . /composeapp
WORKDIR /composeapp
RUN pip install -r requisite.txt
