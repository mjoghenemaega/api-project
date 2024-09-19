FROM python:3.9-alpine3.13
LABEL maintainer="moses johnson oghenemaega"

ENV PYTHONBUFFERED 1

# Install dependencies
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

WORKDIR /app

EXPOSE 8000

ARG DEV=false

# Install additional packages required for virtual environment and building dependencies
RUN apk add --update --no-cache \
        postgresql-client \
        python3-dev \
        libffi-dev \
        py3-virtualenv && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base \
        postgresql-dev \
        musl-dev && \
    python3 -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install --no-cache-dir -r /tmp/requirements.txt && \
    if [ "$DEV" = "true" ]; then \
        echo "--DEV BUILD--" && /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# Fix any potential permission issues
RUN chown -R django-user /app

# Set environment path
ENV PATH="/scripts:/py/bin:$PATH"

# Switch to non-root user
USER django-user
