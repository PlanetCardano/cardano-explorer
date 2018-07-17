FROM planetcardano/cardano-base:1.2-3

WORKDIR /home/cardano/cardano-sl

RUN . /home/cardano/.nix-profile/etc/profile.d/nix.sh && nix-build -A connectScripts.mainnetExplorer -o connect-explorer-to-mainnet

EXPOSE 8100

CMD ./connect-explorer-to-mainnet
