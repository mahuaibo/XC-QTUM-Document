#! /bin/bash

#QTUM
myPlatform="5154554d00000000000000000000000000000000000000000000000000000000"

#INK
otherPlatform="494e4b0000000000000000000000000000000000000000000000000000000000"
otherPlatformPubKey="4230a12f5b0693dd88bb35c79d7e56a68614b199"

INKHexAddress="591bca5a4555beb56e2a3f3e0d7fd124611d0347"
INKAddress=`qcli fromhexaddress $INKHexAddress`
INKOwner="qaGA9d5SMct9oiWZ4vmh73AC7EVuAMEVdB"
INKHexOwner=`qcli gethexaddress $INKOwner`

XCHexAddress="fa2488cc521939986831e7200af7a33c4c4543e8"
XCAddress=`qcli fromhexaddress ${XCHexAddress}`
XCOwner="qf3sJzmy6mhfKLcPUGtKwDjngt8H5QGnAD"
XCHexOwner=`qcli gethexaddress ${XCOwner}`

XCPluginHexAddress="0ac3d54cfc9853eb224bdb6c971b6e1824dd7bc0"
XCPluginAddress=`qcli fromhexaddress ${XCPluginHexAddress}`
XCPluginOwner="qcw9oNeuHo6STc2H3C421F1pGAA2QVmqJR"
XCPluginHexOwner=`qcli gethexaddress ${XCPluginOwner}`

#✅  contracts/INK.sol
#        txid: 73e5a0cecf906be5bbd1dc2de5d98717881d121330a4579bb950c9cf5f481b73
#     address: 591bca5a4555beb56e2a3f3e0d7fd124611d0347
#   confirmed: true
#       owner: qaGA9d5SMct9oiWZ4vmh73AC7EVuAMEVdB
#
#✅  contracts/XC.sol
#        txid: 7cf0ff8edfaba21ae236cea131cc60c6504185fb12645be2d6c34f1d20acde65
#     address: fa2488cc521939986831e7200af7a33c4c4543e8
#   confirmed: true
#       owner: qf3sJzmy6mhfKLcPUGtKwDjngt8H5QGnAD
#
#✅  contracts/XCPlugin.sol
#        txid: 6d95273537fce657c9cbdee68e566f45001140243c51917c115c62705466f231
#     address: 0ac3d54cfc9853eb224bdb6c971b6e1824dd7bc0
#   confirmed: true
#       owner: qcw9oNeuHo6STc2H3C421F1pGAA2QVmqJR