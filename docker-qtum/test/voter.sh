#! /bin/bash

source p_init.sh

# voter(bytes32,address,address,uint256,bytes32   ,bytes32,bytes32,uint8)
fromPlatform="494e4b0000000000000000000000000000000000000000000000000000000000"
fromAccount="0x4230a12f5b0693dd88bb35c79d7e56a68614b199"
toAccount="0x42cae74a99da4cea4c1c6b9e783f858aa9fe16bb"
value=500
txid="ec286f7dd3463a6a9c5384747bc64a8685de44b2c3d3a1156dc0085f758fcd28"
r="0xc7ecd49384a51d5fb610423a30dfcbc963645c1dc37ddab598cb89555d9110f2"
s="0x5d9569fdaafe9a3928649c32806332f4716ccc9fdd740cf6ef8678b97258653e"
v=27
#"INK","0x4230a12f5b0693dd88bb35c79d7e56a68614b199","0x42cae74a99da4cea4c1c6b9e783f858aa9fe16bb",500,"ec286f7dd3463a6a9c5384747bc64a8685de44b2c3d3a1156dc0085f758fcd28","","",27
qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol voter '["'$fromPlatform'","'$fromAccount'","'$toAccount'",'$value',"'$txid'","'$r'","'$s'",'$v']'` 0 6000000 0.0000004 $XCPluginOwner
