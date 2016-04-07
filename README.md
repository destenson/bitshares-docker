# BitShares Dockerfiles

## Buildig Containers

```
docker-compose build
```

### EC2
    
    sudo yum install -y docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    # logout and log back in to allow this to take effect)
    docker info
    git clone https://github.com/xeroc/bitshares-docker.git
    cd bitshares-docker

## Using Containers

### Graphene Fullnode/Witness

 * (optional) If you want to produce blocks and have shareholder approval for
   your witness, then you need to configure your node for block production by
   adding the witness-id and the public/private-key to the configuration file
   `conf/witness/witness.conf`.

   ```
   # ID of witness controlled by this node (e.g. "1.6.5", quotes are required, may specify multiple times)
   witness-id = "1.6.5"
   # Tuple of [PublicKey, WIF private key] (may specify multiple times)
   private-key = ["BTS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"]

   ```

 * Run the node/witness with `docker-compose up node`

### CLI-Wallet

 1. Prepare your `wallet.json` file using the regular CLI-wallet

    * For block production: Import you witnesses private key to sign price
      feeds later
    * For exchanges: Import your account's *active* key to allow spending funds

 2. Put the wallet.json file into the correct condiguration directory `conf/cli-wallet/wallet.json`.
 3. Running: `docker-compose up cli-wallet`
 4. This container opens a RPC port 8092 for localhost
 5. It requires unlocking of the wallet file via RPC

### BTS Price Feeds

 1. Configuration `conf/pricefeed/config.py`
 2. Running: `docker-compose up price-feeds`
 3. It requires unlocking of the wallet file via RPC

### Webwallet

`docker-compose up web-wallet`
