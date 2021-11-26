# Source for revamped datalad.org website #

Latest demo: https://jsheunis.github.io/datalad.org/

## Run locally

```
https://github.com/jsheunis/datalad.org.git
cd datalad.org
git submodule update --init --recursive


python3 -m venv ~/.venvs/pelican
source ~/.venvs/pelican/bin/activate

pip3 install pelican

pelican --autoreload --listen
```
