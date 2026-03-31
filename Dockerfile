# Use the official Python base image
FROM python:3.10

# Set the working directory
WORKDIR /code

# Copy the requirements file into the container
COPY ./requirements.txt /code/requirements.txt

# Install dependencies (ignoring the cache to save space)
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy all the project files into the container
COPY . /code

# Hugging Face Spaces requires apps to run on port 7860
CMD ["uvicorn", "api.webapp:app", "--host", "0.0.0.0", "--port", "7860"]
