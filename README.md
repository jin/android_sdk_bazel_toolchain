# Bazel Android SDK toolchain prototype

This is a prototype of implementing the Android SDK as a [Bazel toolchain](https://docs.bazel.build/versions/master/toolchains.html).

The toolchain is defined for macOS. Run `//bazel build :demo --toolchain_resolution_debug -s` to see how we can use it to call `adb bugreport` and generate a bugreport zip.

```
~/code/android-toolchains $ bazel build :demo --toolchain_resolution_debug -s
Loading: 
Loading: 0 packages loaded
INFO: Analysed target //:demo (0 packages loaded).
INFO: Found 1 target...
[0 / 2] [-----] Generating adb bugreport to bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip
SUBCOMMAND: # //:demo [action 'Generating adb bugreport to bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip']
(cd /private/var/tmp/_bazel_jingwen/bb67efc64c8d55a3bc1537e4df87136f/execroot/__main__ && \
  exec env - \
  external/androidsdk/platform-tools/adb bugreport bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip)
[1 / 2] Generating adb bugreport to bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip; 1s darwin-sandbox
[1 / 2] Generating adb bugreport to bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip; 11s darwin-sandbox
[1 / 2] Generating adb bugreport to bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip; 31s darwin-sandbox
[1 / 2] Generating adb bugreport to bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip; 41s darwin-sandbox
INFO: From Generating adb bugreport to bazel-out/darwin-dbg/bin/demo_adb_bugreport.zip:
[  0%] generating demo_adb_bugreport.zip
[  4%] generating demo_adb_bugreport.zip
[  8%] generating demo_adb_bugreport.zip
[ 12%] generating demo_adb_bugreport.zip
[ 17%] generating demo_adb_bugreport.zip
[ 21%] generating demo_adb_bugreport.zip
[ 25%] generating demo_adb_bugreport.zip
[ 29%] generating demo_adb_bugreport.zip
[ 33%] generating demo_adb_bugreport.zip
[ 37%] generating demo_adb_bugreport.zip
[ 41%] generating demo_adb_bugreport.zip
[ 45%] generating demo_adb_bugreport.zip
[ 50%] generating demo_adb_bugreport.zip
[ 54%] generating demo_adb_bugreport.zip
[ 58%] generating demo_adb_bugreport.zip
[ 62%] generating demo_adb_bugreport.zip
[ 66%] generating demo_adb_bugreport.zip
[ 70%] generating demo_adb_bugreport.zip
[ 74%] generating demo_adb_bugreport.zip
[ 78%] generating demo_adb_bugreport.zip
[ 85%] generating demo_adb_bugreport.zip
[ 90%] generating demo_adb_bugreport.zip
[ 95%] generating demo_adb_bugreport.zip
[ 99%] generating demo_adb_bugreport.zip
[  4%] pulling demo_adb_bugreport.zip
[  9%] pulling demo_adb_bugreport.zip
[ 14%] pulling demo_adb_bugreport.zip
[ 19%] pulling demo_adb_bugreport.zip
[ 24%] pulling demo_adb_bugreport.zip
[ 29%] pulling demo_adb_bugreport.zip
[ 34%] pulling demo_adb_bugreport.zip
[ 39%] pulling demo_adb_bugreport.zip
[ 44%] pulling demo_adb_bugreport.zip
[ 49%] pulling demo_adb_bugreport.zip
[ 54%] pulling demo_adb_bugreport.zip
[ 59%] pulling demo_adb_bugreport.zip
[ 64%] pulling demo_adb_bugreport.zip
[ 69%] pulling demo_adb_bugreport.zip
[ 74%] pulling demo_adb_bugreport.zip
[ 79%] pulling demo_adb_bugreport.zip
[ 84%] pulling demo_adb_bugreport.zip
[ 89%] pulling demo_adb_bugreport.zip
[ 94%] pulling demo_adb_bugreport.zip
[ 99%] pulling demo_adb_bugreport.zip
[100%] pulling demo_adb_bugreport.zip
/data/user_de/0/com.android.shell/files/bugreports/bugreport-sdk_gphone_x86-OSR1.170720.005-2018-04-01-23-59-16.zip: 1 file pulled. 142.4 MB/s (1312548 bytes in 0.009s)
Target //:demo up-to-date:
  bazel-bin/demo.txt
  bazel-bin/demo_adb_bugreport.zip
INFO: Elapsed time: 57.549s, Critical Path: 56.90s
INFO: Build completed successfully, 2 total actions
```
