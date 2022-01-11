# DAFNI python model template

[cookiecutter](https://github.com/cookiecutter/cookiecutter) template to wrap
up your python scripts/packages for easy deployment as shiny new DAFNI models.

This template includes:

- standard layout reflecting volume mounts on DAFNI
- a simple, slim python dockerfile to install your dependencies and run your model script
- bash script to simulate DAFNI runs in docker/podman on your local machine
- github workflow to build and upload any new releases (marked with a tag starting in `v`)

Just add a model and some test data and you're good to go!

## Quick start

Requires cookiecutter to be installed - see the link above.

```bash
cookiecutter https://github.com/TColl/dafni-python-model-template
```

You'll then be prompted to provide your details and model information
(see [cookiecutter.json](cookiecutter.json) for more information on what's
required), which will be used to generate a new subdirectory with your new
image name.

Add your python code under the `src` directory, tweak the dockerfile and
[model definition file]({{cookiecutter.image_name}}/model-definition.yaml)
however you see fit, use the provided
[quick_start]({{cookiecutter.image_name}}/quick_start.sh)
file to carry out local testing, then use the
[makefile]({{cookiecutter.image_name}}/makefile)
to manually build, export and zip your final image ready for upload to DAFNI,
or let
[github actions do the hard work for you]({{cookiecutter.image_name}}/.github/workflows/dockerbuild.yml)
