#!/bin/bash

cd /app
bundle -j4 --path "$BUNDLE_PATH"
bundle exec foreman start
