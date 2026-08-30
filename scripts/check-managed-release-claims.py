#!/usr/bin/env python3
"""Keep managed-platform availability claims aligned with the release record."""

from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent


def read(relative: str) -> str:
    return (ROOT / relative).read_text()


def require(relative: str, expected: str) -> None:
    if expected not in read(relative):
        raise SystemExit(f"{relative} is missing the release boundary: {expected}")


def reject(relative: str, forbidden: str) -> None:
    if forbidden in read(relative):
        raise SystemExit(f"{relative} contains an unreleased managed claim: {forbidden}")


def main() -> None:
    require(
        "infrastructure/current-release-status.mdx",
        "No customer-facing managed capability is generally available in this candidate.",
    )
    for relative in [
        "index.mdx",
        "platform/github.mdx",
        "platform/managed-platform.mdx",
        "platform/slack.mdx",
    ]:
        require(relative, "/infrastructure/current-release-status")

    reject("platform/slack.mdx", "https://api.libops.io/integrations/slack/install")
    reject("quickstart.mdx", "Existing customers can select")

    require("docs.json", '"platform/security-boundary-summary"')
    for boundary in [
        "Identity and authorization",
        "Data movement and storage",
        "Secret handling",
        "Model-provider boundary",
        "Support and incident escalation",
        "/infrastructure/current-release-status",
    ]:
        require("platform/security-boundary-summary.mdx", boundary)

    print("Managed release claim validation passed.")


if __name__ == "__main__":
    main()
