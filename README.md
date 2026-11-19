# .github

조직 전체 레포에 적용되는 기본 이슈·PR 템플릿과 라벨 목록.

| 경로 | 내용 |
|---|---|
| `.github/ISSUE_TEMPLATE/` | 이슈 템플릿 (feat, fix, docs, 작업). 빈 이슈는 막아둠 |
| `.github/pull_request_template.md` | PR 템플릿 |
| `labels.tsv` | 라벨 목록 (이름, 색, 설명) |
| `scripts/sync-labels.sh` | 라벨을 레포에 적용 |

- 템플릿은 자기 템플릿이 없는 레포에 자동 적용된다. 이 레포는 GitHub 규칙상 public이어야 한다.
- 라벨은 자동 적용되지 않는다. 새 레포를 만들면 스크립트를 실행한다:

```bash
scripts/sync-labels.sh OWNER/REPO --prune   # --prune: 목록에 없는 라벨(GitHub 기본 라벨 등) 삭제
```

작업 방식 전체는 docs 레포의 `01-tech/git-workflow.md` 참고.
