name='ffmpeg'
version='7.1'
release='1'
desc='A complete, cross-platform solution to record, convert and stream audio and video.'
homepage='https://www.ffmpeg.org/'
maintainer="Ember Profet <ember.profet@outlook.com>"
architectures=('amd64' 'arm64')
license=('custom')
provides=('ffmpeg' 'libavcodec-dev' 'libavcodec61' 'libavcodec-' 'libavdevice61' 'libavfilter10' 'libavformat61' 'libavutil59' 'libpostproc58' 'libswresample5' 'libswscale8')

sources_arm64=("https://github.com/EternallyEmber/FFmpeg-Builds/releases/download/latest/ffmpeg-n${version}-latest-linuxarm64-nonfree-${version}.tar.xz")
checksums_arm64=("SKIP")

sources_amd64=("https://github.com/EternallyEmber/FFmpeg-Builds/releases/download/latest/ffmpeg-n${version}-latest-linux64-nonfree-${version}.tar.xz")
checksums_amd64=("SKIP")

package() {
	for f in ${srcdir}/ffmpeg-n${version}-latest-*-nonfree-${version}/bin/*; do install -Dm755 -t ${pkgdir}/usr/bin/ $f; done
	for f in ${srcdir}/ffmpeg-n${version}-latest-*-nonfree-${version}/man/*; do install -Dm755 -t ${pkgdir}/usr/local/share/man $f; done
	for f in ${srcdir}/ffmpeg-n${version}-latest-*-nonfree-${version}/LICENSE.txt; do install -Dm644 -t ${pkgdir}/usr/share/licenses/ffmpeg/LICENSE.txt $f; done
}