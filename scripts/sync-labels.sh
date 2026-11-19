#!/usr/bin/env bash
# labels.tsv의 라벨을 대상 레포에 만들거나 갱신한다.
# 사용법: scripts/sync-labels.sh OWNER/REPO [--prune]
#   --prune: labels.tsv에 없는 라벨을 삭제한다 (GitHub 기본 라벨 정리용)
set -euo pipefail

repo="${1:?사용법: $0 OWNER/REPO [--prune]}"
prune="${2:-}"
labels_file="$(dirname "$0")/../labels.tsv"

declare -A keep
while IFS=$'\t' read -r name color desc; do
  [[ -z "$name" || "$name" == \#* ]] && continue
  gh label create "$name" --color "$color" --description "$desc" --force -R "$repo"
  keep["$name"]=1
done < "$labels_file"

if [[ "$prune" == "--prune" ]]; then
  gh label list -R "$repo" --limit 200 --json name --jq '.[].name' | while IFS= read -r name; do
    if [[ -z "${keep[$name]+x}" ]]; then
      gh label delete "$name" --yes -R "$repo"
    fi
  done
fi
