# LibOps Platform Overview

LibOps helps teams run and maintain application sites from a hosted dashboard. The platform coordinates GitHub repositories, cloud infrastructure, site controllers, and customer-owned secrets so changes can move from a repository to a running site with clear audit trails.

LibOps serves GLAM institutions (Galleries, Libraries, Archives, and Museums), colleges, and universities in the United States and Canada.

The company mission is to grow open-source adoption by helping institutions handle the technical work around running OSS. LibOps standardizes operations and local customization so institutions can stay closer to the projects they depend on.

## What Customers Should Know

- Dashboard actions use your logged-in session. Assistant and task actions do not accept a pasted Authorization header in place of your browser session.
- Deployment and automation logs are stored for visibility, but secret-shaped values such as bearer tokens, API keys, Vault tokens, session cookies, and passwords are redacted before persistence.
- Site controllers run in your project to apply SSH keys, secrets, firewall rules, and deployments for the sites you manage.
- GitHub integration is used for template repositories, pull requests, and deployment events. LibOps Managed sites use private repositories in a LibOps-managed GitHub organization; customer-owned private repositories require the LibOps GitHub App installation flow.

## Technical Summary

- API and dashboard traffic uses ConnectRPC JSON behind the LibOps API.
- Background workers share the same MariaDB task and event schema as the API.
- The control plane schedules Terraform runner jobs for infrastructure changes and forwards site reconciliation requests through Controller Ingress.
- Site controller deployments are constrained to LibOps-managed deployment directories and validated command arguments.
- Customer secrets live in customer Vault scopes where configured; API-owned operational secrets live in the LibOps API Vault.

## Support

Use your LibOps dashboard for project and site status. Include the organization, project, site name, and approximate time of the issue when contacting support so logs can be correlated without sharing secrets.
