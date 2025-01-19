# libops Sites

Here you will find all you need to know about creating and managing your site on libops.

## Create an account on libops

Before creating a site on libops you must first create an account. You can do so on [the libops registration page](https://www.libops.io/user/register). Please note: you must register on libops with a non-free email account. libops is only intended to be used by institutions needing Islandora hosting. If you need an exception for this, please [contact us](mailto:info@libops.io).

After you register, you will need to verify your email address. Check your email for an invitation from libops.

## Create your site

Now that you're registered and verified your email, you're ready to [create a site on libops](https://www.libops.io/site/create).

Visiting that URL will automatically create an Islandora 2 site for you and assign you as the owner.

You will also be invited as a contributor to the GitHub repository that houses the code for the site.

## Access your site

After you've created a site on libops you'll be able to view the URLs to all your site environments on [your libops account page](https://www.libops.io/user).

You can also find the URLs in your GitHub repository.

## Access your codebase

Currently GitHub access to your GitHub repository can only be managed from [the libops website](https://www.libops.io).

From there, you can add yourself and other GitHub users to your site by editing your site and adding their GitHub usernames.

![Demonstration of adding GitHub user to site](../assets/img/github.gif)

## Environments

By default, your libops site has a development and production environment.

You can make code changes in development, then deploy them to production once they're ready by creating a GitHub release.

You can read more about site environments in [the development docs](../development/index.md).

### Cold starts

For libops sites that are not on a paid plan, both the development and production environments will power off after a period of no activity. This can cause the initial page load to take up to 60 seconds to load while the environment comes online. After coming online, your site will be responsive as you'd expect.

Paid plans will **never** have cold starts for the production environment.
