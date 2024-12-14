pipeline {
  agent any
  stages {
    stage('Platform Fastlanes') {
      steps {
        parallel(
          ios: {
//                    dir('ios') {
                        sh 'source ~/.zprofile && source ~/.zshenv && cd ios && bundle exec fastlane custom_lane'
  //                  }
          },
          android: {
    //                dir('android') {
                        sh 'source ~/.zprofile && source ~/.zshenv && cd android && bundle exec fastlane custom_lane'
      //              }
          }
        )
      }
    }
  }
}