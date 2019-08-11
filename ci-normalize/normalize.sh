#!/usr/bin/env bash

##
## functions used to normalize the environment variables
##

##
## script to normalize environment variables
##

# auto detect ci environment
# - azure devops pipeline
if [ -n "${ENDPOINT_URL_SYSTEMVSSCONNECTION+set}" ]; then
    echo "-> azure devops pipeline detected, normalizing ..."

    # common
    export CI=true

    # build system
    export NCI_BUILD_SYSTEM=azure
    export NCI_BUILD_SYSTEM_VERSION=$AGENT_VERSION
    export NCI_BUILD_ID=$BUILD_BUILDNUMBER
    export NCI_BUILD_ARCH=$AGENT_OSARCHITECTURE
    export NCI_BUILD_WORKER_ID=$AGENT_MACHINENAME

    export NCI_TRIGGERED_BY=$BUILD_BUILDNUMBER
    
    # repository
    export NCI_REPOSITORY_NAME=$(echo $BUILD_REPOSITORY_NAME | awk -F'/' ' { print $(NF) } ')
    export NCI_REPOSITORY_PATH=$BUILD_REPOSITORY_NAME
    export NCI_REPOSITORY_URL=$BUILD_REPOSITORY_URI

    # repository configuration
    export NCI_REPOSITORY_GIT_CLEAN=$BUILD_REPOSITORY_CLEAN
    export NCI_REPOSITORY_GIT_SUBMODULECHECKOUT=$BUILD_REPOSITORY_GIT_SUBMODULECHECKOUT

    # scm information
    export NCI_SCM_TYPE=git
    export NCI_SCM_BRANCH=$BUILD_SOURCEBRANCHNAME

    # ci script
    export NCI_STAGE=$SYSTEM_STAGENAME
    export NCI_JOB=$AGENT_JOBNAME
    export NCI_JOB_DISPLAYNAME=$SYSTEM_TASKDISPLAYNAME

    # BUILD_SOURCEBRANCH=refs/heads/master

    # SYSTEM_TEAMFOUNDATIONCOLLECTIONURI=https://heuer.visualstudio.com/
    # SYSTEM_TASKDEFINITIONSURI=https://heuer.visualstudio.com/
    # BUILD_QUEUEDBY=GitHub
    # SYSTEM_COLLECTIONURI=https://heuer.visualstudio.com/
    # SYSTEM_HOSTTYPE=build
    # SYSTEM_JOBPARALLELISMTAG=Public
    # BUILD_STAGINGDIRECTORY=/home/vsts/work/1/a
    # SYSTEM_WORKFOLDER=/home/vsts/work
    # 
    # BUILD_SOURCEVERSIONAUTHOR=Philipp Heuer
    # BUILD_REQUESTEDFOREMAIL=philipp.heuer@outlook.com
    # SYSTEM_DEFINITIONNAME=PhilippHeuer.azure-pipeline-test
    # BUILD_REPOSITORY_CLEAN=False
    # AGENT_TEMPDIRECTORY=/home/vsts/work/_temp
    # BUILD_REPOSITORY_PROVIDER=GitHub
    # USER=vsts
    # SYSTEM_JOBIDENTIFIER=Build.Build.__default
    # SYSTEM_TEAMFOUNDATIONSERVERURI=https://heuer.visualstudio.com/
    # TF_BUILD=True
    # BUILD_QUEUEDBYID=271ebd76-ab97-4f2c-b79e-e90b0bf28f01
    # AZURE_HTTP_USER_AGENT=VSTS_8c7f0be9-cf3c-4627-9df8-fa7d1cb80b37_build_1_0
    # SYSTEM_TASKDISPLAYNAME=CmdLine
    # SYSTEM_STAGENAME=Build
    # AGENT_DISABLELOGPLUGIN_TESTRESULTLOGPLUGIN=false
    # VSTS_PROCESS_LOOKUP_ID=vsts_11e7c50d-9a0f-47a0-861c-9b76c3fac285
    # AGENT_ROOTDIRECTORY=/home/vsts/work
    # SYSTEM_TEAMPROJECTID=d1b384a8-f33f-427d-86fd-f021826a54ea
    # SYSTEM_TEAMPROJECT=azure-test
    # BUILD_SOURCEVERSIONMESSAGE=feature: initial commit
    # BUILD_REPOSITORY_ID=PhilippHeuer/azure-pipeline-test
    # SYSTEM_JOBDISPLAYNAME=Build
    # agent.jobstatus=Succeeded
    # BUILD_REPOSITORY_LOCALPATH=/home/vsts/work/1/s
    # AGENT_BUILDDIRECTORY=/home/vsts/work/1
    # SYSTEM_PIPELINESTARTTIME=2019-08-11 15:51:44+00:00
    # SYSTEM=build
    # BUILD_REASON=IndividualCI
    # AGENT_OS=Linux
    # BUILD_SOURCESDIRECTORY=/home/vsts/work/1/s
    # DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    # PATH=/usr/share/rust/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
    # LEIN_JAR=/usr/local/lib/lein/self-installs/leiningen-2.9.1-standalone.jar
    # SYSTEM_ISSCHEDULED=False
    # PWD=/home/vsts/work/1/s
    # SYSTEM_PULLREQUEST_ISFORK=False
    # BUILD_BUILDURI=vstfs:///Build/Build/2
    # GOROOT_1_10_X64=/usr/local/go1.10
    # CONDA=/usr/share/miniconda
    # SYSTEM_DEFINITIONID=1
    # JAVA_HOME=/usr/lib/jvm/zulu-8-azure-amd64
    # SYSTEM_STAGEID=6884a131-87da-5381-61f3-d7acc3b91d76
    # AGENT_DISABLELOGPLUGIN_TESTFILEPUBLISHERPLUGIN=true
    # JAVA_HOME_12_X64=/usr/lib/jvm/zulu-12-azure-amd64
    # VCPKG_INSTALLATION_ROOT=/usr/local/share/vcpkg
    # JAVA_HOME_7_X64=/usr/lib/jvm/zulu-7-azure-amd64
    # SYSTEM_ENABLEACCESSTOKEN=SecretVariable
    # LANG=en_US.UTF-8
    # SYSTEM_TASKINSTANCENAME=CmdLine
    # SYSTEM_PHASEDISPLAYNAME=Build
    # SYSTEM_SERVERTYPE=Hosted
    # BUILD_REPOSITORY_NAME=PhilippHeuer/azure-pipeline-test
    # GOROOT_1_12_X64=/usr/local/go1.12
    # BUILD_REPOSITORY_URI=https://github.com/PhilippHeuer/azure-pipeline-test
    # PIPELINE_WORKSPACE=/home/vsts/work/1
    # BUILD_DEFINITIONNAME=PhilippHeuer.azure-pipeline-test
    # AGENT_WORKFOLDER=/home/vsts/work
    # BUILD_REQUESTEDFOR=Philipp Heuer
    # SYSTEM_JOBNAME=__default
    # SYSTEM_TIMELINEID=09329e49-5b9d-4e2d-93a9-ad3222919044
    # SYSTEM_ARTIFACTSDIRECTORY=/home/vsts/work/1/a
    # SHLVL=1
    # AGENT_ID=5
    # BOOST_ROOT_1_69_0=/usr/local/share/boost/1.69.0
    # HOME=/home/vsts
    # AGENT_RETAINDEFAULTENCODING=false
    # SYSTEM_JOBPOSITIONINPHASE=1
    # BUILD_REQUESTEDFORID=daed2ec0-0b40-4031-b5b4-d5d1a9356542
    # BUILD_BINARIESDIRECTORY=/home/vsts/work/1/b
    # BUILD_ARTIFACTSTAGINGDIRECTORY=/home/vsts/work/1/a
    # BUILD_BUILDID=2
    # SYSTEM_TASKINSTANCEID=45862c6e-83c5-515f-73e2-e7009eff9f9b
    # BUILD_SOURCEVERSION=1d6b19e862fdfa6a72de78978a605802d0d40667
    # SYSTEM_DEFAULTWORKINGDIRECTORY=/home/vsts/work/1/s
    # SYSTEM_JOBID=3dc8fd7e-4368-5a92-293e-d53cefc8c4b3
    # SYSTEM_TOTALJOBSINPHASE=1
    # SYSTEM_STAGEDISPLAYNAME=Build image
    # TASK_DISPLAYNAME=CmdLine
    # AGENT_JOBSTATUS=Succeeded
    # ENDPOINT_URL_SYSTEMVSSCONNECTION=https://heuer.visualstudio.com/
    # SYSTEM_PHASENAME=Build
    # BUILD_CONTAINERID=3045089
# - azure devops pipeline
elif [ -n "${GITLAB_CI+set}" ]; then
    echo "-> gitlab ci pipeline detected, normalizing ..."

    # common
    export CI=true

    # build system
    export NCI_BUILD_SYSTEM=gitlab-ci
    export NCI_BUILD_ID=$CI_PIPELINE_ID
# - jenkins pipeline
elif [ -n "${JENKINS_URL+set}" ]; then
    echo "-> jenkins pipeline detected, normalizing ..."

    # common
    export CI=true

    # build system
    export NCI_BUILD_SYSTEM=jenkins
fi
