"""Generate a file.
In this example, the content is passed via an attribute. If you generate
large files with a lot of static content, consider using
`ctx.actions.expand_template` instead.

https://github.com/bazelbuild/examples/blob/master/rules/actions_write/file.bzl
"""

def _impl(ctx):
  sdk = ctx.toolchains['//:android_sdk_darwin']
  adb_bugreport = ctx.outputs.adb_bugreport

  ctx.actions.run(
    inputs=[sdk.adb],
    outputs=[adb_bugreport],
    executable=sdk.adb,
    arguments=["bugreport", adb_bugreport.path],
    progress_message="Generating adb bugreport to %s" % adb_bugreport.path
  )

adb_bugreport = rule(
    implementation=_impl,
    toolchains=['//:android_sdk_darwin'],
    outputs={
      "adb_bugreport": "%{name}_adb_bugreport.zip",
    },
)
