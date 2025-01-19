# sitectl

[sitectl](https://github.com/libops/sitectl) is a useful utility to interact with your libops site.

## Install

### Prerequiste (gcloud)

`sitectl` requires Google Cloud's `gcloud` CLI to be installed and authenticated on the same machine you run `sitectl` commands from.

So before installing libops you must:

1. [Install the gcloud CLI](https://cloud.google.com/sdk/docs/install)
2. [Initialize the gcloud CLI](https://cloud.google.com/sdk/docs/initializing)
3. [Authenticate the gcloud CLI](https://cloud.google.com/sdk/docs/authorizing#auth-login) to Google Cloud

After `gcloud` is installed you can install `sitectl` using homebrew or a binary.

### Homebrew

You can install `sitectl` using homebrew

```
brew tap libops/homebrew https://github.com/libops/homebrew
brew install libops/homebrew/sitectl
```

### Download Binary

Instead of homebrew, you can download a binary for your system from [the latest release](https://github.com/libops/sitectl/releases/latest)

Then put the binary in a directory that is in your `$PATH`

## Usage

After installing the CLI, you can see the list of commands by running `sitectl --help`. The **`sitectl` should be ran from the root of your GitHub repository**. This is so the CLI can automatically read the name of your site without having to pass the `--site` flag to specify the name.

```
$ sitectl --help
Interact with your libops site

Usage:
  sitectl [command]

Available Commands:
  backup      Backup your libops environment
  completion  Generate the autocompletion script for the specified shell
  config-ssh  Populate ~/.ssh/config with libops development environment
  drush       Run drush commands on your libops environment
  get         Display information about your libops environment.
  help        Help about any command
  import      Import resources to your libops environment.
  sequelace   Connect to your libops database using Sequel Ace (Mac OS only)
  set         Set information on your libops environment.
  sync-db     Transfer the database from one environment to another

Flags:
  -e, --environment string   libops environment (default "development")
  -h, --help                 help for libops
  -p, --site string          libops project/site (default "YOUR-LIBOPS-SITE")
  -v, --version              version for libops

Use "sitectl [command] --help" for more information about a command.
```

## Default environment

Any command you run with `libops` will run against your development environment. This can be changed by passing the `-e` or `--environment` flag. e.g.

```
sitectl backup -e production
```

## Commands

### set developer

Use this command to add a developer to your libops site environments.

libops site environments and CLI commands are protected by a firewall and/or gcloud authentication. To provide access to a developer `sara@institution.edu` who works from two locations with IP addresses `1.2.3.4` and `5.6.7.8` you could run the command:

```
sitectl set developer \
  --google-account sara@institution.edu \
  --skip-pub-key \
  --ip 1.2.3.4/32 \
  --ip 5.6.7.8/32
git add libops.yml
git commit -m "Adding Sara"
git push origin development
```

If you happen to have her public SSH key on your computer, you could also set her up for SFTP access.

```
sitectl set developer \
  --google-account sara@institution.edu \
  --pub-key /path/to/sara/id_rsa.pub
```

Similarly, you could also set yourself up by running

```
sitectl set developer
```

That command will automatically read your gcloud authenticated email, SSH public key, and public IP address and add the information to `libops.yml`.

### drush

You can use `sitectl drush` to execute drush commands against your libops environment.

#### Reset super user password

```
sitectl -e production drush -- uli --uid 1
```

#### Clear the cache

You could clear the cache on your development environment by running

```
sitectl drush -- cr
```

### sequelace

On Mac OS with [Sequel Ace](https://sequel-ace.com/) installed, running `sitectl sequelace` will open a connection to your libops development environment database. You could connect to production similarly via

```
sitectl sequelace -e production
```

![Demonstration of sequelace command execution](../assets/img/sequelace.gif)

### get config

Running `sitectl get config` will run `drush cex` on your environment, download the contents of the config export, and save that export to your local checked out git repo. You could export your config from production and push the config with something like:

```
cd /path/to/your/libops/site
sitectl get config -e production
git add --all config
git commit -m "drush cex"
git push origin development
```

### get info

Running `sitectl get info` will return a JSON string containing connection information for different aspects of your libops environment:

```
sitectl get info | jq .
{
  "database": {
    "host": "mariadb",
    "name": "drupal",
    "port": 3306,
    "credentials": {
      "username": "root",
      "password": "***"
    }
  },
  "drupal": {
    "url": "https://site.domain"
  },
  "matomo": {
    "url": "https://site.domain/matomo/",
    "credentials": {
      "username": "***",
      "password": "***"
    }
  },
  "ssh": {
    "host": "10.1.2.255",
    "port": 1234,
    "credentials": {
      "username": "****"
    }
  }
}
```

### backup

Running `sitectl backup` will backup the database for your libops environment. For example you could backup the production database by running:

```
sitectl backup -e production
```

### import db

Running `sitectl import db` can get a SQL file on your local machine imported into a libops environment. For example, to import a SQL file called "drupal.sql" from your local machine to development you can run:

```
sitectl import db --file drupal.sql
```

### sync-db

Running `sitectl sync-db` can copy the database from one environment into another. For example, to import the production database into development you can run:

```
sitectl sync-db --source production --target development
```
