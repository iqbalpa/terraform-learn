# Terraform Learn

This project is my simple project to deploy simple NestJS application using Docker into Google Cloud Engine by using Terraform for infrastructure provisioning. You can access the result [here](http://terraform-learn.iqbalpahlevi.com:3000). It supposed to display `hello world`. Also you can access it by adding number parameter in the end of the link, it will display `hello id: n`.

## Tech Stack

- NestJS
- Docker
- Google Cloud Platform
- Terraform
- GitHub Actions (CI/CD)

## What I Have Learned

I encountered a lot of issues during the development. It took me 3 days to finish everything and 4 days in total to optimize it. This project is simple, yet complicated if you work with Terraform for the first time. Basically, Terraform will set everything up in your Virtual Machine without setting it up manually in Google Cloud Platform. Here are what I learnt from this project.

1. Preparing the infrastructure in GCP with Terraform.
2. Dockerize NestJS app and store it in Dockerhub.
3. Pull the docker image and run it in GCP VM.
4. Everything is done via automation with GitHub Actions for CI/CD.

## References

Thanks to [Terraform documentation](https://developer.hashicorp.com/terraform/tutorials/gcp-get-started) and GCP documentation. It was definitely helped me to finish this project. 