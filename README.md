# Plainsfiles

### 🔧 Tools You'll Need

Before installing, make sure you have:

- `git`
- `stow`

### 📦 Installation

Clone the repo into your `$HOME` directory:

```bash
git clone https://github.com/plainslife/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install all the configuration packages

```bash
stow .
```

To install just one package, specify its directory name. 
For example, to link only Waybar's config:

```bash
stow waybar
```
