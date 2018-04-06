# XC QTUM Document

本文档主要介绍跨链资产转账的公链侧（QTUM）的实现

## 准备环境

QTUM 环境的安装，我们使用Docker来快速部署环境。

### 安装Docker 
https://docs.docker.com/install

### 下载镜像 

> docker pull hayeah/qtumportal:latest；
也可以使用 
> sh docker-qtum/download_images.sh 

### 启动镜像

regtest
> docker run -d --rm --name qtumd_node \
    -v ${PWD}:/dapp \
    -p 9899:9899 \
    -p 9888:9888 \
    -p 3889:3889 \
    -p 3888:3888 \
    -p 13888:13888 \
    hayeah/qtumportal:latest
    
testnet
> docker run -d --rm --name qtumd_node \
    -e "QTUM_NETWORK=testnet" \
    -v ${PWD}:/dapp \
    -p 9899:9899 \
    -p 9888:9888 \
    -p 3889:3889 \
    -p 3888:3888 \
    -p 13888:13888 \
    hayeah/qtumportal:latest

mainnet
> docker run -d --rm --name qtumd_node \
    -e "QTUM_NETWORK=mainnet" \
    -v ${PWD}:/dapp \
    -p 9899:9899 \
    -p 9888:9888 \
    -p 3889:3889 \
    -p 3888:3888 \
    -p 13888:13888 \
    hayeah/qtumportal:latest

可以使用 start.sh 启动
> cd docker-qtum
> sh start.sh
    
备注:
若使用regtest模式登录镜像之后，则需要执行 qcli generate 600 或者 sh docker-qtum/generate.sh 获取第一批资金;
若使用testnet模式，则需要登录页面 http://testnet-faucet.qtum.info 领取测试币;
若使用mainnet模式，则需要自己想办法了...
                     
### 登录镜像

> docker exec -it qtumd_node sh
或
> sh docker-qtum/login.sh

> qcli generate 600
或
> sh generate.sh

### 发布合约

> sh deploy.sh

```
exec: solc [contracts/INK.sol --combined bin,metadata --optimize --allow-paths /dapp]
🚀  All contracts confirmed
   deployed contracts/INK.sol => e3797cce46935d101fd2f0aed97bb90942d7ebe5
exec: solc [contracts/XCPlugin.sol --combined bin,metadata --optimize --allow-paths /dapp]
🚀  All contracts confirmed
   deployed contracts/XCPlugin.sol => 4d646714810702415446a1115dcc98ab0a57d0d2
exec: solc [contracts/XC.sol --combined bin,metadata --optimize --allow-paths /dapp]
🚀  All contracts confirmed
   deployed contracts/XC.sol => 4077b42542400fc83e0d40d2ddd5e95030d8f2e4
```
   
> sh deploy_status.sh

```
✅  contracts/INK.sol
        txid: 69a8db955968d4d69727f0f2b8d99b01b3983deb8f61b3129d5da955d912366b
     address: e3797cce46935d101fd2f0aed97bb90942d7ebe5
   confirmed: true
       owner: qJ1HrnP8mLW85F5o6iyN5EPHtZsjPs5jze

✅  contracts/XC.sol
        txid: 994bd934ac82a06444e87992c6a3977f334ea6180172af4968d61723bee1380c
     address: 4077b42542400fc83e0d40d2ddd5e95030d8f2e4
   confirmed: true
       owner: qZaLBNiHxG5oBEMWhmKJ2nf78g9p2zyYV3

✅  contracts/XCPlugin.sol
        txid: 1b242d2ac050aa5bf3865854836db70c882e60da8db95bbf3ee85890b91d48c8
     address: 4d646714810702415446a1115dcc98ab0a57d0d2
   confirmed: true
       owner: qb1rbaQYVaqpsK5aHGbj1RKeyt8xYUpthg
```
       

### 初始化合约环境

更改对于的合约地址
> vim p_init.sh

```
INKHexAddress="e3797cce46935d101fd2f0aed97bb90942d7ebe5"
INKAddress=`qcli fromhexaddress $INKHexAddress`
INKOwner="qJ1HrnP8mLW85F5o6iyN5EPHtZsjPs5jze"
INKHexOwner=`qcli gethexaddress $INKOwner`


XCHexAddress="4077b42542400fc83e0d40d2ddd5e95030d8f2e4"
XCAddress=`qcli fromhexaddress ${XCHexAddress}`
XCOwner="qZaLBNiHxG5oBEMWhmKJ2nf78g9p2zyYV3"
XCHexOwner=`qcli gethexaddress ${XCOwner}`


XCPluginHexAddress="4d646714810702415446a1115dcc98ab0a57d0d2"
XCPluginAddress=`qcli fromhexaddress ${XCPluginHexAddress}`
XCPluginOwner="qb1rbaQYVaqpsK5aHGbj1RKeyt8xYUpthg"
XCPluginHexOwner=`qcli gethexaddress ${XCPluginOwner}`
```

初始化操作者资金
> sh asset.sh

```
c9eb0f902ddfb1affc85848228882d4a75230c30affe4d21a61c83a539ab6525
4506bd2d2fc4b5b50a09cd5257a42878269d3541b0ba7fd030ae035397a2b2a3
2349f49550890ff481d95244798e6066054aaac06dac78bd4c595981f18ef742
da0736f956d6c0e5e0474652d45e120b8bf91ca6e2e0d345cc58bf597f371336
```

## 快速起步

在新窗口中，启动测试跨链Dapp

> cd dapp
> npm install
```
npm WARN dapp@1.0.0 No description
npm WARN dapp@1.0.0 No repository field.
```
> node server.js
```
added 116 packages in 3.599s
localhost:dapp m$ node server.js
http://:::8080
```
INIT 初始化合约信息
OUT 跨链转出
IN 跨链转入（由于网络有延迟问题，提供了分步操作）
LockBalance 合约锁定金额
balanceOf 查询账户余额

在浏览器中访问 http://localhost:8080/

注：在测试的过程中由于区块链有耗时操作，需要你耐心等待一下（不过你可以再控制台观察程序执行的动态）。
