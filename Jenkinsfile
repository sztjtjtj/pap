node {
   stage('Preparation') {
      // Get some code from a GitHub repository
      git 'https://github.com/sztjtjtj/pap.git'
   }
   stage('Build') {
      // clear docker environment
      sh label: '', script: 'sudo docker kill $(docker ps -a |grep pap |awk \'{print $1}\')'
      sh label: '', script: 'sudo docker rm $(docker ps -a |grep pap |awk \'{print $1}\')'
      sh label: '', script: 'sudo docker rmi $(docker images |grep "tjlabs/pap" |awk \'{print $3}\')'
      echo 'cleaned docker environment'
      // Run the docker build
      sh label: '', script: 'sudo docker build -t tjlabs/pap .'
      echo 'docker images built successfully'
   }
   stage('DeploySI') {
      sh label: '', script: 'sudo docker run --name pap-si -d -p 28001:80 tjlabs/pap'
      echo 'deployed the SI test environment'
      //sh label: '', script: 'sudo docker images && sudo docker ps'
   }
   stage('SItest') {
      echo 'SI tested'
   }
   stage('DeployUAT') {
      sh label: '', script: 'sudo docker run --name pap-uat -d -p 28002:80 tjlabs/pap'
      echo 'deployed the UAT test environment'
      //sh label: '', script: 'sudo docker images && sudo docker ps'
   }
   stage('UATtest') {
      echo 'UAT tested'
   }
   stage('DeployStage') {
      sh label: '', script: 'sudo docker run --name pap-stage -d -p 28003:80 tjlabs/pap'
      echo 'deployed the Stage test environment'
      //sh label: '', script: 'sudo docker images && sudo docker ps'
   }
   stage('Stagetest') {
      echo 'Stage tested'
   }
   stage('DeployProd') {
      sh label: '', script: 'sudo docker run --name pap-prod -d -p 28004:80 tjlabs/pap'
      echo 'deployed the Product test environment'
      sh label: '', script: 'sudo docker images && sudo docker ps'
   }
}

