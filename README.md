deployment setup
...............................
EFS 
  Create EFS filesystem 
  
...............................
TEMPLATE CONFIGURATION 
  TO ATTACH EFS AUTOMATICALLY TO NODE CREATED THROUGH LOAD AND INSTALL, ALLOW NECCESORY PORT ON FIREWALL. 
    FOR TEMPLATE :- {DEPLOYMENT-CONFIG IN TEMPLATE}
    - Use instance type: c5xlarge
    - Security-Group
    - Key-Pair
    - User data script 
    
...............................
CLUSTER SETUP :-
  Create cluster With template
  Create Acess entry by kubernetes user And type --> standard, policy scope --> AmazoneEKSadminPolicy.
  
...............................
SERVER SETUP :- [jenkines-server]
Instance type : c5large  Family: [aws linux]
  software or tools install on that 
    1) git 
    2) docker 
    3) Jenkins
    
  Packages :
    1) kubectl

  Role: Attache role to communicate EC2 to Eks cluster
    Role Permission: AdminFullAccess

  Configure kubernetes user to perform kubernetes deployment task
    configure with aws configure cammand

  configure cluster on cluster  
    using kubeconfig update cammand 

  Deploy ingress controller And service 
  
...............................
JENKINES SERVER SETUP

Credential for jenkins pipeline
  github credential
  dockerhub credential
  kubernetes user credential

Necessory plugins on jenkines server  
  Pipeline-plugin
  git-plugin
  kubernetes-plugin
  docker plugin

For Automation project we will have to create 1 job and 1 or 2 pipeline.
  job :- Make one job for that Trigger Remotely using script When any change is performed in s3 bucket 
  pipeline 1st :- kubernetes cluster configure, clone the repo from github, build the Dokcker image from db.dockerfile, docker push image on dockerhub, then deploy kubernetes secret.yaml, and deploy db.pv, db.pvc, db.deployment and db.service, db.hpa. 
  pipeline 2nd ;- kubernetes cluster configure, clone the repo from github, build the Dokcker image from app.dockerfile, docker push image on dockerhub, then deploy app.pv, app.pvc, app.deployment and app.service, ingress rule, app.hpa.
