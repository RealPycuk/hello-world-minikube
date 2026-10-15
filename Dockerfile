FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Сначала зависимости: этот слой кэшируется, пока не изменится requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Приложение работает от непривилегированного пользователя
RUN useradd --uid 10001 --no-create-home app
USER 10001

EXPOSE 32777

CMD ["python", "app.py"]
