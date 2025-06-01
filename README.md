# Gas Sponsorship Tracker

## What is this project?

Gas Sponsorship Tracker is a smart contract project built with Solidity and deployed locally using Foundry. It allows users to "sponsor" or pay gas fees on behalf of other Ethereum addresses. This can be helpful in scenarios where someone wants to support friends, dApps, or services by covering their transaction costs.

---

## Why build this?

In Ethereum and other EVM-compatible chains, users need to pay gas fees to execute transactions. However, there are cases where you might want to help others by sponsoring their gas fees. This project aims to enable that in a decentralized and transparent way.

Use cases include:

- Supporting new users who don't have enough ETH for gas fees
- Enabling dApps to sponsor gas fees for users to improve UX
- Community sponsorship programs for projects and events

---

## Features

- Users can deposit ETH to sponsor gas fees
- Track sponsorship balances for each sponsored address
- Withdraw sponsored funds
- Designed for easy integration with frontends and dApps

---

## Tech Stack

- Solidity — Smart contract language
- Foundry — Development, testing, and deployment toolkit
- Anvil — Local Ethereum node emulator

---

## Getting Started

1. Clone the repository
2. Install Foundry
3. Run Anvil to start a local blockchain
4. Deploy the contract using Foundry's forge script commands
5. Interact with the contract via scripts or your own frontend

---

## How to Deploy

```bash
forge script script/Deploy.s.sol --rpc-url http://127.0.0.1:8545 --private-key <YOUR_PRIVATE_KEY> --broadcast

```

## License

MIT License
