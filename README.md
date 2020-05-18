# avanishguptadockerproject
Step 1-->Make directory
         $ mkdir composeapp
         $ cd composeapp
         create a Dockerfile in it as follows:
         $ touch Dockerfile
          Here we’ve created a directory to hold our sample application, which we’re calling
          composeapp. We’ve changed into that directory and created an empty Dockerfile
          to hold our Docker image build instructions.
 Step 2-->. Let’s create a file called app.py and add the following Python code to it. Refer to app.py from above!
 This simple Flask application tracks a counter stored in Redis. The counter is
incremented each time the root URL, /, is hit
 Step 3-->We also need to create a requirements.txt file to store our application’s dependencies.
 Step 4-->Now let’s populate our Compose Dockerfile
           $ gedit Dockerfile 
           refer to Dockerfile from above!
           Our Dockerfile is simple. It is based on the python:3 image. We add our app
.py and requirements.txt files into a directory in the image called /composeapp.
The Dockerfile then sets the working directory to /composeapp and runs the pip
installation process to install our application’s dependencies: flask and redis.

Step 5--> Let’s build that image now using the docker build command
         $ sudo docker build -t avanish007/composeapp
         This will build a new image called avanish007/composeapp containing our sample
application and its required dependencies. We can now use Compose to deploy
our application.
Step 6-->Now we’ve got our application image built we can configure Compose to create
         both the services we require. With Compose, we define a set of services (in the
         form of Docker containers) to launch. We also define the runtime properties we
         want these services to start with, much as you would do with the docker run
         command. We define all of this in a YAML file. We then run the docker-compose
         up command. Compose launches the containers, executes the appropriate runtime
         configuration, and multiplexes the log output together for us.
         Let’s create a docker-compose.yml file for our application

