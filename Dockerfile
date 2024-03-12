FROM python:3.12-slim
WORKDIR /work
ENV SPEC_URL https://api.equinix.com/metal/v1/api-docs
ENV PATH="${PATH}:/root/.local/bin"
RUN apt-get -q update && apt-get install -y -q git curl && apt-get clean
RUN pip3 install -U --user black==22.3.0 autoflake jsonschema jinja2==3.0.3
RUN pip3 install -U --user ansible-core ansible
RUN pip3 install -U --user boto3 baron redbaron
#RUN pip3 install --user ansible.content_builder
COPY requirements.yaml /work/
RUN ansible-galaxy collection install --pre -r requirements.yaml
RUN curl -o oas.json ${SPEC_URL}
CMD ansible-playbook build.yaml -e manifest_file=MANIFEST.yaml

