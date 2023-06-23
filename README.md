# cloudbuild-with-terraform
Provides a terraform code to utilize cloud build service from GCP to build and push docker images to a dockerhub registry then deploy the app using cloud run.
# setup
Created a service account with the necessary permissions then built the docker trigger resource to invoke the dockerfile from the repo once we run it to apply the stated steps to build and push the image of the app to a dcokerhub registry.
![image](https://github.com/Gaser98/cloudbuild-with-terraform/assets/76227165/1582082b-4d14-4590-a3d5-1c6da58a5bd7)

Note: Secret manager accessor to use a secret file for dockerhub creds if needed 
      Storage admin to configure remote backend for terraform state file if needed
For deployment,create a service on cloud run.

