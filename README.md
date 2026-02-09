# Repo Template: Yocto with kas

This repo template will help you get started with your next [Yocto][yocto-homepage]-based project,
configured with [kas][kas] and ready to work on with [Visual Studio Code][vscode] and [Dev Containers][devcontainer].

## Devcontainer

In order to have a nice development experience, this template contains a [Dev Container][devcontainer] configuration.
When opening the project workspace, VSCode will ask you to open the workspace inside the devcontainer.
The devcontainer helps you with the following:

* create a docker container to work in and two docker volumes to persist the Yocto downloads and sstate directories
* install all required tools like the Yocto-required `HOSTTOOLS` and `kas`
* install useful VSCode extensions ([bitbake][vscode-ext-bitbake], [Systemd Helper][vscode-ext-systemd-helper])
* configure VSCode for bitbake and kas

## Build and test core-image-minimal

The preconfigured [kas][kas] project is based on the latest Yocto LTS release (currently `scarthgap`, v5.0) and is set up to
build the `core-image-minimal` with `debug-tweaks` for the `qemuarm64` machine **for testing purposes**.

To build the image, run:

```shell
kas build kas/base.yml
```

After the image is built, you can then test it with QEMU (exit with Ctrl-a then x):

```shell
kas shell -k kas/base.yml -c "runqemu core-image-minimal slirp nographic"
```

## Further Notes

This repo template is licensed under the MIT License.


<!-- links -->
[devcontainer]: https://containers.dev/
[kas]: https://kas.readthedocs.io/en/latest/
[vscode]: https://code.visualstudio.com/
[vscode-ext-bitbake]: https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake
[vscode-ext-systemd-helper]: https://marketplace.visualstudio.com/items?itemName=hangxingliu.vscode-systemd-support
[yocto-docs]: https://docs.yoctoproject.org/
[yocto-homepage]: https://www.yoctoproject.org/
