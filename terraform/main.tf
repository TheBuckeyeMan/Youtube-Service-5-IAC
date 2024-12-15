data "aws_ecr_image" "latest_image" {
  repository_name = "youtube-containers"
  image_tag       = "youtube-service-5"
}

data "aws_iam_role" "existing_lambda_role" {
  name = "lambda_role_for_s3_access" #Name of the iam role that gives your lambda permissions
}

resource "aws_lambda_function" "api_lambda" {
  function_name = "youtube-service-5"
  role          = data.aws_iam_role.existing_lambda_role.arn

  package_type = "Image"
  image_uri    = "${data.aws_ecr_image.latest_image.image_uri}"

  environment {
    variables = {
      LOGGING_BUCKET_NAME = var.LOGGING_BUCKET_NAME
      LOGGING_BUCKET_KEY = var.LOGGING_BUCKET_KEY
      LANDING_BUCKET = var.LANDING_BUCKET
      YOUTUBE_BUCKET_KEY = var.YOUTUBE_BUCKET_KEY
      TITLE_BUCKET_KEY = var.TITLE_BUCKET_KEY
      CLIENT_ID = var.CLIENT_ID
      CLIENT_SECRET = var.CLIENT_SECRET
      AUTH_URI = var.AUTH_URI
      TOKEN_URI = var.TOKEN_URI
      AUTH_PROVIDER_CERT_URL = var.AUTH_PROVIDER_CERT_URL
      REDIRECT_URI = var.REDIRECT_URI
    }
  }

  timeout = 900 #Adjust the timeout of the function IN SECONDS
  memory_size = 512 #Adjust the Memory of the function

}

resource "aws_lambda_function_url" "lambda_url" {
  function_name = aws_lambda_function.api_lambda.function_name #Gives the AWS Lambda function a URL for us to trigger
  authorization_type = "NONE"
}

# Grant permission for youtube-job-verification to invoke youtube-service-3
resource "aws_lambda_permission" "allow_invocation_from_youtube_job_verification" {
  statement_id  = "AllowInvocationFromYoutubeJobVerification"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_lambda.function_name
  principal     = "lambda.amazonaws.com"
  source_arn    = data.aws_iam_role.existing_lambda_role.arn # ARN of the IAM role of youtube-job-verification
}

