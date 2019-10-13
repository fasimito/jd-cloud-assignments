node{
    stage('Prepare ENV'){
        sh '''
        export M2_HOME=/usr/local/apache-maven-3.6.1
        export PATH=$PATH:$M2_HOME/bin
        '''
    }
    stage('git clone'){
        //check CODE
        git credentialsId: 'bf80087d-fe5c-4dc9-93fe-75fd7dff4049', url: 'https://github.com/fasimito/aws-assignments.git'
    }

    stage('run test'){
        dir('./'){
            sh '''
            mvn test
            '''
        }
    }

    stage('run build'){
        dir('./'){
            sh '''
            mvn clean package -Dmaven.test.skip=true
		    '''
        }
    }

    stage('docker images build'){
		sh '''
		# define the container's  work dir
		WORK_DIR=/var/web/app/$JOB_NAME/
		# get the image ID of My Job.
		IMAGE_ID=$(sudo docker images | grep "$JOB_NAME" | awk \'{print $3}\')
		# construct docker image
		if [ -n "$IMAGE_ID" ]; then
			echo "the $JOB_NAME image is already exist，the id is: $IMAGE_ID"
			CONTAINER_ID=$(sudo docker ps | grep "$JOB_NAME" | awk \'{print $1}\')
			if [ -n "$CONTAINER_ID" ]; then
			    sudo docker rm -f $CONTAINER_ID
			fi
			sudo docker rmi -f $IMAGE_ID
		else
			echo "the $JOB_NAME image does not exist， start construct the image"
		fi
		sudo docker build --build-arg work_dir=$WORK_DIR -t $JOB_NAME .
		'''
	}

	stage('docker compose deploy'){
		sh '''
		#container ID
		CONTAINER_ID=$(sudo docker ps | grep "$JOB_NAME" | awk \'{print $1}\')
		if [ -n "$CONTAINER_ID" ]; then
			echo "the container $JOB_NAME ia already exist，the containerId is :$CONTAINER_ID,rm the docker container ..."
			sudo docker rm -f $CONTAINER_ID
			echo "the container $JOB_NAME rm successfully"
		fi
			sudo docker run -d -p 9090:9090 aws-assignments
			echo "the container $JOB_NAME create successfully"
		'''
	}
}