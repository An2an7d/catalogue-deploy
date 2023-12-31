terraform{
required_providers {
aws={
source = "hashicorp/aws"
version = "~> 5.0"
}
}

backend "s3"{
    bucket = "roboshop-nwtbf"
    key = "catalogue-dev"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking"
}

}

provider "aws"{
region = "us-east-1"
}