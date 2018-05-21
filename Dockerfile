FROM python:3

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y ruby ruby-dev rubygems build-essential
RUN gem install --no-ri --no-rdoc fpm

COPY openapi-linter.py .
COPY openapi.yaml .
COPY build-docs.sh .
COPY linode-docs.postinst .
COPY linode-logo.svg .
COPY linode-logo-white.svg .
COPY redoc.standalone.js .
COPY favicon.ico .
COPY changelog/ .

CMD ["python", "openapi-linter.py", "openapi.yaml"]