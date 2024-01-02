FROM python:3.8-slim

COPY . /pro
WORKDIR /pro

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD /bin/sh -c './main.sh'