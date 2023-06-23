//Dockerfile
----------------------------------------------
# Use the official Python base image
FROM python:3

# Copy the requirements file and install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the code into the Docker image
COPY . /web
WORKDIR /web

# Copy the templates directory
COPY templates /web/templates

# Expose the necessary port
EXPOSE 5100

# Set the entrypoint command to run the Flask app
CMD python, web.py
-----------------------------------------------------
//build the image 
docker build -t myweb .
-----------------------------------------------------
//run the image
docker run -d -p 5100:5100  myweb
---------------------------------------------------------
//to start a shell inside a running container, you can use the following command:
docker exec -it 7df29e43b8fd /bin/bash
//Quit shell from container
exit
-------------------------------------------------------------
//On your host machine (i.e., outside the Docker container)
web/
├── Dockerfile
├── requirements.txt
├── web.py
├── templates/
│   └── index.html
│── static/
│   └── css/
│       └── styles.css
│   └── js/
│       └── script.js
// html code should include:
<head>
    <link rel="stylesheet" href="{{ url_for('static', filename='css/styles.css') }}">
    <script src="{{ url_for('static', filename='js/script.js') }}"></script>
</head>



