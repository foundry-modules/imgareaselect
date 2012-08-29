include ../../build/modules.mk

MODULE = imgareaselect
FILENAME = ${MODULE}.js

SOURCE = jquery.imgareaselect.dev.js

PRODUCTION = ${PRODUCTION_DIR}/${FILENAME}
DEVELOPMENT = ${DEVELOPMENT_DIR}/${FILENAME}
PRODUCTION_FOLDER = ${PRODUCTION_DIR}/${MODULE}
DEVELOPMENT_FOLDER = ${DEVELOPMENT_DIR}/${MODULE}

all: premake body min

premake:
	mkdir -p ${DEVELOPMENT_FOLDER}
	mkdir -p ${PRODUCTION_FOLDER}

body:
	${MODULARIZE} -jq -n "${MODULE}" -css "imgareaselect/default" ${SOURCE} > ${DEVELOPMENT}
	cp distfiles/css/*.gif ${DEVELOPMENT_FOLDER}/
	cp distfiles/css/imgareaselect-animated.css ${DEVELOPMENT_FOLDER}/animated.css
	cp distfiles/css/imgareaselect-default.css ${DEVELOPMENT_FOLDER}/default.css

min:
	${UGLIFYJS} ${DEVELOPMENT} > ${PRODUCTION}
	cp distfiles/css/*.gif ${PRODUCTION_FOLDER}/
	${UGLIFYCSS} distfiles/css/imgareaselect-animated.css > ${PRODUCTION_FOLDER}/animated.css
	${UGLIFYCSS} distfiles/css/imgareaselect-default.css > ${PRODUCTION_FOLDER}/default.css

clean:
	rm -fr ${DEVELOPMENT}
	rm -fr ${DEVELOPMENT_FOLDER}
	rm -fr ${PRODUCTION}
	rm -fr ${PRODUCTION_FOLDER}
