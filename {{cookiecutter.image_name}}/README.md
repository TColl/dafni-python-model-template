# {{cookiecutter.model_name}}

{{cookiecutter.model_summary}}

Created by:
{{cookiecutter.full_name}} <{{cookiecutter.email}}>

## Testing

Use the quick start script to:

- build your model image
- simulate a model run on DAFNI (which mounts the [data](data) in the same
  location as DAFNI's inputs and outputs)
- run an interactive terminal prompt within your model container to explore its
  contents
- fire up a jupyter lab instance from within your model container, and list out
  the address you need to open in your browser to start working directly inside
  it (use the `http...` link)

```bash
./quick_start.sh
```

## Automated model upload

To take advantage of the github workflow for building and deploying the model
automatically, create a new tag starting with the letter 'v', and push it up to
github (on any branch):

```bash
git tag v0.3.6
git push --tags
```

The pipeline will pick this up and do the hard work, as long as valid DAFNI
login details are stored as secrets on the repo correctly.

## Building for manual deployment

The included [makefile](makefile) will handle building, exporting and compressing
your image ready for upload to dafni along with your
[model definition file](model_definition.yaml):

```bash
make build  # may take ~5-10mins to complete for larger images
```

Built, compressed image files will be made available in the [build](build) folder.
