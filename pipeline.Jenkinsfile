pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    // stage('Build and Test') {
    //   steps {
    //     // Set up Flutter environment (adjust paths as needed)
    //     sh 'export PATH=$PATH:/home/ubuntu/snap/flutter/common/flutter/bin'
    //     sh 'flutter doctor'

    //     // Build Flutter project
    //      dir('Bus-Tracking-system/src/bus_tracking_system/') {
    //       sh 'flutter build apk'
    //     }

    //     // Run tests
    //     sh 'flutter test'
    //   }
    // }

    stage('Publish to Nexus') {
      steps {
        // Publish artifacts to Nexus
        nexusArtifactUploader(
          nexusVersion: 'nexus3',
          protocol: 'http',
          nexusUrl: 'http://localhost:8081/repository/Bus-Tracking-Application/',
          groupId: 'com.example',
          version: '1.0.0',
          repository: 'Bus-Tracking-Application',
          file: 'Bus-Tracking-system/src/bus_tracking_system/build/app/outputs/flutter-apk/app-release.apk',
          credentialsId: 'nexus-credentials'
        )
      }
    }

    // stage('Deploy to Staging') {
    //   steps {
    //     // Deploy to staging environment
    //     sh 'flutter deploy staging'
    //   }
    // }

    // stage('Deploy to Production') {
    //   steps {
    //     // Deploy to production environment
    //     sh 'flutter deploy production'
    //   }
    // }

    // stage('Post-Deployment Test') {
    //   steps {
    //     // Run post-deployment tests
    //     sh 'flutter test_integration'
    //   }
    }
  }
  

  post {
    always {
      // Archive artifacts
      archiveArtifacts 'build/app/outputs/flutter-apk/*.apk'
    }

    success {
      // Send email notification on success
      emailext (
        to: 'aakshitasingh786@gmail.com',
        subject: 'Build Successful: Bus Tracking System',
        body: 'The Bus Tracking System build and deployment were successful.'
      )
    }

    failure {
      // Send email notification on failure
      emailext (
        to: 'aakshitasingh786@gmail.com',
        subject: 'Build Failed: Bus Tracking System',
        body: 'The Bus Tracking System build and deployment failed. Please check the Jenkins logs for details.'
      )
    }
  }

//   // Trigger the pipeline when code is pushed to the main branch
//   triggers {
//     scm('*/5 * * * *') // Poll SCM every 5 minutes
//   }