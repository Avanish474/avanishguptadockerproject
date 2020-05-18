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
         Let’s create a docker-compose.yml file for our application:
        
         $ touch docker-compose.yml
         
         
  Step 7-->Let’s populate our docker-compose.yml file. The docker-compose.yml file is a
           YAML file that contains instructions for running one or more Docker containers.  
           refer to docker compose file above!
           Each service we wish to launch is specified as a YAML hash here: web and redis.
           For our web service we’ve specified some runtime options. Firstly, we’ve specified
           the image we’re using: the avanish007/composeapp image
           
           
   Step 8-->We’ve also specified the command to run when launching the service. Next we
            specify the ports and volumes as a list of the port mappings and volumes we want
            for our service. We’ve specified that we’re mapping port 5000 inside our service to port 5000 on the host. We’re also                   creating /composeapp as a volume. Finally,we specify any links for this service. Here we link our web service to the redis
             service.
             
             $ sudo docker run -d -p 5000:5000 -v .:/composeapp --link redis:redis \
             --name avanish007/composeapp python app.py

            Next we’ve specified another service called redis. For this service we’re not setting any runtime defaults at all. We’re                 just going to use the base redis image. By default, containers run from this image launches a Redis database on the standard
            port. So we don’t need to configure or customize it. 


 Step 9--> Running Compose:
           Once we’ve specified our services in docker-compose.yml we use the dockercompose up command to execute them both.
           
           $ cd composeapp
           
           $ sudo docker-compose up

        

