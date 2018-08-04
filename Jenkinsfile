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
    API_KEY_ID = ''
    API_KEY_SECRET = ''
    sh "cd test && bzt taurus_test.yaml -o modules.blazemeter.token='$API_KEY_ID:$API_KEY_SECRET' -report"
}

def limpiezaMaquinaLindows() {
    sh "cd test && rm -rf jmeter.log"
}

def comprimirOutputTest() {
    //def currentDir = WORKSPACE
    //echo $currentDir
    //def currentDir = new File(".").getAbsolutePath()
    //def currentDir = getClass().protectionDomain.codeSource.location.path
    //echo "directorio actual: $scriptDir"
}
