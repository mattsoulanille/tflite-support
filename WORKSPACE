workspace(name = "org_tensorflow_lite_support")

# TFLite Support library splits up its workspace imports to work around the
# limitation that only load() statements can appear at the top of a *.bzl file.

load("workspace9.bzl", "tflite_support_workspace9")
tflite_support_workspace9()

##################

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_python",
    sha256 = "9d04041ac92a0985e344235f5d946f71ac543f1b1565f2cdbc9a2aaee8adf55b",
    strip_prefix = "rules_python-0.26.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.26.0/rules_python-0.26.0.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

load("@rules_python//python:repositories.bzl", "python_register_toolchains")
load(
    "@org_tensorflow//tensorflow/tools/toolchains/python:python_repo.bzl",
    "python_repository",
)

python_repository(name = "python_version_repo")

load("@python_version_repo//:py_version.bzl", "HERMETIC_PYTHON_VERSION")

python_register_toolchains(
    name = "python",
    ignore_root_user_error = True,
    python_version = HERMETIC_PYTHON_VERSION,
)

load("@python//:defs.bzl", "interpreter")

##################

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

