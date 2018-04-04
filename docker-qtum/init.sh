#! /bin/bash

source p_init.sh

# === XCPlugin ===

# .set Owner PlatformName  default "QTUM"
#qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol setPlatformName '["'${myPlatform}'"]'` 0 6000000 0.0000004 $XCPluginOwner

# .add credible xc Platform （"INK"）
#qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol addPlatform '["494e4b0000000000000000000000000000000000000000000000000000000000"]'` 0 6000000 0.0000004 $XCPluginOwner
#qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol addPlatform '["'${otherPlatform}'"]'` 0 6000000 0.000004 $XCPluginOwner

# .add credible xc Platform's PublicKey
#qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol addPublicKey '["'${otherPlatform}'","'$otherPlatformPubKey'"]'` 0 6000000 0.0000004 $XCPluginOwner
#
## .set  credible xc Platform's weight, default 1
##qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol setWeight '["'${otherPlatform}'",1]'` 0 6000000 0.0000004 $XCPluginOwner
#
## set XCPlugin contract caller.
#qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol addCaller '["'$XCHexAddress'"]'` 0 6000000 0.0000004 $XCPluginOwner
#
## === XC ===
#
## .set INK contract address
#qcli sendtocontract $XCHexAddress `solar encode contracts/XC.sol setINK '["'$INKHexAddress'"]'` 0 6000000 0.0000004 $XCOwner
## .set XCPlugin contract address
#qcli sendtocontract $XCHexAddress `solar encode contracts/XC.sol setXCPlugin '["'$XCPluginHexAddress'"]'` 0 6000000 0.0000004 $XCOwner
#
## .set Owner PlatformName  default "QTUM"
##qcli sendtocontract $XCHexAddress `solar encode contracts/XC.sol setPlatformName '["'${myPlatform}'"]'` 0 6000000 0.0000004 $XCOwner
#
## === start ===
#
#qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol start` 0 6000000 0.0000004 $XCPluginOwner
#qcli sendtocontract $XCHexAddress `solar encode contracts/XC.sol start` 0 6000000 0.0000004 $XCOwner
