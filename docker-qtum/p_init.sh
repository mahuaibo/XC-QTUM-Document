#! /bin/bash

#QTUM
myPlatform="5154554d00000000000000000000000000000000000000000000000000000000"

#INK
otherPlatform="494e4b0000000000000000000000000000000000000000000000000000000000"
otherPlatformPubKey="4230a12f5b0693dd88bb35c79d7e56a68614b199"

INKHexAddress="8611c2a3110d36fb86fa13ebefb634af0f0bc78d"
INKAddress=`qcli fromhexaddress $INKHexAddress`
INKOwner="qdEFNkdsxFsEbnVUkfhK4rSx1CCgnFFQip"
INKHexOwner=`qcli gethexaddress $INKOwner`

XCHexAddress="39c8772d312e1066eba6b972d0a893f0c271908b"
XCAddress=`qcli fromhexaddress ${XCHexAddress}`
XCOwner="qXTcjD7aTaHnfmLvMrHHtg82U2KtaJ8RNh"
XCHexOwner=`qcli gethexaddress ${XCOwner}`

XCPluginHexAddress="92d4af9f548bb0b6664c7eae1ea47a139b98547f"
XCPluginAddress=`qcli fromhexaddress ${XCPluginHexAddress}`
XCPluginOwner="qcohzSQmBvcjk7UX3pod7VBSGPbYQZ47nd"
XCPluginHexOwner=`qcli gethexaddress ${XCPluginOwner}`

#✅  contracts/XCPlugin.sol
#        txid: 2e52bd88a3b114ea92bc06f299b68f5d95927df459ba364c1073e0723e23d392
#     address: 92d4af9f548bb0b6664c7eae1ea47a139b98547f
#   confirmed: true
#       owner: qcohzSQmBvcjk7UX3pod7VBSGPbYQZ47nd
#
#✅  contracts/INK.sol
#        txid: ff50bc36e0d59f0351f4bc03e4d839f13fcc8f41241c49a287712359c4de9b9a
#     address: 8611c2a3110d36fb86fa13ebefb634af0f0bc78d
#   confirmed: true
#       owner: qdEFNkdsxFsEbnVUkfhK4rSx1CCgnFFQip
#
#✅  contracts/XC.sol
#        txid: 3d7dac6643a261ba004f5505fd59c1e92fb4c317fc23ec537177d0d45d1a1bda
#     address: 39c8772d312e1066eba6b972d0a893f0c271908b
#   confirmed: true
#       owner: qXTcjD7aTaHnfmLvMrHHtg82U2KtaJ8RNh