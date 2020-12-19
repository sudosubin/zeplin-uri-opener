<p align="center">
  <img src="https://raw.githubusercontent.com/sudosubin/zeplin-uri-opener/assets/logo.svg" width="120" alt="Zeplin URI Opener Logo" />
</p>

<p align="center">A zeplin app uri opener using <a href="https://linux.die.net/man/1/xdg-open" target="_blank">xdg-open</a> for developers using linux.</p>

<p align="center">
  <img src="https://img.shields.io/github/license/sudosubin/zeplin-uri-opener" alt="Repository License" />
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20freebsd-lightgrey" alt="Supported Platforms" />
</p>

## Description

Zeplin uri opener is a small, efficient way to get Zeplin App URI working on linux.

- **Limitation**: Zeplin does not provide a Linux desktop app. Linux users often get embarrassed when co-workers share Zeplin app uri instead of web url.
- **Open URI in Browser**: Click the app uri, then your browser will open a zeplin web url.
- **Compatible (WIP)**: All linux distros (even FreeBSD) using `xdg-open` will be able to use this opener. (Currently only tested on Ubuntu.)

## Installation

The script will ask you to enter your system password, in order to put the script file in `/usr/local/bin`.

```sh
git clone --depth 1 https://github.com/sudosubin/zeplin-uri-opener.git
cd zeplin-uri-opener
bash ./install.sh
```

## Documentation

- [URI Variations](./docs/uri-variations.md)

## Development

- Test with [Bats](https://github.com/bats-core/bats-core).
- Lint with [ShellCheck](https://github.com/koalaman/shellcheck).

## License

Zeplin URI Opener is [MIT licensed](./LICENSE).
