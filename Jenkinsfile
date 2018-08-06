pipeline {
    agent any 
    stages {
        stage('Validar dependencias'){
            steps {
                validarDependencias()
            }
        }
        stage('Ejecución Taurus') {
            steps {
                ejecutarTaurus()
            }
        }
        stage('Comprimiendo output test') {
            steps {
                echo "hola"
                //comprimirOutputTest()
            }
        }
        stage('Moviendo resultado a Windows') {
            steps {
                echo "moviendo resultado a windows"
            }
        }
        stage('Limpieza maquina Linux') {
            steps {
                limpiezaMaquinaLindows()
            }
        }
    }
}

def validarDependencias() {
    //sh 'pip3.6 install --upgrade pip --user jenkins'
    //sh 'pip3.6 install --upgrade bzt --user jenkins'
    sh 'pip install --upgrade pip'
    sh 'pip install --upgrade bzt'
}

def ejecutarTaurus() {
    API_KEY_ID = '819e9a27df0d37279c0a7d2c'
    API_KEY_SECRET = '05ca56950e055dd82b5e921e1df01c54b2c320b097bf8e082aa54cdf37dc08b6fb300cfe'
    sh "cd test && bzt taurus_test.yaml -o modules.blazemeter.token='$API_KEY_ID:$API_KEY_SECRET' -report"
}

def limpiezaMaquinaLindows() {
    sh "cd test && rm -rf jmeter.log"
}

def comprimirOutputTest() {
    def currentDir = WORKSPACE
    echo $currentDir
    //def currentDir = new File(".").getAbsolutePath()
    //def currentDir = getClass().protectionDomain.codeSource.location.path
    echo "directorio actual: $scriptDir"
}
