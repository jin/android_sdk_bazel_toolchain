def _sdk_toolchain_impl(ctx):
  toolchain = platform_common.ToolchainInfo(
    adb = ctx.file.adb,
    aapt = ctx.file.aapt,
    aapt2 = ctx.file.aapt2,
  )
  return [toolchain]

android_sdk = rule(
  _sdk_toolchain_impl,
  attrs = {
    'adb': attr.label(allow_single_file = True),
    'aapt': attr.label(allow_single_file = True),
    'aapt2': attr.label(allow_single_file = True),
  }
)
