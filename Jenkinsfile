pipeline{
    agent{ label 'AGENT-1'}
    options{
        ansiColor('xterm')
    }
    parameters{
        string(name: 'version', defaultValue: '1.0.1', description: 'which version to deploy')
        string(name: 'environment', defaultValue: 'dev', description: 'which environment to deploy')

    }
    stages{
        stage('Deploy'){
            steps{
                echo "Deploying..."
                echo "version from params: ${params.version}"
            }
        }
        stage('Init'){
            steps{
                sh """
                cd terraform
                terraform init -backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('Plan'){
            steps{
                 sh """
                cd terraform
                terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -var="env=${params.environment}"
                """
            }
        }

        stage('approve') {
            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                }
            }
            steps {
                echo "Hello, ${PERSON}, nice to meet you."
            }
        }
        stage('apply'){
            steps{
                 sh """
                cd terraform
                terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -var="env=${params.environment}" -auto-approve
                """
            }
        }
    }
    post{
        always{
            echo 'cleaning up workspace'
            // deleteDir()
        }
    }
    
}