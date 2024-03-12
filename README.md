# Ansible Content Builder Example

Use `make` to run the `docker` commands that will fetch the Equinix Metal API spec and build an Ansible Collection from that API spec.

```sh
make
```

The default API specification URL can be changed as follows:

```sh
make spec_url=https://raw.githubusercontent.com/OpenAPITools/openapi-petstore/master/src/main/resources/openapi.yaml
```

See generated `collections/` after a successful build. (blocked by [Issue #1](https://github.com/displague/content-builder-example/issues/1))

For more on Ansible Content Builder, see <https://www.ansible.com/blog/streamline-your-ansible-module-development-with-content-builder>.
