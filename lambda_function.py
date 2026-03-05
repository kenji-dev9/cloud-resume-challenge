import json


def lambda_handler(event, context):
    # En el futuro, aquí conectaremos con DynamoDB
    print("Log: El contador de visitas ha sido llamado.")

    return {
        'statusCode': 200,
        'headers': {
            # Importante para que tu web pueda llamar a la API
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json'
        },
        # Por ahora devolvemos un 1 estático
        'body': json.dumps({'visitas': 1})
    }
