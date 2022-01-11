# {{cookiecutter.image_name}}/Dockerfile
FROM python:3.9-slim-buster
WORKDIR /model_src

COPY requirements.txt .
RUN pip install --no-compile --no-cache-dir --upgrade pip \
    && pip install --no-compile --no-cache-dir -r requirements.txt \
    && find / -depth \
        \( \
            \( -type d -name __pycache__ \) \
            -o \
            \( -type f -a \( -name '*.pyc' -o -name '*.pyo' -o -name '*.whl' \) \) \
        \) -exec rm -rfv '{}' +

COPY src/ src
CMD ["python3", "src/run.py"]
