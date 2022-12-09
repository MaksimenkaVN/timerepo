#!/usr/bin/env bash

blk="$( echo -e '\033[0;30m' )" # Black
gry="$( echo -e '\033[0;90m' )" # Dark Gray
red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
ylw="$( echo -e '\033[0;33m' )" # Yellow
blu="$( echo -e '\033[0;34m' )" # Blue
pur="$( echo -e '\033[0;35m' )" # Purple
cyn="$( echo -e '\033[0;36m' )" # Cyan
wht="$( echo -e '\033[0;37m' )" # White
bgry="$( echo -e '\033[01;90m' )" # Bold Gray
bred="$( echo -e '\033[01;31m' )" # Bold Red
bgrn="$( echo -e '\033[01;32m' )" # Bold Green
bylw="$( echo -e '\033[01;33m' )" # Bold Yellow
bblu="$( echo -e '\033[01;34m' )" # Bold Blue
bpur="$( echo -e '\033[01;35m' )" # Bold Purple
bcyn="$( echo -e '\033[01;36m' )" # Bold Cyan
bwht="$( echo -e '\033[01;37m' )" # Bold White
rst="$( echo -e '\033[0m' )"    # Reset Color format

# Reducing names.
ok="${bgrn}OK${rst}"
fail="${bred}FAIL${rst}"
notfound="${bylw}NOT FOUND${rst}"
dots="................................................................................"
line="${wht}--------------------------------${rst}"
stop="${bred}Abnormal script stop!${rst}"
any="${bcyn}Press any key to continue...${rst}"
deploy="${bred}>${bylw}>${bgrn}>${bcyn}>${bblu}>${bpur}>${rst} ${bwht}${DEPLOY_TYPE}${rst} ${bpur}<${bblu}<${bcyn}<${bgrn}<${bylw}<${bred}<${rst}"
spacer="%.80s "

kube_deploy() {
    echo "--- Deploying: ${2}" >> "${LOGFILE}"
    printf "${spacer}" "Deploying: ${2} ${dots}"
    (envsubst < $3 | kubectl -n $1 apply -f - &>>"${LOGFILE}" && echo $ok || (echo -e $fail"\n"$line"\n"$stop; echo_log; exit 1)) || exit
}

Sec() {
    # printf "${spacer}" "pulling data"
    export CR_PAT=dckr_pat_xMxWDS-qMMViEEbpBcZw_jecitA    
}

Git-dir-pull() {
    git clone $TIMEREPOPATH
}

echo_log(){
    echo ${line}${bcyn}
    cat "${LOGFILE}" | tail -n 3
    echo ${rst} 
}