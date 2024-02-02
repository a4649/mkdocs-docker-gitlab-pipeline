# Mkdocs running on Docker with NGINX and deployed through GitLab CI/CD Pipeline

# How to

1. Clone the repository and change directory to it

2. Create python virtual enviroment, upgrade pip and install requires packages:

```
python3.11 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

3. Make change to the website using **index.md** and other files inside **docs** directory

4. Test the changes:

```
mkdocs serve
```

Open your browser on the indicated port.

5. Commit the changes and push to the master branch
