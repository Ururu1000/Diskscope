# Diskscope

A native Linux disk usage analyzer built with GTK4 and libadwaita. Scan a
drive or folder, see what takes up space, and delete it with one click.

## Features

- **Drives sidebar:** every mounted file system with a usage bar and free space.
  The bar turns yellow at 85 % full and red at 95 %.
- **Folder view:** contents sorted by size, with a share bar, percentage, and
  file count. Click a folder to open it; breadcrumbs take you back up.
- **Largest Files:** the 300 biggest files in the whole scan. Click one to jump
  to its folder.
- **Delete button on every row,** plus checkboxes for deleting several items at
  once. You choose **Move to Trash** (can be restored) or **Delete
  Permanently**. Sizes update right away, with no rescan.
- **Show in file manager** for any item.
- Accurate sizes: counts real disk usage (like `du`), counts hard links once,
  doesn't follow symlinks, and handles sparse files correctly.
- Stays on one file system by default (you can turn this off in the menu) and
  never scans `/proc`, `/sys`, `/dev`, or `/run`.

### Safety

- Every deletion asks for confirmation first.
- System locations (`/`, `/usr`, `/etc`, `/home`, your home folder,
  `~/.config`, mount points, …) and the scan root are protected and can't be
  deleted.
- Runs as your user, so it can't delete files you don't own.

## Requirements

Python 3.10+, GTK 4.12+, libadwaita 1.6+, PyGObject.

```sh
# Arch / CachyOS
sudo pacman -S python-gobject gtk4 libadwaita
# Fedora
sudo dnf install python3-gobject gtk4 libadwaita
# Debian / Ubuntu (24.10+)
sudo apt install python3-gi gir1.2-gtk-4.0 gir1.2-adw-1
```

## Install

```sh
git clone git@github.com:Ururu1000/Diskscope.git
cd Diskscope
./install.sh            # links ~/.local/bin/diskscope and adds a menu entry
./install.sh --uninstall
```

Or run it without installing: `./diskscope [folder]`.

## Keyboard shortcuts

| Key | Action |
| --- | --- |
| `Ctrl+O` | Choose a folder to scan |
| `F5` / `Ctrl+R` | Rescan |
| `Alt+Up` / `Backspace` | Go to the parent folder |
| `Delete` | Delete the selected items (or the focused row) |
| `Ctrl+Q` | Quit |

## License

MIT
