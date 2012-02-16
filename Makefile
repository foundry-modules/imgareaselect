FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
MODULARIZE = ${FOUNDRY_DIR}/build/modularize
UGLIFY = uglifyjs --unsafe -nc
UGLIFYCSS = uglifycss

all: premake body min

premake:
	mkdir -p ${DEVELOPMENT_DIR}/imgareaselect
	mkdir -p ${PRODUCTION_DIR}/imgareaselect

body:
	${MODULARIZE} -n "imgareaselect" -css "imgareaselect/default" jquery.imgareaselect.dev.js > ${DEVELOPMENT_DIR}/imgareaselect.js
	cp distfiles/css/*.gif ${DEVELOPMENT_DIR}/imgareaselect/
	cp distfiles/css/imgareaselect-animated.css ${DEVELOPMENT_DIR}/imgareaselect/animated.css
	cp distfiles/css/imgareaselect-default.css ${DEVELOPMENT_DIR}/imgareaselect/default.css

min:
	${UGLIFY} ${DEVELOPMENT_DIR}/imgareaselect.js > ${PRODUCTION_DIR}/imgareaselect.js
	cp distfiles/css/*.gif ${PRODUCTION_DIR}/imgareaselect/
	${UGLIFYCSS} distfiles/css/imgareaselect-animated.css > ${PRODUCTION_DIR}/imgareaselect/animated.css
	${UGLIFYCSS} distfiles/css/imgareaselect-default.css > ${PRODUCTION_DIR}/imgareaselect/default.css

clean:
	rm -fr ${DEVELOPMENT_DIR}/imgareaselect.js
	rm -fr ${DEVELOPMENT_DIR}/imgareaselect
	rm -fr ${PRODUCTION_DIR}/imgareaselect.js
	rm -fr ${PRODUCTION_DIR}/imgareaselect
