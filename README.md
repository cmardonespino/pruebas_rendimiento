# Pruebas de rendimiento
## Propósito
El siguiente proyecto tiene como objetivo la ejecución de pruebas de performance automatizadas para microservicios.
Para la ejecución automatizada de las pruebas, se utilizó Jenkins para gatillar procesos o stages que permiten desde la ejecución hasta el despliegue de información del test realizado.
## Herramientas utilizadas
Para medir el rendimiento, se utilizaronlas siguientes herramientas:
* [Taurus](https://gettaurus.org/)
* [Jenkins](https://jenkins.io/)
* [JMeter](https://jmeter.apache.org/)
* [Blazemeter](https://www.blazemeter.com/)

### Requisitos necesarios
* [docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)


## HOWTO
Para su ejecución, una vez clonado el repositorio, dentro del directorio del mini-proyecto, debemos cambiarnos a la rama `viajes`

* `git checkout viajes`

Una vez en la rama `viajes`, ejecutar los siguientes comandos en su shell:

* `sudo chmod +x run-env.sh`
* `make run`

Lo anterior le permitirá crear una imágen y posteriormente un contenedor de Jenkins el cual esta montado desde un Ubuntu, en el cual se instalan todas las dependencias necesarias para las pruebas de performance, las cuales son:

* python 3.x+
* pip 10.x+
* taurus

Además, con lo anterior también permitirá crear una carpeta dentro del mini-proyecto llamada `jenkins`. La razón de crear esta carpeta es debido a que al crear el contenedor, todos los plugin que usted descargue, todos los Jobs que usted cree, serán respaldados en su máquina local en el directorio `jenkins`.
Para acceder a su Jenkins, se debe dirigir a su browser favorito e ingresar en la URL

* `http://localhost:7990`

Posterior a lo anterior, Jenkins le solicitará una Key, la cual se encuentra en el directorio: `/var/jenkins_home/`


Moficar el Jenkinsfile y en las variables API_KEY_ID & API_KEY_SECRET del metodo ejecutarTaurus(), se deben ingresar las credenciales generadas a partir de su cuenta en Blazemeter.

## ¿Como funciona?

Las etapas definidas en el pipeline para las pruebas de performance, en resumen es capturar los archivos yaml (taurus) y jmx (jmeter) de este repositorio, correspondiente a la carpeta [test](/test) para luego ser ejecutados permitiendo asi enviar los resultados a Blazemeter para así poder visualizar de manera gráfica y detallada el resultado del test realizado. Luego del test finalizado, la carpeta generada por Taurus se corta y copia el contenido en una máquina Windows Server para el respaldo de los test realizados. Finalmente se limpia la máquina donde está montado Jenkins.

## IMPORTANTE
Los archivos yaml y jmx utilizados para las pruebas de performance se encuentran ubicadas en la rama **viajes**.

**Proyecto en desarrollo**