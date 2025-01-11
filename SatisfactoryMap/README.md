# Map service for satisfactory server

The services contained in this directory are taken from [This repository](https://github.com/jmigual/satisfactory-server-with-map) and automatically build/published using GitHub Actions.

## How does it work

Satisfactory calculator can load a custom map if you access it with the url `https://satisfactory-calculator?url=<my_url>`. Where your browser needs to be able to access `<my_url>` (i.e., download the file) and the CORS policy needs to be set properly.

What we do is we create an nginx server that provides two urls:
- `mydomain.com/saves/*`: This one serves any savefile of the satisfactory server such that it can be downloaded.
- `mydomain.com`: This one redirects to `https://satisfactory-calculator?url=https://mydomain.com/saves/latest.sav`.

The save `latest.sav` is a symlink created by the `satisfactory-latest` docker image which runs a cronjob on the saves folder and updates the the symlink to point to the last modified save. See `build-scripts/satisfactory-latest` for the details of how the symlink is created. 

The caveat is that this relies on your server saving the game so, with the default autosave time, this can be up to 5 minutes late.
