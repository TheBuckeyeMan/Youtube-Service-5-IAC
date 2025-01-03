variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "region" {
    description = "Desired Region"
    type = string
    default = "us-east-2"
}

variable "LOGGING_BUCKET_NAME" {
  description = "LOGGING_BUCKET_NAME"
  type = string
}
variable "LOGGING_BUCKET_KEY" {
  description = "LOGGING_BUCKET_KEY"
  type = string
}

variable "LANDING_BUCKET" {
  description = "LANDING_BUCKET"
  type = string
}

variable "YOUTUBE_BUCKET_KEY" {
  description = "YOUTUBE_BUCKET_KEY"
  type = string
}

variable "TITLE_BUCKET_KEY" {
  description = "TITLE_BUCKET_KEY"
  type = string
}

variable "CLIENT_ID" {
  description = "CLIENT_ID"
  type = string
}

variable "CLIENT_SECRET" {
  description = "CLIENT_SECRET"
  type = string
}

variable "AUTH_URI" {
  description = "AUTH_URI"
  type = string
}

variable "TOKEN_URI" {
  description = "TOKEN_URI"
  type = string
}

variable "AUTH_PROVIDER_CERT_URL" {
  description = "AUTH_PROVIDER_CERT_URL"
  type = string
}

variable "REDIRECT_URI" {
  description = "REDIRECT_URI"
  type = string
}

variable "YOUTUBE_REFRESH_TOKEN" {
  description = "YOUTUBE_REFRESH_TOKEN"
  type = string
}

variable "TAGS_BUCKET_KEY" {
  description = "TAGS_BUCKET_KEY"
  type = string
}