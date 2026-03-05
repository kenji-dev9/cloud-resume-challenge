# Cloud Resume Challenge ☁️ - Por Matías Urrutia

Este es mi primer proyecto de infraestructura en la nube. Estoy construyendo un currículum interactivo que utiliza tecnologías **Serverless** para demostrar mis habilidades como futuro Cloud Architect.

## 🛠️ Tecnologías en uso:
* **Frontend:** HTML/CSS (Próximamente en AWS S3).
* **Backend:** Python (AWS Lambda).
* **Base de Datos:** NoSQL (Amazon DynamoDB).
* **CI/CD:** Git & GitHub.

## 🎓 Sobre mí
Soy Técnico de Nivel Superior en Computación e Informática del **CEDUC UCN**, con especialización en **Ciberseguridad**. Mi meta es diseñar arquitecturas seguras y escalables en la nube.

---
*Estado: Esperando verificación de cuenta AWS para el despliegue de infraestructura.*

## 🔒 Enfoque en Seguridad (DevSecOps)
Como especialista en ciberseguridad, he diseñado este despliegue siguiendo el **Principio de Mínimo Privilegio**:
* **Acceso Público Restringido:** Utilizo el recurso `aws_s3_bucket_public_access_block` en Terraform para prevenir fugas de datos accidentales.
* **Infraestructura como Código (IaC):** La configuración está versionada para permitir auditorías y evitar errores de configuración manual en la consola.
* **CORS Policy:** La función Lambda incluye cabeceras específicas para permitir únicamente peticiones autorizadas desde el frontend.