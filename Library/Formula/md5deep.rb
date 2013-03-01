require 'formula'

class Md5deep < Formula
  homepage 'http://md5deep.sourceforge.net/'
  url 'http://sourceforge.net/projects/md5deep/files/md5deep/md5deep-4.3/md5deep-4.3.tar.gz'
  sha1 'b9dd6444f07c9fc344ebef201baebdf71bda337f'

  head 'git://github.com/jessek/hashdeep'

  if build.head?
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    system "sh bootstrap.sh" if build.head?
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system("#{bin}/md5deep -h") && system("#{bin}/hashdeep -h")
  end
end
