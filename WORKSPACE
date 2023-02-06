workspace(name = "org_tensorflow_lite_support")

# TFLite Support library splits up its workspace imports to work around the
# limitation that only load() statements can appear at the top of a *.bzl file.

load("workspace9.bzl", "tflite_support_workspace9")

tflite_support_workspace9()

load("workspace8.bzl", "tflite_support_workspace8")

tflite_support_workspace8()

load("workspace7.bzl", "tflite_support_workspace7")

tflite_support_workspace7()

load("workspace6.bzl", "tflite_support_workspace6")

tflite_support_workspace6()

load("workspace5.bzl", "tflite_support_workspace5")

tflite_support_workspace5()

load("workspace4.bzl", "tflite_support_workspace4")

tflite_support_workspace4()

load("workspace3.bzl", "tflite_support_workspace3")

tflite_support_workspace3()

load("workspace2.bzl", "tflite_support_workspace2")

tflite_support_workspace2()

load("workspace1.bzl", "tflite_support_workspace1")

tflite_support_workspace1()

load("workspace0.bzl", "tflite_support_workspace0")

tflite_support_workspace0()

http_archive(
    name = "emsdk",
    #    repo_mapping = {"@nodejs": "@nodejs_host"},
    sha256 = "1aa5365ccb2147701cc9d1e59a5a49577c1d6aea55da7c450df2d5ffa48b8a58",
    strip_prefix = "emsdk-3.1.24/bazel",
    urls = ["https://github.com/emscripten-core/emsdk/archive/refs/tags/3.1.24.tar.gz"],
)

load("@emsdk//:deps.bzl", emsdk_deps = "deps")

emsdk_deps()

load("@emsdk//:emscripten_deps.bzl", emsdk_emscripten_deps = "emscripten_deps")

emsdk_emscripten_deps()
