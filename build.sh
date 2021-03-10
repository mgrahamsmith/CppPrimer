# Defaults
SYSTEM="Windows"
BUILD_GENERATOR="Ninja"

BUILD_DIR=_Build

BUILD_STEP=${1} # user input -c/-b

SUCC_MSG="Temba, his arms wide!"
FAIL_MSG="Shaka, when the walls fell."
print_status () {
    if [ $? == '0' ]; then
        echo "[Script] ${SUCC_MSG}"
    else
        echo "[Script] ${FAIL_MSG}"
    fi
}

if [ -z ${1} ]; then
    echo "No argument given, assuming -c"
    BUILD_STEP="-c"
fi

if [ ${BUILD_STEP} == "-c" ]; then
    cmake -G ${BUILD_GENERATOR} -S . -B ${BUILD_DIR}
    print_status

elif [ ${BUILD_STEP} == "-b" ]; then
    cmake --build ${BUILD_DIR}
    print_status

else
    echo "ERROR: argument error."
fi
