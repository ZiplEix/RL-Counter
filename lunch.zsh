#!/bin/zsh

docker run --rm -it -v ${PWD}:/build --workdir /build ghcr.io/cirruslabs/flutter:stable flutter pub get && flutter run -d chrome
