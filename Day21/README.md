Serverless hosting:
S3 static website hosting allows us to serve static files like HTML, CSS, and JS directly over HTTP without managing any servers.

you main.tf file should contain:
# S3 Bucket 
# Enable Static Website Hosting 
# Public Access Block (disable restrictions) 
# Bucket Policy (Allow Public Read) 
# Upload index.html

Better Structure:
.
├── main.tf        # resources
├── variables.tf   # inputs
├── outputs.tf     # outputs
├── terraform.tfvars
└── website/
    └── index.html

NOTE: Serverless Hosting only runs HTML, CSS, JS (frontend logic), Images, fonts, videos.There is no server to execute code it doesnt support python or other Directly but it can work through AWS Lambda & API Gateway.

Interview Answer:

Q: Does serverless only support HTML/CSS/JS?
Ans: Static hosting services like S3 serve only static content, but serverless architectures can run backend code using services like AWS Lambda.

Q: Difference between jsonencode and heredoc in Terraform?
Ans: Both can be used to define JSON policies, but jsonencode is preferred because it avoids syntax errors and integrates better with Terraform variables.

HEREDOC style:
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MY_BUCKET_POLICY",
  "Statement": [
    {
      "Sid": "PublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::var.${var.aws_s3_bucket}/*",
    }
  ]
}
POLICY