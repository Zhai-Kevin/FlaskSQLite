//Dockerfile
----------------------------------------------
# Use the official Python base image
FROM python:

# Copy the requirements file and install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the code into the Docker image
COPY . /app
WORKDIR /app

# Copy the templates directory
COPY templates /app/templates

# Expose the necessary port
EXPOSE 5000

# Set the entrypoint command to run the Flask app
CMD ["python", "app.py"]
-----------------------------------------------------
//build the image 
docker build -t myapp .
-----------------------------------------------------
//run the image
docker run -d -p 5000:5000  myapp
---------------------------------------------------------
//to start a shell inside a running container, you can use the following command:
docker exec -it 7df29e43b8fd /bin/bash
//Quit shell from container
exit
-------------------------------------------------------------
//On your host machine (i.e., outside the Docker container)
app/
├── Dockerfile
├── requirements.txt
├── app.py
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



