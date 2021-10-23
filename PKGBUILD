#Maintainer: Tyjak <dev@tyjak.net>
#Contributor: Tyjak <dev@tyjak.net>

pkgname=funst-git
_pkgname=funst
pkgrel=1
pkgdesc="funst is a deamon that extracts the album art from the songs playing in mpd."
arch=('any')
url="https://github.com/tyjak/funst"
license=('MIT')
depends=('sxiv' 'imagemagick' 'bash' 'ffmpeg' 'mpc' 'dunst')
makedepends=('git')
provides=($_pkgname)
source=("git+https://github.com/tyjak/funst.git")
md5sums=('SKIP')

pkgver()
{
	cd $_pkgname
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -t "$pkgdir/usr/bin" "$_pkgname"
	install -D -t "$pkgdir/usr/lib/systemd/user" "${_pkgname}.service"
}
