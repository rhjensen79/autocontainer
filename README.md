# autocontainer
Repo for my CI/CD Automation container. 
This container, contains all the tools I need, across all my CI/CD pipelines, so i can reference the same container, for (most) of my pipelines.

It has been changed a couple of times, but is now being build using Github Actions, and pushed directly to my Github Repo.

Use it by pulling it directly from the repo, using : 
```
docker pull ghcr.io/rhjensen79/autocontainer:main
```
### Update 
I changed this to be build using Github Actions, and pushed directly to Github Registry..
Mostly due to Docker rate limits. 
This means that the [blog post(https://www.robert-jensen.dk/posts/2021-easy-updating-cdicd-tools/)] I wrote, is no longer 100% valid, since it's no longer being build by Docker Hub. 
Fell free to fork the repo, and connect it to your own Docker Hub autobuild, if you want to use the features described in the blog post.
