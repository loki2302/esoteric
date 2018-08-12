Prerequisites:

* Have [pyenv](https://github.com/pyenv/pyenv) installed
* Have [pipenv](https://github.com/pypa/pipenv) installed

To run the tests:

* (if 3.7.0 is not installed yet) `pyenv install 3.7.0`
* `pipenv install --dev` (install all dependencies, including the dev dependencies)
* Either `pipenv run pytest` or `pipenv shell` and then `pytest`
