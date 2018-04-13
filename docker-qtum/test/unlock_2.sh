#! /bin/bash

source p_init.sh

# voter(bytes32,address,address,uint256,bytes32   ,bytes32,bytes32,uint8)
fromPlatform="494e4b0000000000000000000000000000000000000000000000000000000000"
fromAccount="4230a12f5b0693dd88bb35c79d7e56a68614b199"
toAccount="db39e7c2a4009e69804c1d9737db29a133c80e5d"
value=100000
txid="2ba06c917766ac7fe5711da6642593e1941eff10c35ebe0cae700cb4beda39d0"
#sign="d0dbd5c9f1fc491bfdf4b2c9c751608168388f1c15a90767ad88bc63504a5e8a7b347c21c8d537d18949d667d8ae6d2e8d7c61973342c13048722dccc692048001"
#d0dbd5c9f1fc491bfdf4b2c9c751608168388f1c15a90767ad88bc63504a5e8a
#7b347c21c8d537d18949d667d8ae6d2e8d7c61973342c13048722dccc6920480
#01
r="d0dbd5c9f1fc491bfdf4b2c9c751608168388f1c15a90767ad88bc63504a5e8a"
s="7b347c21c8d537d18949d667d8ae6d2e8d7c61973342c13048722dccc6920480"
v=28

# balanceOf
qcli callcontract $INKHexAddress `solar encode contracts/INK.sol balanceOf '["'$toAccount'"]'`

qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol voteProposal '["'$fromPlatform'","'$fromAccount'","'$toAccount'",'$value',"'$txid'","'$r'","'$s'",'$v']'` 0 6000000 0.000001 $XCPluginOwner
sleep 180
#2488a4d8a028c56cc1bab54dfa2b186897f765757877ab638214a8719e06da777fbc930b59d48817eb3230f577b1a66076597a3d8c1370f53cd692d4a6c63d8800
r1="2488a4d8a028c56cc1bab54dfa2b186897f765757877ab638214a8719e06da77"
s1="7fbc930b59d48817eb3230f577b1a66076597a3d8c1370f53cd692d4a6c63d88"
v1=27
qcli sendtocontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol voteProposal '["'$fromPlatform'","'$fromAccount'","'$toAccount'",'$value',"'$txid'","'$r1'","'$s1'",'$v1']'` 0 6000000 0.000001 $XCPluginOwner
sleep 180

qcli sendtocontract $XCHexAddress `solar encode contracts/XC.sol unlock '["'$txid'","'$fromPlatform'","'$fromAccount'","'$toAccount'",'$value']'` 0 6000000 0.000001 $XCPluginOwner
sleep 180

# balanceOf
qcli callcontract $INKHexAddress `solar encode contracts/INK.sol balanceOf '["'$toAccount'"]'`


fromPlatform="494e4b0000000000000000000000000000000000000000000000000000000000"
fromAccount="07caf88941eafcaaa3370657fccc261acb75dfba"
toAccount="ebd027ba8068157216c8bd9636bdb6705b87583c"
value=100000
txid="2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53"

r="61457311d6f01765d8e94f9ecbf8d229a269a0f911d24aafcdaa1237b9e59bb6"
s="5a7f8907f29f5bfafca365da40b515978e90ee1ef20bbf71649314189573e565"
v=27

#txId：2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53
#sign1：
#61457311d6f01765d8e94f9ecbf8d229a269a0f911d24aafcdaa1237b9e59bb6
#5a7f8907f29f5bfafca365da40b515978e90ee1ef20bbf71649314189573e565
#00
#sign2：
r1="5addfa1aba77e7ec2feefdb2fe9c3d7809810bac6c87ceec718a3b094a0432b7"
s1="5e2c34f91b255c575caa6a9114f307cec9d952643dba278e0771971dfc8374f1"
v1=28
#5addfa1aba77e7ec2feefdb2fe9c3d7809810bac6c87ceec718a3b094a0432b7
#5e2c34f91b255c575caa6a9114f307cec9d952643dba278e0771971dfc8374f1
#01
amount：100000
#toPlatform：QTUM
#fromAccount：07caf88941eafcaaa3370657fccc261acb75dfba
#toAccount：ebd027ba8068157216c8bd9636bdb6705b87583c

#! /bin/bash

source p_init.sh


fromPlatform="494e4b0000000000000000000000000000000000000000000000000000000000"
fromAccount="07caf88941eafcaaa3370657fccc261acb75dfba"
toAccount="ebd027ba8068157216c8bd9636bdb6705b87583c"
value=100000
txid="2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53"
#function verifyProposal(bytes32 fromPlatform, address fromAccount, address toAccount, uint value, string txid)
qcli callcontract $XCPluginHexAddress `solar encode contracts/XCPlugin.sol verifyProposal '["'$fromPlatform'","'$fromAccount'","'$toAccount'",'$value',"'$txid'"]'` $XCPluginOwner




txId：b4ef1a961bea892f9fcb5d1aeb65059129791373a8187d8964d6c227c4c5f13a
sign1：7d6c9405c2233d0edbb78a0526b5096030ddb8347394b5d6ed0f58694799671875e6015d4f0abbfd3ba2dd7d36ef247ace26d44e18459968ad11dbafdb32c1fe01
sign2：b1963f0a41a529a5b8bc5a0914789b900d7f9a7b03cbd0a4da2fb957a968478d35d90d65e10e2b222117470d1cf19ab39a3da3d442e5aa4caa818c66eae3080501
amount：100000
toPlatform：QTUM
fromAccount：i07caf88941eafcaaa3370657fccc261acb75dfba
toAccount：ebd027ba8068157216c8bd9636bdb6705b87583c
# verifyProposal
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol verifyProposal '["494e4b0000000000000000000000000000000000000000000000000000000000","07caf88941eafcaaa3370657fccc261acb75dfba","ebd027ba8068157216c8bd9636bdb6705b87583c",100000,"b4ef1a961bea892f9fcb5d1aeb65059129791373a8187d8964d6c227c4c5f13a"]'`
#qdkVBzhos1N9KN7wmfGdRmr9G8PSnTCtfm


# verifyProposal
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol verifyProposal '["494e4b0000000000000000000000000000000000000000000000000000000000","07caf88941eafcaaa3370657fccc261acb75dfba","ebd027ba8068157216c8bd9636bdb6705b87583c",100000,"2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53"]'` qdkVBzhos1N9KN7wmfGdRmr9G8PSnTCtfm

# getProposal
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol getProposal '["494e4b0000000000000000000000000000000000000000000000000000000000","2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53"]'`
#qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol getProposal '["494e4b0000000000000000000000000000000000000000000000000000000000","2ba06c917766ac7fe5711da6642593e1941eff10c35ebe0cae700cb4beda39d0"]'`

#61457311d6f01765d8e94f9ecbf8d229a269a0f911d24aafcdaa1237b9e59bb65a7f8907f29f5bfafca365da40b515978e90ee1ef20bbf71649314189573e56500

# "61457311d6f01765d8e94f9ecbf8d229a269a0f911d24aafcdaa1237b9e59bb6","5a7f8907f29f5bfafca365da40b515978e90ee1ef20bbf71649314189573e565",27

# existPublicKey
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol existPublicKey '["494e4b0000000000000000000000000000000000000000000000000000000000","4230a12f5b0693dd88bb35c79d7e56a68614b199"]'` qdkVBzhos1N9KN7wmfGdRmr9G8PSnTCtfm
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol existPublicKey '["494e4b0000000000000000000000000000000000000000000000000000000000","07caf88941eafcaaa3370657fccc261acb75dfba"]'` qdkVBzhos1N9KN7wmfGdRmr9G8PSnTCtfm

# existPlatform
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol existPlatform '["494e4b0000000000000000000000000000000000000000000000000000000000"]'` qdkVBzhos1N9KN7wmfGdRmr9G8PSnTCtfm

# voteProposal
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol voteProposal '["494e4b0000000000000000000000000000000000000000000000000000000000","07caf88941eafcaaa3370657fccc261acb75dfba","ebd027ba8068157216c8bd9636bdb6705b87583c",100000,"2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53","61457311d6f01765d8e94f9ecbf8d229a269a0f911d24aafcdaa1237b9e59bb6","5a7f8907f29f5bfafca365da40b515978e90ee1ef20bbf71649314189573e565",27]'` qdkVBzhos1N9KN7wmfGdRmr9G8PSnTCtfm

# getCallers
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol getCallers '[]'` qdkVBzhos1N9KN7wmfGdRmr9G8PSnTCtfm

# existCaller
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol existCaller '["4230a12f5b0693dd88bb35c79d7e56a68614b199"]'`
qcli callcontract 32fbd6b99a0d7b733a826ec738d88618340a3308 `solar encode contracts/XCPlugin.sol existCaller '["07caf88941eafcaaa3370657fccc261acb75dfba"]'`

"INK","0x07caf88941eafcaaa3370657fccc261acb75dfba",   "0xebd027ba8068157216c8bd9636bdb6705b87583c",100000,"2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53","0x61457311d6f01765d8e94f9ecbf8d229a269a0f911d24aafcdaa1237b9e59bb6","0x5a7f8907f29f5bfafca365da40b515978e90ee1ef20bbf71649314189573e565",27
INK:   0x07caf88941eafcaaa3370657fccc261acb75dfba:QTUM:0xebd027ba8068157216c8bd9636bdb6705b87583c:100000:2572300fe2d8a674de90b46d06f9bf86d984f2fa7da9b20acf38b6ecf6934a53
0x8ea1157dd1ddd95cfea653d44ceb41cc8750b64aa73660cfb0f7a3d2bf43990a
0x06aa6633a2455a21db0ca44dab7039ed292d0cc4c2ac6cdaad6b50cce24c7773
0xe28a7572b3688bebdb169620926d3d1a50b09881

0x07caf88941eafcaaa3370657fccc261acb75dfba
