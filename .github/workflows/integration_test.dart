name: integration-test

on:
  push:
    branches:
      - main
jobs:
  test:
    runs-on: macOS-latest
    steps:
      - uses: actions/checkout@v4
      - uses: futureware-tech/simulator-action@v3
        with:
          model: 'iPhone 14'
      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'
      - run: flutter pub get
      - run: flutter test integration_test