import boto3
import os

# Configuration
SOURCE_BUCKET_NAME = "greeting-app-dev-source-bucket1234"  # Replace with your source bucket name
PHOTOS_DIRECTORY = "./photos"  # Directory containing photos to upload

# Initialize S3 client
s3_client = boto3.client("s3")

def upload_photos_to_s3(bucket_name, directory):
    """
    Uploads all files from a local directory to an S3 bucket inside a folder named 'photos'.
    """
    if not os.path.exists(directory):
        print(f"Directory '{directory}' does not exist.")
        return

    for root, _, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            s3_key = f"photos/{os.path.relpath(file_path, directory)}"  # Add 'photos/' prefix
            try:
                print(f"Uploading {file_path} to s3://{bucket_name}/{s3_key}...")
                s3_client.upload_file(file_path, bucket_name, s3_key)
                print(f"Uploaded {file_path} successfully.")
            except Exception as e:
                print(f"Failed to upload {file_path}: {e}")

if __name__ == "__main__": 
    upload_photos_to_s3(SOURCE_BUCKET_NAME, PHOTOS_DIRECTORY)