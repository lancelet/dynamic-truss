#!/usr/bin/env bash
nix-shell -p        \
          libffi    \
          llvm_5    \
          pkgconfig \
          clang_5
