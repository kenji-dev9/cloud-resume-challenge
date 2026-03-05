import json
import boto3
from botocore.exceptions import ClientError

# 1. Inicializamos el acceso a DynamoDB
dynamodb = boto3.resource('dynamodb')
# Usamos el nombre exacto que definiste en tu Terraform
table = dynamodb.Table('VisitasTabla')


def lambda_handler(event, context):
    try:
        # 2. Intentamos actualizar el contador en la tabla
        # Si el ID '1' no existe, lo crea. Si existe, le suma 1 a 'cantidad'
        response = table.update_item(
            Key={'id': '1'},
            UpdateExpression='ADD cantidad :inc',
            ExpressionAttributeValues={':inc': 1},
            ReturnValues="UPDATED_NEW"
        )

        # Extraemos el nuevo valor del contador
        visitas = response['Attributes']['cantidad']

        # 3. Respuesta exitosa con cabeceras de seguridad (CORS)
        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*',  # Permite que tu web en S3 lo llame
                'Access-Control-Allow-Methods': 'GET',
                'Content-Type': 'application/json'
            },
            'body': json.dumps({'count': int(visitas)})
        }

    except ClientError as e:
        print(f"Error de base de datos: {e.response['Error']['Message']}")
        return {
            'statusCode': 500,
            'body': json.dumps('Error interno al procesar la visita')
        }
