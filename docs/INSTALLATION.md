# Installation

Pyret has an [official online editor][cpo] that can be used by most modern browsers regardless of operating system. However, an experimental command-line interface (CLI) is also available through the [pyret-npm][pyret-npm] package by first installing [NodeJS][node-js] and then the pyret-npm package. This package works well in Linux and MacOS, but Windows users should install the CLI using the [Windows Subsystem for Linux (WSL)][wsl] or a virtual machine of their choosing.

## IDEs

Because offline use of Pyret is currently experimental, there isn't strong IDE support and using the [official online editor][cpo] will generally give you the best experience out of the box. Syntax highlighting can be provided in Atom and Pulsar Edit by the [atom-language-pyret][atom-language-pyret] package or in Visual Studio Code by [the Pyret extension][vscode-pyret].

[node-js]: https://nodejs.org/en/download
[pyret-npm]: https://npm.io/package/pyret-npm
[cpo]: https://code.pyret.org/editor
[wsl]: https://learn.microsoft.com/en-us/windows/wsl/about
[atom-language-pyret]: https://github.com/brownplt/atom-language-pyret
[vscode-pyret]: https://marketplace.visualstudio.com/items?itemName=SethPoulsen.vscode-language-pyret
