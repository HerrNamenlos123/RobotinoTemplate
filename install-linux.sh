#!/bin/bash
set -e		# exit on error

# Replace the generator here
_generator=gmake

# ===================================================================
echo Installing project $_projectname

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

"$SCRIPT_DIR/premake5/linux/premake5" install --file="$SCRIPT_DIR/premake5.lua"

echo -e "\e[32mInstallation successful\e[0m"
