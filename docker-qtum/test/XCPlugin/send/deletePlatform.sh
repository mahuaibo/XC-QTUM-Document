#! /bin/bash

source p_init.sh

qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol deletePlatform '["'$1'"]'` 0 6000000 0.0000004 $XCPluginOwner