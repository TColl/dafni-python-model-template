"""
Runs after pre-commit has deployed the python model template.
"""

import os
from subprocess import run

PROJECT_DIRECTORY = os.path.realpath(os.path.curdir)


def init_git_repo():
    """
    Initialises git repo in the project directory.
    """
    print("\n- Initialising git repo:\n")
    os.chdir(PROJECT_DIRECTORY)
    return_code = run(["git", "init", "--initial-branch", "main"]).returncode

    if return_code != 0:
        raise EnvironmentError(
            "Failed to initialise git. Likely your git version is "
            "too old. Update to >= 2.28.0"
        )

    if "{{cookiecutter.home_page}}".endswith(".git"):
        origin_url = "{{cookiecutter.home_page}}"
    else:
        origin_url = "{{cookiecutter.home_page}}.git"

    run(["git", "remote", "add", "origin", origin_url])


if __name__ == "__main__":
    init_git_repo()

    print(
        """
    ========================================
    |   ✓ Template successfully deployed   |
    ========================================
    """
    )
