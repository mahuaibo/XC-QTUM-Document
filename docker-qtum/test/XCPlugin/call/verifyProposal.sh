#! /bin/bash

source p_init.sh
qcli callcontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol verifyProposal '["5154554d00000000000000000000000000000000000000000000000000000000","0x4230a12f5b0693dd88bb35c79d7e56a68614b199","0x42cae74a99da4cea4c1c6b9e783f858aa9fe16bb",500,"ec286f7dd3463a6a9c5384747bc64a8685de44b2c3d3a1156dc0085f758fcd28"]'`

#qcli callcontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol verifyProposal '["'$1'","'$2'","'$3'",'$4',"'$5'"]'` $XCPluginOwner
# verifyProposal(bytes32,address,address,uint256,bytes32)
