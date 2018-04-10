#! /bin/bash

#QTUM
myPlatform="5154554d00000000000000000000000000000000000000000000000000000000"

#INK
otherPlatform="494e4b0000000000000000000000000000000000000000000000000000000000"
otherPlatformPubKey="4230a12f5b0693dd88bb35c79d7e56a68614b199"
otherPlatformPubKey2="4230a12f5b0693dd88bb35c79d7e56a68614b199"

INKHexAddress="025541f433e581866806059aa01838a489d3b42c"
INKAddress=`qcli fromhexaddress $INKHexAddress`
INKOwner="qZSt6V1AXzbd9Lrez8SNxdWNVFqXUV5DVX"
INKHexOwner=`qcli gethexaddress $INKOwner`

XCHexAddress="7925959b92057096194057366c0ca1c60c8c763c"
XCAddress=`qcli fromhexaddress ${XCHexAddress}`
XCOwner="qPMUZCT5yzrvicerscZKgDaWykTi6DUTR9"
XCHexOwner=`qcli gethexaddress ${XCOwner}`

XCPluginHexAddress="4046f6b3de8482fe702c1eb2a007b2154c98fdd0"
XCPluginAddress=`qcli fromhexaddress ${XCPluginHexAddress}`
XCPluginOwner="qRapLk25oj2oi8iNtggh5eApCd71PEJWtX"
XCPluginHexOwner=`qcli gethexaddress ${XCPluginOwner}`

#✅  contracts/INK.sol
#        txid: 41617b9b16c7e4513e8d69dd0073a64fb4ee1a9c50ee1ae214499921c6bbdc2c
#     address: 025541f433e581866806059aa01838a489d3b42c
#   confirmed: true
#       owner: qZSt6V1AXzbd9Lrez8SNxdWNVFqXUV5DVX
#
#✅  contracts/XC.sol
#        txid: ec00d5bf2b1b36a1ac2846656a31be655a7951e96d5fe6ea5c4be06f65ebcee2
#     address: 7925959b92057096194057366c0ca1c60c8c763c
#   confirmed: true
#       owner: qPMUZCT5yzrvicerscZKgDaWykTi6DUTR9
#
#✅  contracts/XCPlugin.sol
#        txid: 5d4050dbf49888ee0a67ca4b39a1307c7e973afa578fd5e1ca784d918983bc57
#     address: 4046f6b3de8482fe702c1eb2a007b2154c98fdd0
#   confirmed: true
#       owner: qRapLk25oj2oi8iNtggh5eApCd71PEJWtX
