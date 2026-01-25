# SPDX-FileCopyrightText: 2012 The Android Open Source Project
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

import common
import re

def FullOTA_InstallEnd(info):
  info.script.Mount("/system")
  info.script.AppendExtra('assert(run_program("/tmp/install/bin/variant_script.sh") == 0);')
  info.script.Unmount("/system")

def FullOTA_PostValidate(info):
  info.script.AppendExtra('run_program("/sbin/e2fsck", "-fy", "/dev/block/platform/msm_sdcc.1/by-name/system");');
