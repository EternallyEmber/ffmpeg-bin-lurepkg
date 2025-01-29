name='ffmpeg-bin'
version='7.1'
release='1'
desc='A complete, cross-platform solution to record, convert and stream audio and video.'
homepage='https://www.ffmpeg.org/'
maintainer="Ember Profet <ember.profet@outlook.com>"
architectures=('amd64' 'arm64')
license=('custom')
provides=('ffmpeg-bin')
conflicts=('ffmpeg' 'ffmpeg-git')

sources_arm64=("https://github.com/EternallyEmber/FFmpeg-Builds/releases/download/latest/ffmpeg-n${version}-latest-linuxarm64-nonfree-shared-${version}.tar.xz")
checksums_arm64=("SKIP")

sources_amd64=("https://github.com/EternallyEmber/FFmpeg-Builds/releases/download/latest/ffmpeg-n${version}-latest-linux64-nonfree-shared-${version}.tar.xz")
checksums_amd64=("SKIP")

package() {
	install -Dm755 "${srcdir}/*/bin/ffmpeg" "${pkgdir}/usr/bin/ffmpeg"
	install -Dm755 "${srcdir}/*/bin/ffplay" "${pkgdir}/usr/bin/ffplay"
	install -Dm755 "${srcdir}/*/bin/ffprobe" "${pkgdir}/usr/bin/ffprobe"
	for f in ${srcdir}/*/lib/*.so*; do install -Dm644 -t ${pkgdir}/usr/lib/ $f; done
	for f in ${srcdir}/*/include/*/*.h; do install -Dm444 -t ${pkgdir}/usr/include/ $f; done
	install -Dm644 "${srcdir}/*/LICENSE.txt" "${pkgdir}/usr/share/licenses/ffmpeg/LICENSE.txt"
}