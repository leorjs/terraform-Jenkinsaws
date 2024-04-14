# Despliegue de Servidor Jenkins en AWS con Terraform

![](./images/Arquitectura-terraformjenkinsAWS.svg)


## Background

La necesidad de automatizar el despliegue de infraestructura y aplicaciones es crucial para agilizar los ciclos de desarrollo de software. Jenkins, un servidor de automatización de código abierto, es ampliamente utilizado para este propósito. AWS, siendo un proveedor de servicios en la nube líder, ofrece una plataforma robusta y escalable para alojar servidores Jenkins. Terraform, por otro lado, proporciona una forma declarativa de definir y gestionar la infraestructura como código, facilitando así la reproducibilidad y la automatización de despliegues.

## Requerimientos

1. Una instancia EC2 `t2.micro` en AWS para alojar Jenkins, aprovechando el nivel gratuito de AWS.
2. Configuración de seguridad para permitir el acceso seguro al servidor Jenkins mediante HTTP en el puerto 8080.
3. Instalación y configuración automatizada de Jenkins en la instancia EC2 con un script .sh previamente creado.
4. Conectividad SSH para configuraciones adicionales, asegurando el acceso mediante un par de claves SSH.


## Método

El método incluirá la creación de archivos Terraform para:
1. Definir un proveedor de AWS.
2. Crear una instancia EC2 `t2.micro` en la región preferida, considerando el uso dentro del nivel gratuito.
3. Configurar un grupo de seguridad que:
   a. Permita el tráfico HTTP entrante en el puerto 8080 para el acceso a Jenkins.
   b. Permita el tráfico SSH entrante en el puerto 22 para la conectividad administrativa.
4. Automatizar la instalación de Jenkins en la instancia EC2 mediante scripts de inicio de usuario (user data).
5. Generar y utilizar un par de claves SSH para la autenticación.

### Previo a la instalación de la infra
1.  Primero, necesitarás tener Terraform instalado en tu máquina. Link para la instalación [Install-Terraform](https://developer.hashicorp.com/terraform/install).
 
2.  Asegúrate de tener también configurado tu acceso a AWS, ya sea mediante el archivo ~/.aws/credentials o configurando las variables de entorno AWS_ACCESS_KEY_ID y AWS_SECRET_ACCESS_KEY.

``` Command
> Configuración conexión con AWS
> Command:  aws configure
```


Se debe agregar los permisos necesarios para el script de jenkins
> [!IMPORTANT]
> chmod +x install_jenkins.sh


## Comandos para crear la infraestructura

Inicializa Terraform para preparar tu entorno.
terraform init

Revisa el plan de Terraform para asegurarte de que los recursos a crear son los esperados.
terraform plan

Aplica la configuración de Terraform para crear los recursos en AWS.
terraform apply


## Conexión SSH
Para conectarte a tu instancia EC2:


ssh -i /path/to/your/private/key.pem ec2-user@<tu_ip_ec2>
Cambia /path/to/your/private/key.pem por la ruta a tu clave privada y <tu_ip_ec2> por la dirección IP de tu instancia EC2.

Con estos pasos, has configurado y desplegado un servidor Jenkins en AWS usando Terraform, siguiendo las mejores prácticas de escalabilidad y seguridad. ¿Hay algo más en lo que pueda asistirte con este despliegue?







<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.jenkins_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.jenkins_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.jenkins_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route_table.jenkins_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.jenkins_rta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.jenkins_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.jenkins_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.jenkins_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
