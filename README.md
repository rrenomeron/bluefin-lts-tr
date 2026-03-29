# Bluefin LTS Standard Operating Environment

This is an alternative 
[standard operating environment](https://www.redhat.com/en/topics/management/what-is-an-soe)
for my desktops and laptops based on [Bluefin LTS](https://docs.projectbluefin.io/lts/) rather than Fedora.  It's designed to have many
of the same features as my [Fedora SOE](https://github.com/rrenomeron/tr-desktop-fedora), but
with an Bluefin LTS base, for use cases where an Enterprise style operating system is needed.

See the Fedora [SOE README](https://github.com/rrenomeron/tr-desktop-fedora/blob/main/README.md)
for more information.

## About This Image

This image consists of Bluefin LTS in "developer mode" with the following changes
and/or additions:

- "Gated" Kernel from the [Fedora CoreOS stable stream](https://www.fedoraproject.org/coreos/release-notes)
- Google Chrome RPM installed and set as default browser
- Clocks set to AM/PM view with Weekday Display
- Curated selection of Flatpak apps installed automatically
- Single click to open items in Nautilus
- Nautilus icons [match accent
  color](https://extensions.gnome.org/extension/7535/accent-directories/)
- [System monitor applet](https://github.com/mgalgs/gnome-shell-system-monitor-next-applet) in
  top panel next to Gnome system menu
- [DeskChanger](https://github.com/BigE/desk-changer/) wallpaper manager
- [Weather applet](https://gitlab.gnome.org/somepaulo/weather-or-not)
- Use smaller icons in Nautilus icon view
- Sort directories first in Nautilus and GTK file choosers
- Dark styles enabled by default
- [System76 wallpaper collection](https://system76.com/merch/desktop-wallpapers)
- [Framework 12](https://frame.work/laptop12) wallpapers

## Tags and Streams

This image is considered incomplete and unstable, so there is only a ``:testing`` stream,
built from the ``main`` branch.

When the image is feature complete, I expect to use a different strategy for the testing
and production streams compared to the Fedora and AlmaLinux images.  Since the changes between
the SOE and the upstream image are very small, the testing image will follow the Bluefin LTS 
``test`` tag, and the production image will follow the ``lts`` tag.

## Development and Maintenance Process

### Getting Started

Initialize the submodule and prepare it for editing:
```
cd tr-osforge
git submodule init
git submodule update --remote
git checkout main
```

### Working with the Build Scripts

See [build/README.md](build/README.md)

### Local Development and Testing

To test changes locally, do the following:
```
just build
# Copy the image to rootful storage so bootc can see it
podman image scp $USER@localhost:localhost/tr-desktop-fedora:localdev 

# If you aren't already running a locally built image
sudo bootc switch --transport containers-storage localhost/tr-desktop-fedora:localdev

# If you are running a prior version that was built locally:
sudo bootc update
```


