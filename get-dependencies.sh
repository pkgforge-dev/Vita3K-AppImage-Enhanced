#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	boost             \
	clang             \
	cmake             \
	lld               \
	ninja             \
	openssl           \
	qt6-base          \
	qt6-svg           \
	qt6-tools         \
	sdl3              \
	vulkan-icd-loader \
	wayland           \
	libxcursor        \
	libxext           \
	libxi             \
	libxrandr         \
	libxss            \
	libxtst

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ! gtk

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
echo "Building Vita3K..."
echo "---------------------------------------------------------------"
git clone https://github.com/Vita3K/Vita3K.git ./Vita3K && (
	cd ./Vita3K

	# Vita3K has no versioned stable tags, only a continuous release
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" > ~/version

	git submodule update --init --recursive

	# Disable the Qt Multimedia based Vita theme BGM feature,
	# Vita3K already links ffmpeg statically, but libavcodec still ends up being
	# included because it uses Qt Multimedia to play background music in the menu
	git apply --3way ../patches/disable-theme-bgm.patch

	cmake --preset linux-ninja-clang \
		-B ./build                   \
		-W no-author                 \
		-D CMAKE_BUILD_TYPE=Release  \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D XXH_X86DISPATCH_ALLOW_AVX=ON
	cmake --build ./build --config Release
	cmake --install ./build --config Release
)
