#! /bin/bash

source p_init.sh
qcli callcontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol getProposal '["5154554d00000000000000000000000000000000000000000000000000000000","ec286f7dd3463a6a9c5384747bc64a8685de44b2c3d3a1156dc0085f758fcd28"]'`

