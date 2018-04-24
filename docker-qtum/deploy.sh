#! /bin/bash

source p_init.sh

solar deploy contracts/Token.sol

solar deploy contracts/XCPlugin.sol

solar deploy contracts/XC.sol
