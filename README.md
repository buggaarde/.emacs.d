# .emacs.d/

My personal Emacs setup

## Usage

Clone the repository into your root directory (or where ever you keep your dotfiles) with

``` shell
git clone https://github.com/buggaarde/.emacs.d .
```

On first start up, a few packages will be installed.

## `use-package`

This setup uses [`use-package`](https://github.com/jwiegley/use-package) extensively. `use-package` is a macro that significantly simplifies emacs configuration. An added bonus is that almost all packages will defer their loading until the time they are needed, which means that Emacs's init time will relatively short (around 2.5 seconds).
