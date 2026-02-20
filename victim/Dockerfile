FROM python:3.10-slim

WORKDIR /app

COPY infostealer_sim.py .
COPY logs/ logs/
COPY artifacts/ artifacts/

RUN pip install requests

CMD ["python3", "infostealer_sim.py"]
