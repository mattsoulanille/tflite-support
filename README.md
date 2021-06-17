This repo is a fork of the
[tflite-support](https://github.com/tensorflow/tflite-support) repo, with the
addition of the `tflite_model_runner` related code to show how it is built
using bazel and emsdk.

1. Add emscripten toolchain to the
   [WORKSPACE](https://github.com/jinjingforever/tflite-support/blob/master/WORKSPACE#L434-L447)file. This will provide a useful build rule `wasm_cc_binary` that can be used
   to build WASM module from a cc_binary.
2. Check out the cpp code
   [here](https://github.com/jinjingforever/tflite-support/tree/master/tensorflow_lite_support/web/tflite_model_runner/cc).
   - `tflite_model_runner.*` implement the model runner.
   - `tflite_model_runner_wasm.cc` sets up the WASM related bindings.
   - `BUILD` file uses the `wasm_cc_binary` rule to build the WASM module. As
     you can see, it is currently linking with
     [XNNPACK](https://github.com/jinjingforever/tflite-support/blob/master/tensorflow_lite_support/web/tflite_model_runner/cc/BUILD#L57), with WASM
     SIMD and multi-threading
     [turned on](https://github.com/jinjingforever/tflite-support/blob/master/tensorflow_lite_support/web/tflite_model_runner/cc/BUILD#L65-L66).
3. Check out the demo code
   [here](https://github.com/jinjingforever/tflite-support/tree/master/tensorflow_lite_support/web/tflite_model_runner/demo). To run the demo:
   - Run `yarn && yarn build` in the demo directory. `yarn build` runs
     `build.sh` where you can see how the `bazel build` command is used and how
     to extract the output files.
   - Run `yarn start` to start the demo locally. It creates a model runner
     instance with a MobilenetV2 model, and uses the model runner to identify an
     image. See the
     [script.js](https://github.com/jinjingforever/tflite-support/blob/master/tensorflow_lite_support/web/tflite_model_runner/demo/src/script.js) file
     for details about how things are used from the JS side.
