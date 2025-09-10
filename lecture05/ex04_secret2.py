import boto3

def upload_file(filename, bucket):
    AWS_ACCESS_KEY_ID = "AKIA1234567890ABCDEF"
    AWS_SECRET_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

    s3 = boto3.client(
        "s3",
        aws_access_key_id=AWS_ACCESS_KEY_ID,
        aws_secret_access_key=AWS_SECRET_KEY,
    )
    s3.upload_file(filename, bucket, filename)

if __name__ == "__main__":
    upload_file("report.pdf", "my-bucket")