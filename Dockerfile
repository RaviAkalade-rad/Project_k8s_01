FROM python:3.11-alpine
LABEL maintainer="ravi.radical2024@gmail.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 4000
ENTRYPOINT ["python"]
CMD ["src/app.py"]