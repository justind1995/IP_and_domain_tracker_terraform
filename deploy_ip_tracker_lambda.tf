# Configure the AWS Provider
provider "aws" {
    region = "us-east-2"
    #removed keys for pushing to github
}
resource "aws_lambda_function" "IP_And_Domain_Tracker" {
    filename      = "../IPandDomainTrackerApp/IP_and_domain_tracker.zip"
    function_name = "IP_and_domain_tracker"
    role          = "arn:aws:iam::742561206412:role/service-role/IP_And_Domain_Tracker-role-ft8zuw2x"
    handler       = "IP_and_domain_tracker"

    lifecycle {
        create_before_destroy = true
    }

    runtime = "go1.x"

    environment {
        variables = {
            api_key = "<insert virus data api key here>"
        }  
    }
}
