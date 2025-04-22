import json
import boto3
from unittest import TestCase
from unittest.mock import patch, MagicMock
from src.lambda_function import lambda_handler

class TestLambdaFunction(TestCase):

    @patch('src.lambda_function.boto3.client')
    def test_lambda_handler_success(self, mock_boto_client):
        # Arrange
        mock_s3 = MagicMock()
        mock_boto_client.return_value = mock_s3
        employee_ids = ['emp1', 'emp2']
        mock_s3.get_object.side_effect = [
            {'Body': json.dumps({'photo_data': 'photo1_data'})},
            {'Body': json.dumps({'photo_data': 'photo2_data'})}
        ]
        mock_s3.put_object.return_value = {}

        # Act
        response = lambda_handler({'employee_ids': employee_ids}, None)

        # Assert
        self.assertEqual(response['statusCode'], 200)
        self.assertIn('Greeting cards generated for employees: emp1, emp2', response['body'])
        mock_s3.get_object.assert_any_call(Bucket='source-bucket', Key='emp1')
        mock_s3.get_object.assert_any_call(Bucket='source-bucket', Key='emp2')
        mock_s3.put_object.assert_called()

    @patch('src.lambda_function.boto3.client')
    def test_lambda_handler_no_employee_ids(self, mock_boto_client):
        # Act
        response = lambda_handler({'employee_ids': []}, None)

        # Assert
        self.assertEqual(response['statusCode'], 400)
        self.assertEqual(response['body'], 'No employee IDs provided.')

    @patch('src.lambda_function.boto3.client')
    def test_lambda_handler_employee_not_found(self, mock_boto_client):
        # Arrange
        mock_s3 = MagicMock()
        mock_boto_client.return_value = mock_s3
        employee_ids = ['emp1']
        mock_s3.get_object.side_effect = Exception("Employee photo not found")

        # Act
        response = lambda_handler({'employee_ids': employee_ids}, None)

        # Assert
        self.assertEqual(response['statusCode'], 500)
        self.assertIn('Error retrieving photo for employee: emp1', response['body'])