#python ka base image use ho raha hai
FROM python:3.8-slim

#set a directory inside the container where container work
WORKDIR /app

#system ke liye required package update hoga
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*


#copy requirement file into the container
COPY requirements.txt .

# Copy the rest of your application code 
COPY . .

#Install all depencies of your app
RUN pip install --no-cache-dir -r requirements.txt 
RUN pip install mysqlclient

#Run your python application
CMD ["python", "app.py"]