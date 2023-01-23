#!/bin/sh

cd /usr/local/bin

# Install Conventional Commits - Cocogitto (`cog`)
wget https://github.com/cocogitto/cocogitto/releases/download/5.2.0/cocogitto-5.2.0-x86_64-unknown-linux-musl.tar.gz -O - | zcat - | tar xvf - cog

# Install Just (`just`)
wget https://github.com/casey/just/releases/download/1.12.0/just-1.12.0-x86_64-unknown-linux-musl.tar.gz -O - | zcat - | tar xvf - just

# Install Difftastic (`difft`)
wget https://github.com/Wilfred/difftastic/releases/download/0.42.0/difft-x86_64-unknown-linux-gnu.tar.gz -O - | zcat - | tar xvf - difft

# Install Dfinity candid (`didcv`)
wget https://github.com/dfinity/candid/releases/download/2022-11-17/didc-linux64
chmod +x didc-linux64
mv didc-linux64 didc

# Install Cargo audit (`cargo-audit`)
wget https://github.com/rustsec/rustsec/releases/download/cargo-audit/v0.17.4/cargo-audit-x86_64-unknown-linux-musl-v0.17.4.tgz -O - | zcat - | tar xvf - "cargo-audit-x86_64-unknown-linux-musl-v0.17.4/cargo-audit"
mv ./cargo-audit-x86_64-unknown-linux-musl-v0.17.4/cargo-audit ./
rm -rf ./cargo-audit-x86_64-unknown-linux-musl-v0.17.4

# Install IC tooling: `ic-wasm`. 
wget https://github.com/dfinity/ic-wasm/releases/download/0.3.2/ic-wasm-linux64 -O ic-wasm
chmod +x ic-wasm
