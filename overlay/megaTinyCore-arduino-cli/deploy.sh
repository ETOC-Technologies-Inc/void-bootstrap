#!/bin/bash

arduino-cli core update-index --additional-urls http://drazzy.com/package_drazzy.com_index.json
arduino-cli core install megaTinyCore:megaavr --additional-urls http://drazzy.com/package_drazzy.com_index.json