#!/usr/bin/env python3
"""Validate customer Task Agent claims against the projected production catalog."""

import json
from pathlib import Path


def main() -> None:
    docs_dir = Path(__file__).resolve().parent.parent
    catalog = json.loads((docs_dir / "data" / "task-agent-catalog.json").read_text())
    model = catalog["models"][0]
    harness = catalog["harnesses"][0]

    if catalog["default_model"] != model["id"] or catalog["default_harness"] != harness["id"]:
        raise SystemExit("Task Agent catalog defaults must be supported entries")
    if len(catalog["models"]) != 1 or len(catalog["harnesses"]) != 1:
        raise SystemExit("update the customer runtime disclosure before expanding the production catalog")

    workflow = (docs_dir / "platform" / "coding-agent-workflow.mdx").read_text()
    for required_import in [
        'import TaskAgentRuntime from "/snippets/task-agent-runtime.generated.mdx";',
        "<TaskAgentRuntime />",
    ]:
        if required_import not in workflow:
            raise SystemExit(f"platform/coding-agent-workflow.mdx is missing {required_import}")

    for relative in ["snippets/task-agent-runtime.generated.mdx", "snippets/task-agent.mdx"]:
        content = (docs_dir / relative).read_text()
        required = [
            f"`{model['id']}`",
            f"`{model['upstream_model']}`",
            f"`{harness['id']}`",
            model["inference_provider"],
        ]
        if relative == "snippets/task-agent-runtime.generated.mdx":
            required.extend([f"`{harness['image']}`", model["gateway_upstream_url"]])
        missing = [value for value in required if value not in content]
        if missing:
            raise SystemExit(f"{relative} is missing catalog claims: {', '.join(missing)}")
        for unsupported in ["kimi-k2.6", "`claude`", "`pi`", "`opencode`", "`gemini`"]:
            if unsupported in content:
                raise SystemExit(f"{relative} advertises unsupported runtime {unsupported}")
        if "does not host model weights or perform inference" not in content and "not a model host" not in content:
            raise SystemExit(f"{relative} must disclose the organization service's gateway-only boundary")


if __name__ == "__main__":
    main()
