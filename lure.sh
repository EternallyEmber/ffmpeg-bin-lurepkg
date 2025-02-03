name='ffmpeg'
version='7.1'
release='1'
desc='A complete, cross-platform solution to record, convert and stream audio and video.'
homepage='https://www.ffmpeg.org/'
maintainer="Ember Profet <ember.profet@outlook.com>"
architectures=('amd64' 'arm64')
license=('custom')
provides=('ffmpeg')

sources_arm64=("https://github.com/EternallyEmber/FFmpeg-Builds/releases/download/latest/ffmpeg-n${version}-latest-linuxarm64-nonfree-${version}.tar.xz")
checksums_arm64=("SKIP")

sources_amd64=("https://github.com/EternallyEmber/FFmpeg-Builds/releases/download/latest/ffmpeg-n${version}-latest-linux64-nonfree-${version}.tar.xz")
checksums_amd64=("SKIP")

package() {
	for f in ${srcdir}/ffmpeg-n${version}-latest-*-nonfree-${version}/bin/ffmpeg; do install -Dm755 $f /usr/bin/ffmpeg; done
	for f in ${srcdir}/ffmpeg-n${version}-latest-*-nonfree-${version}/bin/ffplay; do install -Dm755 $f /usr/bin/ffplay; done
	for f in ${srcdir}/ffmpeg-n${version}-latest-*-nonfree-${version}/bin/ffprobe; do install -Dm755 $f /usr/bin/ffprobe; done
}
