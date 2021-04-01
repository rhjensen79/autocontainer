# autocontainer
Repo for my CI/CD Automation container. 
This container, contains all the tools I need, across all my CI/CD pipelines.

It's build automaticly using my GitLab CI/CD pipeline, and pushed to my [Harbor](https://goharbor.io) repo.
Config for this can be found in the .gitlab-ci.yml file in the repo.

Fell free to pull it directly from there using : 
```
docker pull registry.cmplab.dk/cmplab/autocontainer:latest
```
### Update 
I changed this to be build by my Gitlab CI/CD and pushed to my Harbor Registry.
Mostly due to Docker rate limits. 
This means that the [blog post(https://www.robert-jensen.dk/posts/2021-easy-updating-cdicd-tools/)] I wrote, is no longer 100% valid, since it's no longer being build by Docker Hub. 
Fell free to fork the repo, and connect it to your own Docker Hub autobuild, if you want to use the features described in the blog post.
