FROM python
WORKDIR /work
ENV SPEC_URL https://api.equinix.com/metal/v1/api-docs
RUN pip3 install -U --user black==22.3.0 autoflake jsonschema jinja2==3.0.3
RUN pip3 install -U --user ansible-core ansible
RUN pip3 install -U --user boto3 baron redbaron
#RUN pip3 install --user ansible.content_builder
ENV PATH="${PATH}:/root/.local/bin"
RUN ansible-galaxy collection install git+https://github.com/ansible-community/ansible.content_builder.git
RUN curl -o oas.json ${SPEC_URL}
# RUN ansible-galaxy collection install --pre -r requirements.yaml 
CMD ansible-playbook build.yaml -e manifest_file=MANIFEST.yaml

