# Forgejo-ADM

__Forgejo version__: _`13.0.3`_

forgejo-adm is an application for ADM the operating system of [ASUSTOR](https://www.asustor.com/) the server brand of [ASUS](https://www.asus.com/).
This application uses the docker package available [here](https://codeberg.org/forgejo/forgejo).

## Requirements

- application docker-ce (>=20.10.17.r1) ;
- server with an x86-64 or arm64 architecture ;
- ADM (>=3.5.0) ;

## Installation

__:warning: This application is not an Android application !__

Download the `.apk` file available in the release versions
of this repository.

Go to `APP Central >> Manage >> Manual Installation`.

Select the application `.apk` and follow the installation process.

## Configuration folder

This application will create a folder in `/share/Docker/Forgejo`, this folder will contain all configuration files, and the embedded database if you use it.

## How to update Forgejo for ADM ?

When an update is available you can do it directly from APP CENTRAL in ADM. If you want to do it manually, nothing could be easier. Uninstall Forgejo and install the new version all your data will be kept, in some cases for major release it is possible that I indicate an additional procedure to follow.

## An issue or a request ?

You can report a problem, ask for help or make changes at any time by following this [link](https://github.com/Mr4Mike4/forgejo-adm/issues/new). Remember that I am not the developer of Forgejo but of Forgejo-ADM.