require 'formula'

class Lz4 < Formula
  homepage 'http://code.google.com/p/lz4/'
  head 'http://lz4.googlecode.com/svn/trunk', :using => :svn
  sha1 ''

  def patches
    # Support osx
    { :p0 => DATA }
  end

  def install
    system "make"
    prefix.install 'lz4demo'
  end

  test do
    system "lz4demo"
  end
end

__END__
Index: Makefile
===================================================================
--- Makefile    (revision 90)
+++ Makefile    (working copy)
@@ -3,9 +3,11 @@

 OS := $(shell uname)
 ifeq ($(OS),Linux)
-EXT =
+  EXT =
+else ifeq ($(OS),Darwin)
+  EXT =
 else
-EXT =.exe
+  EXT =.exe
 endif

 default: lz4demo
