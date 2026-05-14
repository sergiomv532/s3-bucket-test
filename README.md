# 🛡️ AWS Secure S3 Bucket Terraform Module

Este repositorio contiene un módulo reutilizable de Terraform desarrollado por el equipo de **Platform Engineering**. Su propósito es estandarizar la creación de buckets de almacenamiento S3 en AWS, garantizando que todos los despliegues cumplan con las políticas de seguridad de la compañía desde el minuto cero (Secure by Default).

## ✨ Características y Controles de Seguridad Integrados

Al usar este módulo, ya no tienes que preocuparte por configurar reglas complejas de seguridad. El módulo impone automáticamente:
- 🔒 **Bloqueo de Acceso Público:** Garantiza que los datos no queden expuestos a Internet de forma accidental (Block Public Access).
- ⏪ **Versionamiento Habilitado:** Protege los objetos contra borrados accidentales o sobrescrituras no deseadas.
- 🔑 **Cifrado en Reposo (AES256):** Asegura que los datos almacenados estén encriptados nativamente usando las llaves de AWS KMS.

## 📂 Estructura del Repositorio

- `modules/secure-s3-bucket/`: Contiene el código fuente del módulo reutilizable.
- `examples/basic-s3/`: Contiene un ejemplo práctico de cómo un desarrollador debe llamar y usar este módulo.
- `.github/workflows/`: Contiene el pipeline de Integración Continua (CI) que valida la calidad y seguridad de la infraestructura.

## 🚀 ¿Cómo usar este módulo? (Guía para Desarrolladores)

Si eres un desarrollador buscando provisionar almacenamiento, solo necesitas invocar este módulo dentro de tu archivo de infraestructura (`main.tf`) y pasarle dos variables obligatorias: el nombre de tu bucket y el entorno de tu aplicación.

### Ejemplo de uso:

\`\`\`hcl
module "my_secure_bucket" {
  source = "github.com/tu-usuario/tu-repo/modules/secure-s3-bucket" # Cambiar por la URL final del repositorio

  bucket_name = "mis-archivos-app"
  environment = "qa"
  
  tags = {
    Team = "Frontend"
  }
}
\`\`\`

### Entradas (Variables)

| Nombre | Descripción | Tipo | Obligatorio |
|--------|-------------|------|:---:|
| `bucket_name` | El nombre identificador para el bucket. | `string` | **Sí** |
| `environment` | El entorno de despliegue (ej. `dev`, `qa`, `prod`). Se concatenará al nombre. | `string` | **Sí** |
| `tags` | Mapa de etiquetas para organizar y controlar costos. | `map(string)`| No |

### Salidas (Outputs)

| Nombre | Descripción |
|--------|-------------|
| `bucket_id` | El ID final del bucket creado (ej. `qa-mis-archivos-app`). Útil para referenciarlo en otros recursos. |
| `bucket_arn` | El Amazon Resource Name (ARN) del bucket. |

## 🛠️ Pipeline de Integración Continua (CI)

Para garantizar la fiabilidad del código, hemos configurado un pipeline automatizado a través de **GitHub Actions**. Este pipeline se dispara automáticamente cada vez que se abre un **Pull Request** hacia la rama `main`.

**¿Qué hace el pipeline?**
1. Comprueba que el código esté correctamente formateado (`terraform fmt`).
2. Valida la sintaxis del código de Terraform (`terraform validate`).
3. Ejecuta un **análisis de seguridad estático usando Checkov** para asegurar que no se introduzcan vulnerabilidades (ej. deshabilitar el cifrado) antes de hacer "merge" del código.

*Nota: Este pipeline no requiere credenciales de AWS ni incurre en costos, ya que no ejecuta la fase de aprovisionamiento (`terraform apply`).*