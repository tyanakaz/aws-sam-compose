def lambda_handler(event, context):
 
    status_code = 200
    body = 'hello'
    return {
        "statusCode": status_code,
        "body": body
    }

