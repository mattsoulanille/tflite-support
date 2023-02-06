This repo is a fork of the
[tflite-support](https://github.com/tensorflow/tflite-support) repo, with the
addition of the `tflite_model_runner` related code to show how it is built
using bazel and emsdk.

1. Add emscripten toolchain to the
   [WORKSPACE](https://github.com/jinjingforever/tflite-support/blob/master/WORKSPACE#L436-L449)
   file. This will set up emsdk and provide a useful build rule `wasm_cc_binary`
   that can be used to build WASM module from a cc_binary (see below).
2. I also added a small
   [patch](https://github.com/jinjingforever/tflite-support/blob/master/WORKSPACE#L169-L170)
   for the com_google_glog library. Without it, the emscripten build will fail
   on Mac/Linux. The glog
   [v0.5.0 release](https://github.com/google/glog/releases/tag/v0.5.0) has a
   fix for this issue, but it requires some TFLite code refactoring. I will talk
   to the TFLite team about this. For now we will just use the patch.
3. The cpp code is
   [here](https://github.com/jinjingforever/tflite-support/tree/master/tensorflow_lite_support/web/tflite_model_runner/cc).
   - `tflite_model_runner.*` implement the model runner.
   - `tflite_model_runner_wasm.cc` sets up the WASM related bindings.
   - The `BUILD` file uses the `wasm_cc_binary` rule to build the WASM module.
     It is currently linking with
     [XNNPACK](https://github.com/jinjingforever/tflite-support/blob/master/tensorflow_lite_support/web/tflite_model_runner/cc/BUILD#L57), with WASM
     SIMD and multi-threading
     [turned on](https://github.com/jinjingforever/tflite-support/blob/master/tensorflow_lite_support/web/tflite_model_runner/cc/BUILD#L65-L66).
4. The demo code is
   [here](https://github.com/jinjingforever/tflite-support/tree/master/tensorflow_lite_support/web/tflite_model_runner/demo). To run the demo:
   - Run `yarn && yarn build` in the demo directory. `yarn build` runs
     [build.sh](https://github.com/jinjingforever/tflite-support/blob/master/tensorflow_lite_support/web/tflite_model_runner/demo/build.sh)
     where you can see how the `bazel build` command is used and how to extract
     the output files.
   - Run `yarn start` to start the demo locally. It creates a model runner
     instance with the MobilenetV2 model and classfies an image. See the
     [script.js](https://github.com/jinjingforever/tflite-support/blob/master/tensorflow_lite_support/web/tflite_model_runner/demo/src/script.js) file
     for details about how things are used from the JS side.
   - Since this build configuration is for SIMD+multi-threading, please make
     sure Chrome has these two features
     [turned on](https://drive.google.com/file/d/13hqGwBOTJFoqMQVUAn_tiYp-uqQN_NUq/view?usp=sharing)
     from `chrome://flags`.


TFLite Support is a toolkit that helps users to develop ML and deploy TFLite
models onto mobile devices. It works cross-Platform and is supported on Java,
C++ (WIP), and Swift (WIP). The TFLite Support project consists of the following
major components:

*   **TFLite Support Library**: a cross-platform library that helps to deploy
    TFLite models onto mobile devices.
*   **TFLite Model Metadata**: (metadata populator and metadata extractor
    library): includes both human and machine readable information about what a
    model does and how to use the model.
*   **TFLite Support Codegen Tool**: an executable that generates model wrapper
    automatically based on the Support Library and the metadata.
*   **TFLite Support Task Library**: a flexible and ready-to-use library for
    common machine learning model types, such as classification and detection,
    client can also build their own native/Android/iOS inference API on Task
    Library infra.

TFLite Support library serves different tiers of deployment requirements from
easy onboarding to fully customizable. There are three major use cases that
TFLite Support targets at:

*   **Provide ready-to-use APIs for users to interact with the model**. \
    This is achieved by the TFLite Support Codegen tool, where users can get the
    model interface (contains ready-to-use APIs) simply by passing the model to
    the codegen tool. The automatic codegen strategy is designed based on the
    TFLite metadata.

*   **Provide optimized model interface for popular ML tasks**. \
    The model interfaces provided by the TFLite Support Task Library are
    specifically optimized compared to the codegen version in terms of both
    usability and performance. Users can also swap their own custom models with
    the default models in each task.

*   **Provide the flexibility to customize model interface and build inference
    pipelines**. \
    The TFLite Support Util Library contains varieties of util methods and data
    structures to perform pre/post processing and data conversion. It is also
    designed to match the behavior of TensorFlow modules, such as TF.Image and
    TF.text, ensuring consistency from training to inferencing.

See the
[documentation on tensorflow.org](https://www.tensorflow.org/lite/inference_with_metadata/overview)
for more instruction and examples.

## Build Instructions

We use Bazel to build the project. When you're building the Java (Android)
Utils, you need to set up following env variables correctly:

*   `ANDROID_NDK_HOME`
*   `ANDROID_SDK_HOME`
*   `ANDROID_NDK_API_LEVEL`
*   `ANDROID_SDK_API_LEVEL`
*   `ANDROID_BUILD_TOOLS_VERSION`

## How to contribute

Please issue a pull request and assign @lu-wang-g for a code review.

## Contact us

Let us know what you think about TFLite Support by creating a
[new Github issue](https://github.com/tensorflow/tflite-support/issues/new), or
email us at tflite-support-team@google.com.
