<div align="center">

# asdf-swift [![Build](https://github.com/natels/asdf-swift/actions/workflows/build.yml/badge.svg)](https://github.com/natels/asdf-swift/actions/workflows/build.yml)

             [![Lint](https://github.com/natels/asdf-swift/actions/workflows/lint.yml/badge.svg)](https://github.com/natels/asdf-swift/actions/workflows/lint.yml)

[swift](https://www.swift.org/documentation/) plugin for the
[asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and
  [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Install

Plugin:

```shell
asdf plugin add swift
# or
asdf plugin add swift https://github.com/natels/asdf-swift.git
```

swift:

```shell
# Show all installable versions
asdf list-all swift

# Install specific version
asdf install swift latest

# Set a version globally (on your ~/.tool-versions file)
asdf global swift latest

# Now swift commands are available
swift --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on
how to install & manage versions.

# Contributing

Contributions of any kind welcome!
See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/natels/asdf-swift/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Nate Smith](https://github.com/natels/)
