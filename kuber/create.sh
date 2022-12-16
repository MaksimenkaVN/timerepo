#! /bin/env bash

envsubst < config.yaml | kind create cluster --config=-