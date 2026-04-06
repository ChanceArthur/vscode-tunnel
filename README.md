An OCI container for running VSCode on my iPad through my home server. Currently built for Astro and GBA Pokémon development, and may be extended further later on.

```
mkdir -p ~/containers/vscode
mkdir -p ~/.config/containers/systemd
cp /path/to/vscode.container ~/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user start vscode.service
```
