# Repo Template: Yocto with kas

This repo template will help you get started with your next [Yocto][yocto-homepage]-based project,
configured with [kas][kas] and ready to work on with [Visual Studio Code][vscode].

## First Steps

Make sure you are using a supported build host environment for Yocto.

Also make sure you have kas installed:

```shell
pipx install 'kas>=4.7'
```

## Build a test-build

The preconfigured kas project is based on the latest Yocto LTS release (currently `scarthgap`, v5.0)
and is set up to build the `core-image-minimal` with `debug-tweaks` for the `qemuarm64` machine for testing purposes.

To build the image, run:

```shell
kas build base.yml
```

After the image is built, you can then test it with QEMU (exit with Ctrl-a then x):

```shell
kas shell base.yml -c "runqemu core-image-minimal slirp nographic"
```

## VS Code Configuration

In order to work on your project with VS Code, this template contains some configuration files that will help you to
have a nice development experience.

* Recommended VS Code Extensions:
  * The official [BitBake extension][vscode-ext-bitbake], which is just essential and powerful
  * [Systemd Helper][vscode-ext-systemd-helper] with syntax highlighting and documention via tooltips for unit files.

To avoid being tracked by git, the file `.vscode/settings.json` is not part of this template.
You'll need to configure VS Code correctly to avoid problems like high CPU usage by its file watcher
or overwriting bitbake configuration files like `local.conf` by the Bitbake extension's parsing activity:

```json
{
    "python.autoComplete.extraPaths": [
        "${workspaceFolder}/sources/poky/bitbake/lib",
        "${workspaceFolder}/sources/poky/meta/lib"
    ],
    "python.analysis.extraPaths": [
        "${workspaceFolder}/sources/poky/bitbake/lib",
        "${workspaceFolder}/sources/poky/meta/lib"
    ],
    "python.analysis.exclude": [
        "**/build"
    ],
    "files.associations": {
        "*.conf": "bitbake",
        "*.osc": "xml",
        "*.inc": "bitbake"
    },
    "files.watcherExclude": {
        "**/.git/objects/**": true,
        "**/.git/subtree-cache/**": true,
        "**/.hg/store/**": true,
        "**/build/**": true,
    },
    "bitbake.commandWrapper": "kas shell base.yml -c",
}
```

## Further Notes

This repo template is licensed under the MIT License.


<!-- links -->
[kas]: https://kas.readthedocs.io/en/latest/
[vscode]: https://code.visualstudio.com/
[vscode-ext-bitbake]: https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake
[vscode-ext-systemd-helper]: https://marketplace.visualstudio.com/items?itemName=hangxingliu.vscode-systemd-support
[yocto-docs]: https://docs.yoctoproject.org/
[yocto-homepage]: https://www.yoctoproject.org/
