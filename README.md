<div align="center">

# Vita3K-AppImage-Enhanced 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/pkgforge-dev/Vita3K-AppImage-Enhanced/total?logo=github&label=GitHub%20Downloads)](https://github.com/pkgforge-dev/Vita3K-AppImage-Enhanced/releases/latest)
[![CI Build Status](https://github.com/pkgforge-dev/Vita3K-AppImage-Enhanced/actions/workflows/appimage.yml/badge.svg)](https://github.com/pkgforge-dev/Vita3K-AppImage-Enhanced/releases/latest)
[![Latest Stable Release](https://img.shields.io/github/v/release/pkgforge-dev/Vita3K-AppImage-Enhanced)](https://github.com/pkgforge-dev/Vita3K-AppImage-Enhanced/releases/latest)

<p align="center">
  <img src="https://raw.githubusercontent.com/Vita3K/Vita3K/496939b602703951277263c7b3e60a9ae36879c1/dist/image/org.vita3k.vita3k.svg" width="128" />
</p>


| Latest Stable Release | Upstream URL |
| :---: | :---: |
| [Click here](https://github.com/pkgforge-dev/Vita3K-AppImage-Enhanced/releases/latest) | [Click here](https://github.com/Vita3K/Vita3K) |

</div>

### Difference from upstream Vita3K

The optional Vita theme background music feature (off by default upstream) is disabled here via [`patches/disable-theme-bgm.patch`](patches/disable-theme-bgm.patch). It was the only user of Qt Multimedia, which despite Vita3K already linking ffmpeg statically Qt Multimeida pulls a second shared FFmpeg into the AppImage just to loop one audio file. Everything else is built unmodified from upstream `master`. This feature is removed here because not only it bloats the AppImage size, having two different ffmpeg versions in the same process namespace is asking for trouble.

---

AppImage made using [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks.

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

This AppImage is also supplied with a self-updater by default, so any updates to this application won't be missed, you will be prompted for permission to check for updates and if agreed you will then be notified when a new update is available.

Self-updater is disabled by default if AppImage managers like [am](https://github.com/ivan-hc/AM), [soar](https://github.com/pkgforge/soar) or [dbin](https://github.com/xplshn/dbin) exist, which manage AppImage updates.

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
  </a>
</details>

---

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)
