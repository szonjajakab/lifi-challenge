resource "aws_s3_bucket" "lifi_script_bucket" {
  bucket = "lifi-sandbox-script-bucket"

  tags = {
    Name        = "lifi-sandbox-script-bucket"
  }
}

resource "aws_s3_object" "script" {
  bucket = aws_s3_bucket.lifi_script_bucket.id
  key    = "k8s_setup.sh"
  source = "./k8s_setup.sh"
  etag   = filemd5("./k8s_setup.sh")
}