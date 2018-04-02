# Reference: https://github.com/bazelbuild/rules_rust/blob/master/rust/toolchain.bzl

def _get_first_file(input):
  if hasattr(input, "files"):
    for f in input.files:
      return f
  return input

def _my_toolchain_impl(ctx):
  toolchain = platform_common.ToolchainInfo(
    adb = _get_first_file(ctx.attr.adb),
    aapt = _get_first_file(ctx.attr.aapt),
    aapt2 = _get_first_file(ctx.attr.aapt2),
  )
  return [toolchain]

android_sdk = rule(
  _my_toolchain_impl,
  attrs = {
    'adb': attr.label(allow_files = True),
    'aapt': attr.label(allow_files = True),
    'aapt2': attr.label(allow_files = True),
  }
)
