FROM python:3.9
WORKDIR /app
COPY app/requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
