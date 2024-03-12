FROM python
WORKDIR /work
#RUN apt update && apt-get install -y ansible && apt-get clean
# pipx install ansible.content_builder
RUN pip3 install -U --user black==22.3.0 autoflake jsonschema jinja2==3.0.3
RUN pip3 install -U --user ansible-core ansible
RUN pip3 install -U --user boto3 baron redbaron
#RUN pip3 install --user ansible.content_builder
#RUN for a in black==22.3.0 autoflake jsonschema jinja2==3.0.3 ansible-core; do pipx install $a; done;
ENV PATH="${PATH}:/root/.local/bin"
RUN ansible-galaxy collection install git+https://github.com/ansible-community/ansible.content_builder.git
# COPY MANIFEST.yaml requirements.yaml build.yaml /
RUN curl -o lbaas.json https://lb.metalctrl.io/v1/openapi/openapi-loadbalancer.json
RUN curl -o metal.json https://api.equinix.com/metal/v1/api-docs
# RUN ansible-galaxy collection install --pre -r requirements.yaml 
CMD ansible-playbook build.yaml -e manifest_file=MANIFEST.yaml

