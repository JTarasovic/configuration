#!/bin/bash

clean () {
    old=$(git rev-parse --abbrev-ref HEAD);
    git checkout "${1:-master}" && git pull && git remote prune origin && git br -D "$old"
}

cf_validate() {
    aws cloudformation --profile default validate-template --template-body "file://$1" | jq '.'
}

node2instance() {
    kubectl get node "$1" -o jsonpath="{.spec.providerID}" | cut -d "/" -f 5
}

watch_url() {
    while :;
    do
        curl -s -o /dev/null -w "%{http_code} - %{size_download}\n" -k "$1";
        sleep "${2:-5}";
    done
}

build_kube_aliases() {
    seperator="${1:-""}"
    prefix="${2:-k}"

    [ -f "$HOME/.kube/config" ] || return 0
    command -v kubectl >/dev/null 2>&1 || return 0

    for context in $(kubectl config get-contexts -o name);
    do
        clean_ctx="$context"
        if [ "$seperator" = "" ]; then
            clean_ctx="$(echo "$context" | tr -d "-")"
        else
            clean_ctx="$(echo "$context" | tr "-" "$seperator")"
        fi

        alias_to_create="$(printf "%s%s%s" "$prefix" "$seperator" "$clean_ctx")"
        # shellcheck disable=SC2139
        alias "$alias_to_create=kubectl --context=$context "
    done
}

pods_ready() {
    namespace="$1"
    label_selector="$2"

    while IFS="|" read -r pod node statuses;
    do
        [[ "$statuses" =~ false ]] && echo "$pod in $namespace has unready containers on instance $node"
    done < <(kubectl -n "$namespace" get pod -l "$label_selector" -o jsonpath='{range .items[*]}{.metadata.name}|{.spec.nodeName}|{.status.containerStatuses[*].ready}{"\n"}{end}')
}


# this is bullshit
recursive_git_pull() {
    initial=$(pwd -P)
    cd "${1:-.}" || exit 1
    start=$(pwd -P)
    desired_branch=${2:-develop}

    echo Starting in "$start"
    for dir in "$start"/*/
    do
        cd "$dir" || break
        branch=$(git rev-parse --abbrev-ref HEAD)
        if [ "$branch" = "$desired_branch" ]; then
            if [ -z "$(git status --porcelain)" ]; then
                echo "$dir" is clean. Pulling.
                git pull
            else
                echo "$dir" is unclean. Skipping.
            fi
        else
            echo "$dir" not on "$desired_branch". Skipping.
        fi
        cd "$start" || break
    done
    cd "$initial" || exit 1
}
