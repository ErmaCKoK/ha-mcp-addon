ARG BUILD_FROM
FROM python:3.11-slim

# jq is used by run.sh to read the add-on options (/data/options.json)
RUN apt-get update \
    && apt-get install -y --no-install-recommends jq \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir ha-mcp==3.5.1

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
