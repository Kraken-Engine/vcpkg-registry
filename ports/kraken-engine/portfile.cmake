vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kraken-Engine/PyKraken
    REF v1.7.1
    SHA512 308861017466c4778085a0feae97988a093916f6265b8afbd846e09e4e72e2e87649b67f3990a2eff259c6e2e486b93710a7e5c650c6809eeae4b9274424875c
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DKRAKEN_BUILD_PYTHON=OFF
        -DSDL3_SHADERCROSS_VENDORED=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME KrakenEngine CONFIG_PATH share/kraken-engine)

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

# Clean up redundant debug files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
