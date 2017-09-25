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
    REPO "fallahn/xygine"
    REF "60cfec00539ea131f1adb72cdab6887319d90a92"
    HEAD_REF xyginext
    SHA512 69121dc77eba81b358567c03ae96fc6389e2e8476ae2bd437de419bf99074352fe0ea9226b9701cd2077f9a9b8c0004008a10669f2e3b67a3de6c51e1aa86355
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/xyginext
    PREFER NINJA
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

# Remove copied includes
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/readme.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/xyginext RENAME copyright)
