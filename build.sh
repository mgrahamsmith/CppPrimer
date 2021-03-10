##
## Using MinGw 64-bit on Windows 10\
## Visual Studio 2019
## mingw-x64 toolchain installed.
##

BUILD_STEP=${1} # user input -c/-b

BUILD_DIR="_Build" # Set build output dir
BUILD_GENERATOR="" # Set generator here (Default "Visual Studio 16 2019")

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
    if [ -z ${BUILD_GENERATOR} ]; then
        cmake -S . -B ${BUILD_DIR}
    else
        cmake -G ${BUILD_GENERATOR} -S . -B ${BUILD_DIR}
    fi
    print_status

elif [ ${BUILD_STEP} == "-b" ]; then
    cmake --build ${BUILD_DIR}
    print_status

else
    echo "ERROR: argument error."
fi
