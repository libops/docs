# libops Documentation

Viewable at https://docs.libops.io

This repository contains the documentation for the libops platform.

This repository also serves as an issue queue for any bugs or feature requests for libops.


## Local docs development

```
docker build -t docs:main .
docker run -p 8080:80 docs:main
```

You should be able to view the docs in your web browser at http://localhost:8080

