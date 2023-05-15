# Cloud-TP3-Terraform
Trabajo Practico nro. 3 para la materia Cloud Computing 2023 1C - G3

## Módulos

### Módulo certificates

TODO
    
### Módulo dns

TODO

### Módulo cdn

TODO

### Modulo static_website

TODO
    
### Módulo vpc

TODO

### Módulo api_gw 

TODO

### Módulo api_gw_lambda_integration
    
TODO

## Componentes

- **Route53 + ACM:** Implementados en módulos dns y certificates propios.
- **S3 - frontend:** Módulo static_website, utilizamos el módulo externo: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest.
- **Cloudfront:** Implementado en módulo cdn propio.
- **Networking (VPC + SUBNETS):** Módulo vpc, utilizamos el módulo externo: https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest.
- **Lambda:** TODO
- **API Gateway:** TODO



## Funciones

- **cidrsubnet:** TODO
- **slice:** TODO
- **join:** TODO
- **filemd5:** TODO
- **sha1:** TODO
- **jsonencode:** TODO
- **fileset:** TODO
- **flatten:** TODO

EXPLICAR PORQ LOS USAMOS, QUE VENTAJAS NOS DA, QUE GANAMOS, NO PONER LA DESCRIPCION DE QUE HACE

## Meta-Argumentos

- **for_each:** TODO
- **depends_on:** TODO
- **lifecycle:** TODO

EXPLICAR PORQ LOS USAMOS, QUE VENTAJAS NOS DA, QUE GANAMOS, NO PONER LA DESCRIPCION DE QUE HACE

## Obteniendo el certificado para: smartpager.com.ar

TODO

## Rúbrica

|  Alumno                |  Legajo  |  Participación  |
|------------------------|----------|-----------------|
|  Gastón De Schant      |  60755   |       25%       |
|  Federico Gustavo Rojas|  60239   |       25%       |
|  Brittany Lin          |  60355   |       25%       |
|  Agustín Naso          |  60065   |       25%       |


1. Uso de módulos (uno custom-made y uno externo).
2. Uso de variables y outputs.
3. Uso de al menos cuatro (4) de las siguientes funciones.
4. Uso de al menos tres (3) siguientes meta-argumentos:
a. depends_on
b. for_each
c. count
d. lifecycle


5. El README deberá contener:
a. descripción de módulos utilizados
b. lista con los seis componentes a evaluar
c. descripción y referencia de funciones y meta-argumentos utilizados
d. diagrama de arquitectura (sólo las piezas elegidas)

Rúbrica de evaluación:
● Correcta utilización de los componentes requeridos.
● Nivel de dificultad de los componentes elegidos.
● Diseño y estructura del código
○ Naming conventions
○ Estructura y formato del proyecto
○ Principio de DRY (Don’t Repeat Yourself)
○ Parametrización de módulos



