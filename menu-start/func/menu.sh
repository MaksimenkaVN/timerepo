#!/usr/bin/env bash

menu_env() {
    printf "%b" "${line}\n"\
    "${bpur}Select action:${rst}\n"\
    "${line}\n"\
    "${bylw}1${rst}) ${wht}Get Security Variables (password and key)${rst}\n"\
    "${bylw}2${rst}) ${wht}Get a repository (GitHub)${rst}\n"\
    "${bylw}3${rst}) ${wht}Deploy Infrastructure (Terraform)${rst}\n"\
    "${bylw}4${rst}) ${wht}Infrastructure preparation (Ansible)${rst}\n"\
    "${bylw}5${rst}) ${wht}Сluster deployment Prod (Kubernetes)${rst}\n"\
    "${bylw}6${rst}) ${wht}Сluster deployment Dev (Kubernetes)${rst}\n"\
    "${bylw}7${rst}) ${wht}Launching the Monitoring Environment (Prometeus)${rst}\n"\
    "${bylw}8${rst}) ${wht}Checking the health of all services (ping & ports & web & notifications)${rst}\n"\
    "${line}\n"\
    "${bylw}Q${rst}) ${red}Exit${rst}\n"
    while :; do
        echo
        read -rsN1 -p"${ylw}Your choice?${rst} " y
        case $y in
            1)
                echo "${wht}pull security variables${rst}"
                Sec
                # deploy dev
                break
            ;;
            2)
                echo "${wht}Get a repository (GitHub)${rst}"
                Git-dir-pull
                break
            ;;
            3)
                echo "${wht}Deploy Infrastructure (Terraform)${rst}"
                terra-vmware
                break
            ;;
            4)
                echo "${wht}Infrastructure preparation (Ansible)${rst}"
                Ansible-preparation
                break
            ;;
            5)
                echo "${wht}Сluster deployment Prod (Kubernetes)${rst}"
                Kubernet-Prod
                break
            ;;
            6)
                echo "${wht}Сluster deployment Dev (Kubernetes)${rst}"
                Kubernet-Dev
                break
            ;;
            7)
                echo "${wht}Launching the Monitoring Environment (Prometeus)${rst}"
                monitor
                break
            ;;
            8)
                echo "${wht}Checking the health of all services (ping & ports & web & notifications${rst}"
                ping-test
                break
            ;;
            q|Q)
                echo "${wht}Quiting...${rst}"
                exit 0
            ;;
            *)
                echo "${red}Wrong! Try again?${rst}"
            ;;
        esac
    done
}