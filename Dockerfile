FROM python:3
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN apt-get -y update 
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "web.py"]