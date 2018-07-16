## Run a Cardano explorer node
Run a very lean Cardano explorer node. This is an alternative to having to [do it yourself](https://github.com/input-output-hk/cardano-sl/blob/master/docs/how-to/build-cardano-sl-and-daedalus-from-source-code.md). We've worked hard to make this as simple as possible, so that it is the most stable, easily deployable cardano image out there.

If you're running an Ubuntu box, you can use [this script](https://gist.github.com/EdwardPrentice/1bb589c50260cf030aaed95d3e5fdaa6) to set up a suitable Docker environment. Either way, you'll need Docker installed.

#### Run the container
```
# First, set up some directories we'll use as our volumes
# You're free to change these, just be sure to change the commands below
sudo mkdir -p /cardano/state-wallet-mainnet && sudo chmod -R 777 /cardano/state-wallet-mainnet

docker pull planetcardano/cardano-explorer
docker run -d -v /cardano/state-wallet-mainnet:/home/cardano/cardano-sl/state-wallet-mainnet -p "8090:8090" planetcardano/cardano-explorer:1.2
# TODO FIX curl -sfk https://localhost:8090/api/settings/sync/progress
```

Full source code, including an example [docker-compose.yml](https://github.com/PlanetCardano/cardano-explorer/blob/master/docker-compose.yml) are available on our [Github](https://github.com/planetcardano). This version of the container supports a beta release of the v1 API, which is [documented here](https://cardanodocs.com/technical/wallet/api/v1).

## About
Brought to you with love from [Planet Cardano](planetcardano.io)

Please come and chat with us on [Telegram](t.me/planetcardano)

## Contributing
Please contribute! Anyone that adds a line of code gets a 🍺. Anyone that can remove a line of code gets 🍺🍺🍺🍺🍺🍺!

We want this image to be as simple as possible, so removing complexity is important to us. So is version pinning everything.

If you want to contribute to Cardano and aren't sure where to begin, please [get in touch](t.me/planetcardano) and we'll help you somehow.


### Technical Resources
[Daedalus](https://daedaluswallet.io/)

[Cardano Settlement Layer Source Code](https://github.com/input-output-hk/cardano-sl)

[Cardano Settlement Layer Documentation](https://cardanodocs.com/technical)

