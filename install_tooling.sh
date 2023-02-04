#!/bin/sh

cd /usr/local/bin

# Install Conventional Commits - Cocogitto (`cog`)
CURRENT_REPO="cocogitto/cocogitto"
CURRENT_VERSION=$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"')
wget https://github.com/${CURRENT_REPO}/releases/download/${CURRENT_VERSION}/cocogitto-${CURRENT_VERSION}-x86_64-unknown-linux-musl.tar.gz -O - | zcat - | tar xvf - cog

# Install Just (`just`)
CURRENT_REPO="casey/just"
CURRENT_VERSION=$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"')
wget https://github.com/${CURRENT_REPO}/releases/download/${CURRENT_VERSION}/just-${CURRENT_VERSION}-x86_64-unknown-linux-musl.tar.gz -O - | zcat - | tar xvf - just

# Install Difftastic (`difft`)
CURRENT_REPO="Wilfred/difftastic"
CURRENT_VERSION=$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"')
wget https://github.com/${CURRENT_REPO}/releases/download/${CURRENT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz -O - | zcat - | tar xvf - difft

# Install Watchexec (`watchexec`)
CURRENT_REPO="watchexec/watchexec"
CURRENT_VERSION="$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"' | cut -c 2-)"
wget https://github.com/${CURRENT_REPO}/releases/download/v${CURRENT_VERSION}/watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl.tar.xz -O -  | tar -Jxvf - "watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl/watchexec"
mv ./watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl/watchexec ./
rm -rf watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl

# Install Dfinity candid (`didc`)
CURRENT_REPO="dfinity/candid"
CURRENT_VERSION=$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"')
wget https://github.com/${CURRENT_REPO}/releases/download/${CURRENT_VERSION}/didc-linux64
chmod +x didc-linux64
mv didc-linux64 didc


# Install Cargo audit (`cargo-audit`)
CURRENT_REPO="rustsec/rustsec"
CURRENT_TAG_NAME=$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq 'map(select (.tag_name | startswith("cargo-audit"))) | first | .tag_name' | tr -d '"')
CURRENT_VERSION=$(echo ${CURRENT_TAG_NAME} | cut -d '/' -f 2)
wget https://github.com/${CURRENT_REPO}/releases/download/cargo-audit/${CURRENT_VERSION}/cargo-audit-x86_64-unknown-linux-musl-${CURRENT_VERSION}.tgz -O - | zcat - | tar xvf - "cargo-audit-x86_64-unknown-linux-musl-${CURRENT_VERSION}/cargo-audit"
mv ./cargo-audit-x86_64-unknown-linux-musl-${CURRENT_VERSION}/cargo-audit ./
rm -rf ./cargo-audit-x86_64-unknown-linux-musl-${CURRENT_VERSION}

# Install IC tooling: `ic-wasm`. 
CURRENT_REPO="dfinity/ic-wasm"
CURRENT_VERSION=$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"')
wget https://github.com/${CURRENT_REPO}/releases/download/${CURRENT_VERSION}/ic-wasm-linux64 -O ic-wasm
chmod +x ic-wasm
