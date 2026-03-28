#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_lib import (
    lib_fixup_vendorcompat,
    lib_fixups_user_type,
    libs_proto_3_9_1,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

lib_fixups: lib_fixups_user_type = {
    libs_proto_3_9_1: lib_fixup_vendorcompat,
}

namespace_imports = [
        "vendor/samsung/sm6115-common",
        "vendor/qcom/opensource/dataservices",
        "vendor/qcom/opensource/display",
]

module = ExtractUtilsModule(
    'gta4l',
    'samsung',
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, "sm6115-common", module.vendor)
    utils.run()
