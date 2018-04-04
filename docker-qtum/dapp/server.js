const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const ora = require("ora")
// const parseArgs = require("minimist")

const {
    Qtum
} = require("qtumjs")

const repoData = require("../solar.development")
const qtum = new Qtum("http://qtum:test@localhost:3889", repoData)
const contracts = {
    "INK": "contracts/INK.sol",
    "XC": "contracts/XC.sol",
    "XCPlugin": "contracts/XCPlugin.sol",
}

const XCPlugin = repoData.contracts[contracts["XCPlugin"]]
const INK = repoData.contracts[contracts["INK"]]
const XC = repoData.contracts[contracts["XC"]]

// application/x-www-form-urlencoded
const urlencodedParser = bodyParser.urlencoded({extended: false})

app.use(express.static('public'));

async function call(contract,method,params,fromAddr) {
    var name = contracts[contract];
    var abi = repoData.contracts[name].abi
    for (var i=0; i < abi.length; i++) {
        var a = abi[i]
        if (a.name == method && a.type == "function") {
            if (a.constant){
                var result = await qtum.contract(name).call(method,params)
                console.log("log:", result.outputs[0])
                return result.outputs
            }else{
                const tx = await qtum.contract(name).send(method,params, {
                    senderAddress: fromAddr,
                    gasLimit: 40000000,
                })
                console.log("transfer tx:", tx.txid)
                console.log(tx)
                // or: await tx.confirm(1)
                const confirmation = tx.confirm(3)
                ora.promise(confirmation, "confirm transfer")
                await confirmation
            }
        }
    }
}

app.post('/xc/init/', urlencodedParser,async function (req, res) {

    var result = await call("XCPlugin","addPlatform",[req.body.platform], XCPlugin.sender)
    console.log("XCPlugin addPlatform:",result)

    result = await call("XCPlugin","addPublicKey",[req.body.platform,req.body.publicKey], XCPlugin.sender)
    console.log("XCPlugin addPublicKey:",result)

    result = await call("XCPlugin","addCaller",[XC.address], XCPlugin.sender)
    console.log("XCPlugin addCaller:",result)

    // XC
    result = await call("XC","setINK",[INK.address], XC.sender)
    console.log("XC setINK:",result)

    result = await call("XC","setXCPlugin",[XCPlugin.address], XC.sender)
    console.log("XC setXCPlugin:",result)

    // start
    result = await call("XCPlugin","start",[], XCPlugin.sender)
    console.log("XCPlugin start:",result)

    result = await call("XC","start",[], XC.sender)
    console.log("XC start:",result)
    var response = {
        "ok":"ok"
    };
    res.end(JSON.stringify(response));
});

app.post('/xc/out/', urlencodedParser,async function (req, res) {

    var result = await call("INK","approve",[XC.address,req.body.value],INK.sender)
    console.log("approve:",result)
    var result2 = await call("INK","allowance",[INK.senderHex,XC.address])
    console.log("allowance:",result2[0].toString())

    var result3 = await call("XC","lock",[req.body.toPlatform,req.body.toAccount,req.body.value],INK.sender)
    console.log("lock:",result3)

    var result4 = await call("XC","lockBalance")
    console.log("lock:",result4)

    var response = {
        "lockBalance":result4.toString()
    };
    console.log(response);
    res.end(JSON.stringify(response));
});

app.post('/xc/in/', urlencodedParser,async function (req, res) {
    var prefix = "0x"
    var r = prefix + req.body.sign.substr(0,64)
    var s = prefix + req.body.sign.substr(64,64)
    var v = req.body.sign.substr(128,2)
    var _v = 27;
    if ( v == '00' || v == '1b') {
        _v = 27
    } else if ( v == '01' || v == '1c') {
        _v = 28
    }
    var fromPlatform = req.body.fromPlatform;
    var fromAccount = prefix+req.body.fromAccount;
    var toAccount = prefix+req.body.toAccount;

    console.log(fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid, r, s, _v, XCPlugin.sender)
    // return

    var result = await call("XCPlugin","voter",[fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid, r, s, _v], XCPlugin.sender)
    console.log("voter:",result)
    // return
    result = await call("XCPlugin","verifyProposal",[fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid])
    console.log("verifyProposal:",result)

    // return
    result = await call("XC","unlock",[req.body.txid, fromPlatform, fromAccount, toAccount, req.body.value],XCPlugin.sender)
    console.log("unlock:",result)

    result = await call("XC","lockBalance")
    console.log("lockBalance:",result)

    var response = {
        "lockBalance":result.toString()
    };
    console.log(response);
    res.end(JSON.stringify(response));
});

app.post('/xc/voter/', urlencodedParser,async function (req, res) {
    var prefix = "0x"
    var r = req.body.sign.substr(0,64)
    var s = req.body.sign.substr(64,64)
    var v = req.body.sign.substr(128,2)
    var _v = 27;
    if ( v == '00' || v == '1b') {
        _v = 27
    } else if ( v == '01' || v == '1c') {
        _v = 28
    }
    var fromPlatform = req.body.fromPlatform;
    var fromAccount = prefix+req.body.fromAccount;
    var toAccount = prefix+req.body.toAccount;

    console.log(fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid, r, s, _v, XCPlugin.sender)

    var result = await call("XCPlugin","voter",[fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid, r, s, _v], XCPlugin.sender)
    console.log("voter:",result)

    var response = {
        "voter": ""
    };
    console.log(response);
    res.end(JSON.stringify(response));
});

app.post('/xc/verifyProposal/', urlencodedParser,async function (req, res) {
    var prefix = "0x"
    var r = prefix + req.body.sign.substr(0,64)
    var s = prefix + req.body.sign.substr(64,64)
    var v = req.body.sign.substr(128,2)
    var _v = 27;
    if ( v == '00' || v == '1b') {
        _v = 27
    } else if ( v == '01' || v == '1c') {
        _v = 28
    }
    var fromPlatform = req.body.fromPlatform;
    var fromAccount = prefix+req.body.fromAccount;
    var toAccount = prefix+req.body.toAccount;

    console.log(fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid, r, s, _v, XCPlugin.sender)

    var result = await call("XCPlugin","verifyProposal",[fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid])
    console.log("verifyProposal:",result)

    var response = {
        "verifyProposal":result
    };
    console.log(response);
    res.end(JSON.stringify(response));
});

app.post('/xc/unlock/', urlencodedParser,async function (req, res) {
    var prefix = "0x"
    var r = prefix + req.body.sign.substr(0,64)
    var s = prefix + req.body.sign.substr(64,64)
    var v = req.body.sign.substr(128,2)
    var _v = 27;
    if ( v == '00' || v == '1b') {
        _v = 27
    } else if ( v == '01' || v == '1c') {
        _v = 28
    }
    var fromPlatform = req.body.fromPlatform;
    var fromAccount = prefix+req.body.fromAccount;
    var toAccount = prefix+req.body.toAccount;

    console.log(fromPlatform, fromAccount, toAccount, req.body.value, req.body.txid, r, s, _v, XCPlugin.sender)
    // return
    result = await call("XC","unlock",[req.body.txid, fromPlatform, fromAccount, toAccount, req.body.value],XCPlugin.sender)
    console.log("unlock:",result)

    result = await call("XC","lockBalance")
    console.log("lockBalance:",result)

    var response = {
        "lockBalance":result.toString()
    };
    console.log(response);
    res.end(JSON.stringify(response));
});

app.post('/xc/lockBalance/', urlencodedParser,async function (req, res) {
    var result = await call("XC","lockBalance")
    console.log("lockBalance:",result)

    var response = {
        "lockBalance":result.toString()
    };
    console.log(response);
    res.end(JSON.stringify(response));
});


app.post('/xc/balanceOf/', urlencodedParser,async function (req, res) {

    var result = await call("INK","balanceOf",[req.body.account])
    console.log("balanceOf:",result)

    var response = {
        "balanceOf":result.toString()
    };
    console.log(response);
    res.end(JSON.stringify(response));
});



var server = app.listen(8080, function () {
    var host = server.address().address
    var port = server.address().port
    console.log("http://%s:%s", host, port)
});
