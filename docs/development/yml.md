Better documentation coming soon. For now, here is an example structure of your libops YAML.

A file names `libops.yml` will exist in your GitHub repository. You will be able to edit the YAML file to configure different aspects of your libops environments.

```
version: 0.1

# PHP Version to use. Must be greater than or equal to 8.1
# And the MAJOR.MINOR release only
php: 8.2

# The CIDR notation for every source IP that can access your libops non-production environments over HTTPS
# Should be restricted to just IPs for your organization.
# Both IPv4 and IPv6 addresses are supported.
# Network mask (e.g. /24) must be greater than or equal to 16 for IPv4 and 120 for IPv6
https-firewall:
  # private IPs are just examples. Can be replaced (along with this comment)
  - 192.168.50.2/32
  - 192.168.100.0/24
  - 192.168.200.0/24

# The CIDR notation for every source IP that can SFTP into your libops non-production environments
# Should be restricted to just IPs for your organization. Ideally, just for machines that need access.
# Only IPv4 are supported for establishing SSH connections to your libops environment
ssh-firewall:
  # private IPs are just examples. Can be replaced (along with this comment)
  - 127.0.12.1/32
  - 192.168.100.1/32

# The CIDR notation for every IP Address that can not access any of your libops environments, including production
# This can be used to block malicious actors
# Both IPv4 and IPv6 addresses are supported.
# Network mask (e.g. /24) must be greater than or equal to 16 for IPv4 and 120 for IPv6
blocked-ips:
  # private IPs are just examples. Can be replaced (along with this comment)
  - 127.0.123.123/32
  - 192.168.255.100/32

# Google Cloud users that can make configuration changes to your libops environments (more than likely all developers on your site)
# Their IP addresses should be included in ssh-firewall and https-firewall
# joe and sarah are just examples - they can be replaced (along with this comment when they are replaced)
developers:
  joe@libops.io:
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfZFZFg1AcojL19v2/t3R0X6VRLKqw9XvTf0dnODQkZ6sHU1c367+KoRf3R4bxBTBVYF2bmOv+wDf7Don0U1OYeV/ZtPxjPQKrIj0XN4V7CZqJdVo9rrpQHy1YkffDvhCLD9Xfr3GvsK3hzqTErx2aRR2FKpJUrwuyQu9HYjceSA7DZCuS+T0YxM8aYJksGy4+Md7PUQu5CaGk6CyUXvR3G+H0aGeUvSOmj4Z1cZLKIV1lDaziBJcNN5uI3TK/m6x8qK5erkAcFGckWNYKJ/Y18Exz3o5qFOM5YdQVNYrwguAJwOK+jnsaox/sQD/vO1zSUITkb2Bemtij6/j5gGKVeux8wYGee5JALOph7L2tOZly3/Y8jxSvHYR3IV8J121a3Ix96JOFLWf3WcrU2rU+vFQGzPAr5shCWYegv6t2ZR/UEVAmbheYBd9RYOOSmeza/fjLUQ4+A0np5ZFAFtJPteM/AViXuTnr2YLJ2ae45c28vwebY42Bnb6VwkqxYgc= joe@libops.io
  foo@institution.edu:
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClhilc7GxWn9Iju1oXNH08BYCshILrsZr/0mct/QdJudfzLidIj8KLeiGajuyeiKTfmuEd9OnXt0mjA5rhN+qS2G73f+YCdr+ax5jmmw63i75LSf+GY/0BaoAoxikyq21eHGv17Ay9k1J9Wy0AEMqIERQ/Ro3H9CPmSlxeD3HjY7WMcx01Zt4T8mLFWMwWDVa7gmgs0CcccdshlAf6wAINA6HNEeMi0R7k68jH7cBdtRfllDx/DpdFmrMq0iBLYJYr+cC/ssEv3tW5oBU6i28uyMGdjiCEX4d/66MULAfMrOzpVWuxEh8Kuvs62Yl+bXnuwprQGh5zbbDpbLULWGfnoApqLLo/8mMo/3TuIUyjwu4IrTNQzbSvA7MKwkpwcEq3kv1kpWZY3zCaxYVEKLwYhJUClnOizNZck6RI2bN17Gz2aYiYua7z7O7ZuGmcS1tMtQ56nJeD0kHbWK+hBTuk/9nEvyk4Q0MV0zK49K5u8WgAAtIiofQ7GKUUHqrLUZc= jcorall3@kent.edu
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDS2UinVOQSds/MFapKvs+9TrhAzEh4xvSMHJD3t/vfj6A29O9wOhQbSGPU7ZqBuj7g+wbyZS266SAtJzV6YcDud03PepxeK8lQbW9WLUqqGizr9xr+p7jVkLreqZxn58uGKcVafbbJoOdTlfjxrRVAu6rpWE4CXKAHDKftVL3s9cavR9qvfF6oSxpPVzGhZ+6OWqvj72YPZM6wQ+FWvyjnsScKnfMuhv8D3TDRqxhGyLOmP6FaIpHHIb+NSW3ckfFRctWIAt8e6vWwLLvYBCSJV8xIL7Rf6owBu7lpwSs9+s2X67ZB2kwngh6JOSlB2o4YPRm945j7QKQbg1d4Xudx/ce+oiBZ2NrWCsnXcjECju8KYkUwLrxpZg5qGl63ZCipCXBgfv/VhfevSoxKTAfoNcVKKuQgoTlrosT2yYEeP4UQTa4TsVyffNhzpK7ZHnoV3YQYCt+BYmp42e9SNM9jlzS7/MZ5Xm1qxK3aXOMG62uoblxEQZx+CfgK1bjgdjs= jcorall3@kent.edu

# Solr Version to use. Must be an integer greater than or equal to 8
# And the MAJOR release only
solr: 9

# Everything below this line is a placeholder and currently unused
mariadb: 10.3.39
environments:
  - development
  - production
domain-mappings:
  development: []
  production: []
```
