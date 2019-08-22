# Block Producer Guideline
The purpose of this document is to provide a guideline for Block Producers on setting up a CAN Producer Node. Target audiences are preferably technical personnels with prior experience on network infrastructure and server setup.  

## Dependencies
Follow this [CAN repository](https://github.com/canfoundation/CAN) to install the required dependencies.

## Setup Producer Node
Clone the code repository:
```
git clone --single-branch --branch bp_node https://github.com/canfoundation/can-node
cd can-node
cd producer-node
```
Set the following configuration in ```start.sh``` ```genesis_start.sh``` ```hard_start.sh``` file:
```
BPACCOUNT = {Producer Name}
PUBKEY = {Public Key}
PRIKEY = {Private Key}
--http-server-address 127.0.0.1:{HTTP Port} \
--p2p-listen-endpoint 0.0.0.0:{P2P Port}\
--p2p-peer-address {Peer 1}
--p2p-peer-address {Peer 2}
--p2p-peer-address {Peer 3}
--p2p-peer-address {Peer 4}
```
Set permission to run the shell scripts:
```
sudo chmod 755 start.sh genesis_start.sh hard_start.sh stop.sh clean.sh
```
### Initiate Producer Node
Only run this script if you start for the first time or deleted blockchain folder:
```
./genesis_start.sh
```
Check block synchronization status:
```
cd blockchain
tail -f nodeos.log
```
### Stop Producer Node
To stop the node, run the following script:
```
./stop.sh
```
### Start Producer Node
To start the node again, run the following script:
```
./start.sh
```
If you run into an error like ```"perhaps we need to replay"```, run this script to replay all the transactions from the genesis block:
```
./hard_start.sh
```
### Clean Blockchain Data
If your blockchain data is faulty and need to be built again, follow the below sequence:
```
./stop.sh
./clean.sh
./genesis_start.sh
```

## Infrastructure Recommendation
At the minimum, we recommend to setup the cloud server with at least 3 layers as of below:
1. Full Node Layer: full nodes to relay blocks and release APIs to other backend services.
2. Seed Layer: peer seed nodes to establish VPN connections with trusted BPs.
3. Block Production Layer: where our BP nodes are located privately with a Master producing node and a Slave node to take over production in case the Master node is in a failure state.

![alt text](https://www.lucidchart.com/publicSegments/view/7b73f835-bacc-4cfb-a57c-e9ac079e110d/image.jpeg)
