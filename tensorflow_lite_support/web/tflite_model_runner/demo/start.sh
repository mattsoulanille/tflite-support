#!/bin/bash

cp -f src/* dist/
npx node-static -a 0.0.0.0 -H '{"Cross-Origin-Opener-Policy": "same-origin", "Cross-Origin-Embedder-Policy": "require-corp"}' -p 8000 dist/
