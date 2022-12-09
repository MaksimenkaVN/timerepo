#!/usr/bin/env bash

export DEPLOY_TYPE="timeApp"
export DEP_ENV="dev|prod"
export DEPLOYDATE=$(date +%Y%m%d-%H%M)
export TIMEREPOPATH="https://github.com/MaksimenkaVN/timerepo.git"
export CURL_TERRA_EXPAND="http://192.168.129.91:8080/job/Expand-Servers/"
export MAXAPI_JENKINS="1193de5d752a4422f8a93462f0e675a218"
export API_JENKINS_USER="Vasiliy"