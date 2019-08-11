# Pipeline

## CI Normalize

A script that detects the continuous integration system and normalizes all variables.
All normalized ci variables will be made available as `NCI_`, so make sure your scripts only depend on those variables to make them work with any continuous integration system.

## Azure DevOps Pipelines

- [Predefined Variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml#agent-variables)
- [Templates](https://github.com/microsoft/azure-pipelines-yaml/tree/master/templates)

## GitLab CI

- [Predefined Variables](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)

## Jenkins

- [Predefined Variables](https://wiki.jenkins.io/display/JENKINS/Building+a+software+project)
