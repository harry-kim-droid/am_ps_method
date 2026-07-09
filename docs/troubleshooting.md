# Troubleshooting

Use this guide when a customer pilot fails during GitHub Actions setup.

## GitHub Action Fails With `Quota exceeded`

Symptom:

```text
ERROR: Quota exceeded. Check your plan and billing details.
```

What it means:

- The GitHub workflow reached the Codex action.
- `OPENAI_API_KEY` was present enough for the proxy to start.
- The OpenAI project or organization behind that key does not currently have enough quota, billing, or usage allowance for the model request.

What to check:

- OpenAI billing is enabled.
- The API key belongs to the intended OpenAI project.
- The project has available credits or a valid payment method.
- The project usage limit has not been reached.
- The organization is not restricted by an admin policy.

Mitigation:

- Use `model: gpt-5.4-mini` for pilots and tests.
- Keep prompts short for the first validation run.
- Run only one test pull request at a time.
- Ask the customer to confirm billing before installation if they provide their own API key.

Do not keep retrying the workflow without fixing billing. Repeated retries will fail the same way and may create confusion in the PR.

## GitHub Action Stays Queued

Symptom:

- The run shows `Queued` for several minutes.

What to check:

- GitHub Actions status for runner delays.
- Repository Actions settings allow all actions and reusable workflows.
- The repository has available GitHub Actions minutes.
- The workflow runner label is available, usually `ubuntu-latest`.

Mitigation:

- Wait if GitHub Status reports hosted runner delays.
- Push a small empty commit to trigger a fresh run after the incident clears.
- Avoid changing workflow logic until the run actually starts.

## Proxy Server Info Error

Symptom:

```text
Failed to read server info from /home/runner/.codex/<run-id>.json
```

Likely cause:

- `openai-api-key` was missing, empty, invalid, or not available to the workflow.
- The Codex action could not start its Responses API proxy.

What to check:

- The GitHub Actions secret is named exactly `OPENAI_API_KEY`.
- The workflow references `${{ secrets.OPENAI_API_KEY }}`.
- The workflow is running in a context where secrets are available.
- The API key has not been deleted or rotated.

## No PR Comment Posted

Possible causes:

- The `codex` job failed before producing `final-message`.
- The `post-feedback` job did not run because the final message was empty.
- The workflow lacks `issues: write` or `pull-requests: write` permission in the feedback job.
- The PR came from an untrusted fork where secrets or write permissions are restricted.

What to check:

- The `codex` job logs.
- The `post-feedback` job logs.
- The workflow permissions block.
- Whether `needs.codex.outputs.final_message` is empty.

## Pilot Checklist After Fixing A Failure

1. Push one small commit to the test PR.
2. Confirm the `Codex PR Review` run starts.
3. Confirm the `codex` job completes.
4. Confirm the `post-feedback` job runs.
5. Confirm a useful PR comment appears.
6. Save the run URL and PR comment URL as pilot evidence.

After fixing OpenAI billing or quota, trigger a fresh run from the test branch:

```powershell
.\scripts\trigger-codex-review-test.ps1
```
