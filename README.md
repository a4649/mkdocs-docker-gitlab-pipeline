# mkdocs-docker-gitlab-pipeline
mkdocs website deployment using docker with gitlab ci/cd pipeline

# How to

Create python virtual environment, source it, install requirements

```
python3.11 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Make changes to the site: mkdocs.yml, docs/index.md

Preview site

```
mkdocs serve
```

Publish site changes

```
git push origin <remote-branch>
```