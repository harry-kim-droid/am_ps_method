# Pilot Test Plan

Use this file as the first test pull request for the Codex review workflow.

## Goal

Confirm that the GitHub Actions workflow can:

- run on a pull request
- load the Codex PR review prompt
- produce a concise review
- post the final message back to the pull request

## Manual Checks

Before using this with a customer repository:

- Confirm `OPENAI_API_KEY` exists in GitHub Actions secrets.
- Open a small pull request.
- Check whether `Codex PR Review` completes.
- Confirm the PR comment is useful and not too noisy.
- Tune `.github/codex/prompts/pr-review.md` if the output is too broad.

## Success Criteria

The pilot workflow is ready when one test pull request receives a useful Codex review comment and the weekly report workflow can generate a downloadable artifact.
