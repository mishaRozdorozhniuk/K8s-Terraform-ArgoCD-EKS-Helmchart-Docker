FROM python:3.9 as base

WORKDIR /usr/local/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -m app

COPY --chown=app:app . .

USER app

EXPOSE 8080

CMD ["python", "server.py"]
