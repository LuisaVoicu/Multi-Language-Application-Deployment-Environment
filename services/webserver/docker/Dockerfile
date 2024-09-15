FROM python:3.7-slim
WORKDIR /web-server-avg
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY resources/server.py .
CMD ["python", "server.py"]
