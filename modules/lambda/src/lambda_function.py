import json
import boto3
import logging
from utils.card_generator import generate_card, format_card  # Import both functions

s3_client = boto3.client('s3')
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info(f"Received event: {json.dumps(event)}")
    
    # Parse employee_ids from the event body
    try:
        body = json.loads(event.get("body", "{}"))  # Parse the body as JSON
        employee_ids = body.get("employee_ids", [])
    except Exception as e:
        logger.error(f"Error parsing event body: {str(e)}")
        return {
            "statusCode": 400,
            "body": json.dumps("Invalid request payload")
        }

    if not employee_ids:
        return {
            "statusCode": 400,
            "body": json.dumps("No employee IDs provided")
        }

    source_bucket = 'greeting-app-dev-source-bucket1234'
    target_bucket = 'greeting-app-dev-target-bucket1234'
    greeting_cards = []

    for employee_id in employee_ids:
        photo_key = f'photos/{employee_id}.jpg'
        logger.info(f"Processing employee ID: {employee_id}, photo key: {photo_key}")
        try:
            # Attempt to retrieve the photo from the source bucket
            photo_object = s3_client.get_object(Bucket=source_bucket, Key=photo_key)
            photo_data = photo_object['Body'].read()
            
            # Create a dictionary with the required keys for generate_card
            employee_photo_data = {
                "photo_url": f"s3://{source_bucket}/{photo_key}",  # URL to the photo
                "name": f"Employee {employee_id}"  # Placeholder name
            }
            
            # Generate the greeting card
            card = generate_card(employee_photo_data)
            formatted_card = format_card(card)  # Format the card for storage or display
            
            # Upload the formatted card to the target bucket
            card_key = f'greeting_cards/{employee_id}_card.txt'
            s3_client.put_object(Bucket=target_bucket, Key=card_key, Body=formatted_card)
            greeting_cards.append(card_key)
            logger.info(f"Greeting card uploaded: {card_key}")
        except s3_client.exceptions.NoSuchKey:
            logger.warning(f"Photo for employee ID {employee_id} not found in source bucket.")
            continue
        except Exception as e:
            logger.error(f"Error processing employee ID {employee_id}: {str(e)}")
            return {
                'statusCode': 500,
                'body': json.dumps(f'Error processing employee ID {employee_id}: {str(e)}')
            }

    return {
        'statusCode': 200,
        'body': json.dumps({'greeting_cards': greeting_cards})
    }