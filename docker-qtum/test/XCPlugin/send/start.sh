#! /bin/bash

source p_init.sh

qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol start` 0 6000000 $gasPrice $XCPluginOwner
