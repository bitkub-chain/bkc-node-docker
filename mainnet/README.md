# Bitkub Chain (PoS) main Network


### Clone
```bash
$ git clone https://github.com/bitkub-chain/bkc-node-docker.git
$ cd bkc-node-docker/mainnet
```

### Running a Validator
```bash
# Create data dir
$ mkdir ./data

# Create password file
$ echo "<<YourPassword>>" > ./data/password.sec

# Generate account
$ docker run -v ./data:/var/lib/bkc/data bitkubchainorg/node account new --datadir /var/lib/bkc/data --password /var/lib/bkc/data/password.sec

# Copy the Account Address from the previous step.
$ echo "ACCOUNT_ADDRESS=<<YourAddress>>" > validator.env

# Run 
$ docker compose -f docker-compose.validator.yaml up -d
```


### Running a Fullnode
```bash
# Run 
$ docker compose -f docker-compose.fullnode.yaml up -d
```

### Running a Archivenode
```bash
# Run 
$ docker compose -f docker-compose.archivenode.yaml up -d
```