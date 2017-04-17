# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#

include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/tmxlite-1.0.1/tmxlite)
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/fallahn/tmxlite/archive/v1.0.1.zip"
    FILENAME "v1.0.1.zip"
    SHA512 47f74571dde78992f658ccec30cbec0eab24c4e9d92f32eeba6e8c03af656ece16647e265fbd0581a984cb5c79a80e0a38a9e19781d5c79e35d3105ec9c4e781
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
     OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

# Remove copied includes
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(COPY ${SOURCE_PATH}/../readme.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/tmxlite)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/tmxlite/readme.md ${CURRENT_PACKAGES_DIR}/share/tmxlite/copyright)
