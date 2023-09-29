FROM python:3.9-bullseye
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --nod-cache-dir --upgrade -r /code/requirements.txt 
COPY ./app /code/app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]