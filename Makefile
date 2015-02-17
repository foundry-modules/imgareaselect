all: modularize-script minify-script copy-styles minify-styles lessify-styles copy-assets

include ../../build/modules.mk

MODULE = imgareaselect
MODULARIZE_OPTIONS = -jq

SOURCE_SCRIPT_FOLDER = .
SOURCE_SCRIPT_FILE_SUFFIX = .dev.js

SOURCE_STYLE_FOLDER = distfiles/css
SOURCE_STYLE_FILES = animated default
SOURCE_STYLE_FILE_PREFIX = imgareaselect-

SOURCE_ASSET_FILES = ${SOURCE_STYLE_FOLDER}/*.gif

TARGET_STYLE_LESS_CONVERTER = sed 's/url(/url(@{foundry_uri}\/styles\/imgareaselect\//g'