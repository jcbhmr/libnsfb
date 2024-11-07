#!/usr/bin/env bash
set -Eeuo pipefail

rm -rf build
mkdir -p build

cat \
    include/libnsfb_cursor.h \
    include/libnsfb_event.h \
    include/libnsfb_plot_util.h \
    include/libnsfb_plot.h \
    include/libnsfb.h \
    > build/libnsfb.h

cat \
    <(echo $'#include <stdbool.h>\n#include <stdint.h>\n#include <stddef.h>') \
    include/libnsfb_cursor.h \
    include/libnsfb_event.h \
    include/libnsfb_plot_util.h \
    include/libnsfb_plot.h \
    include/libnsfb.h \
    src/cursor.h \
    src/nsfb.h \
    src/palette.h \
    src/plot.h \
    src/surface.h \
    src/plot/api.c \
    src/plot/common.c \
    src/plot/generic.c \
    src/plot/util.c \
    src/surface/ram.c \
    src/surface/surface.c \
    src/cursor.c \
    src/dump.c \
    src/libnsfb.c \
    src/palette.c \
    | grep -v '^#include "' \
    > build/libnsfb.c