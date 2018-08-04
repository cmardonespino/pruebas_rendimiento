# Pruebas de rendimiento
## Propósito
El siguiente proyecto tiene como objetivo la ejecución de pruebas de performance automatizadas.
Para la ejecución automatizada de las pruebas, se utilizó Jenkins para gatillar procesos o stages que permiten desde la ejecución hasta el despliegue de información del test realizado.
## Herramientas utilizadas
Para esto, se utilizaron las herramientas:

* [Taurus](https://gettaurus.org/)
* [Jenkins](https://jenkins.io/)
* [JMeter](https://jmeter.apache.org/)
* [Blazemeter](https://www.blazemeter.com/)

## HOWTO
Las dependencias necesarias que se deben tener instaladas en la máquina de Jenkins son:

* python 3.x+
* pip 10.x+
* taurus

Moficar el Jenkinsfile y en las variables API_KEY_ID & API_KEY_SECRET del metodo ejecutarTaurus(), se deben ingresar las credenciales generadas a partir de su cuenta en Blazemeter.

## ¿Como funciona?

Las etapas definidas en el pipeline para las pruebas de performance, en resumen es capturar los archivos yaml (taurus) y jmx (jmeter) de este repositorio, correspondiente a la carpeta [test](/test) para luego ser ejecutados permitiendo asi enviar los resultados a Blazemeter para así poder visualizar de manera gráfica y detallada el resultado del test realizado. Luego del test finalizado, la carpeta generada por Taurus se corta y copia el contenido en una máquina Windows Server para el respaldo de los test realizados. Finalmente se limpia la máquina donde está montado Jenkins.

![alt text](https://github.com/cmardonespino/pruebas_rendimiento/tree/viajes/imgs/img1.jpg)

## IMPORTANTE
Los archivos yaml y jmx utilizados para las pruebas de performance se encuentran ubicadas en la rama **viajes**.

**Proyecto en desarrollo**