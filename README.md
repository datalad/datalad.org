# Source datalad.org

This repository contains the source code for the DataLad website: https://www.datalad.org/

It is built with the Python-powered static site generator [Pelican](https://getpelican.com/)


## Run locally

First clone the repository and install submodules:

```
git clone https://github.com/datalad/datalad.org.git
cd datalad.org
git submodule update --init --recursive
```

Then create a virtual environment and install `pelican`:

```
python3 -m venv ~/.venvs/pelican
source ~/.venvs/pelican/bin/activate
pip3 install pelican
```

Then run the command to serve the website locally.
```
pelican --autoreload --listen
```

The local website will update in real-time if changes are made to the source code.


## Contributing

Contributions are welcome! Please:
- fork this repository
- create a new branch
- add and commit your changes
- ensure that your changes render locally
- push your commits to your fork
- create a pull request to the upstream `master` branch, with a description of your proposed changes

If your contributions do not involve specific changes to the code, please [create an issue](https://github.com/datalad/datalad.org/issues/new).