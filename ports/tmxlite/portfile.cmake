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
vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO "fallahn/tmxlite"
    REF "v1.0.1"
    HEAD_REF master
    SHA512 d7f05f50e49a03e432d5a5f03be4fbde2a7a149e9aa36061344bbb49bdc9f75630446c5cc6788dcda15a05cf7ece6a96124ffe6db22ee64b60969b5a626013ad
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/tmxlite
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

# Remove copied includes
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(COPY ${SOURCE_PATH}/readme.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/tmxlite)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/tmxlite/readme.md ${CURRENT_PACKAGES_DIR}/share/tmxlite/copyright)
