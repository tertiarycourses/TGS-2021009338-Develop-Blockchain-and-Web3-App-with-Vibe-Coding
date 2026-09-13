# Develop Blockchain and Web3 App with Vibe Coding

Build, test, and document Solidity smart contracts and Web3 applications using AI-assisted coding and realistic test-chain activities.

| Course detail | Information |
|---|---|
| Course code | `TGS-2021009338` |
| Programme | WSQ |
| Duration | 2 days, 16 hours total (13.5 training + 2.5 assessment) |
| Registration | [View course details and register](https://www.tertiarycourses.com.sg/wsq-develop-blockchain-and-web3-app-with-vibe-coding.html) |
| Funding | Up to 70% for eligible learners or employers. Eligibility and terms apply. |

## About the course

Develop practical blockchain applications through requirements analysis, prompt-driven Solidity and Python coding, contract testing, wallet integration, and deployment documentation. Certificate verification and product custody scenarios connect digital evidence to realistic business requirements.

## Learning outcomes

- Analyze business requirements for blockchain, cryptocurrency, smart contracts, and token economics.
- Code Ethereum smart contracts using Solidity.
- Test smart contracts and monitor their outputs.
- Deploy smart contracts and maintain accurate coding documentation.

## Topics covered

1. Blockchain, cryptocurrency, smart contracts, and token economics.
2. Ethereum applications and Solidity development with Vibe Coding.
3. Smart contract testing, Ether, gas fees, and transaction monitoring.
4. Smart contract deployment, token standards, and Web3 integration.

## Activities

Each folder contains a Solidity contract, Python Web3 script, mock data, AI generation prompts, pinned dependencies, and a detailed guide with expected evidence and troubleshooting.

- [Activity 01: Hash and anchor certificate evidence](labs/activity-01-hash-evidence/README.md)
- [Activity 02: Map buyer requirements to Ether escrow](labs/activity-02-requirements-escrow/README.md)
- [Activity 03: Compile and review a supplier purchase order](labs/activity-03-solidity-order/README.md)
- [Activity 04: Issue and transfer ERC-20 workshop credits](labs/activity-04-erc20-credits/README.md)
- [Activity 05: Issue and revoke ERC-721 course certificates](labs/activity-05-certifynft/README.md)
- [Activity 06: Track custody for pharmaceutical batches](labs/activity-06-supplyverify/README.md)
- [Activity 07: Test eligible voting and duplicate controls](labs/activity-07-ballot-tests/README.md)
- [Activity 08: Verify withdrawal controls against reentrancy](labs/activity-08-reentrancy-review/README.md)
- [Activity 09: Measure gas for storage transition classes](labs/activity-09-gas-monitoring/README.md)
- [Activity 10: Index receipt events and reconcile records](labs/activity-10-event-indexing/README.md)
- [Activity 11: Publish a reproducible local deployment manifest](labs/activity-11-deployment-evidence/README.md)
- [Activity 12: Connect a wallet and verify a certificate dApp](labs/activity-12-wallet-dapp/README.md)

## Public package and usage

The `courseware/` folder contains the current visual slide deck, Learner Guide, and Lesson Plan in their delivered formats. The Learner Guide Markdown mirror and `labs/activity-*` folders provide detailed activity procedures. Follow an activity guide to install its pinned dependencies and run its Python script on the isolated local test chain.

Current release: **v18.1** (13 September 2026). The editable deck is [Develop Blockchain and Web3 App with Vibe Coding-v18.1.pptx](courseware/Develop%20Blockchain%20and%20Web3%20App%20with%20Vibe%20Coding-v18.1.pptx); its PDF and the LG/LP PDFs are alongside it. See [the release history](courseware/CHANGELOG.md).

The local EVM route uses compiled Solidity bytecode with Py-EVM. The persistent local RPC, browser wallet, and public Sepolia routes are separate exercises: use their guide checks and retain actual receipts before recording completion. Test-chain assets have no monetary value; use dedicated test wallets.

Companion examples: [CertifyNFT](https://alfredang.github.io/certifynft/), [SupplyVerify](https://alfredang.github.io/supplyverify/), and [Hash Generator](https://alfredang.github.io/hashgenerator/).

## Distribution boundary

This public repository contains learner courseware and activity resources. Assessment papers, answer keys, private administration, source reference collections, credentials, and internal build/QA tooling are excluded. Learners access authorized assessment papers through the LMS; marking guides remain trainer-only.

Provided by **Tertiary Infotech Academy Pte Ltd**. [Tertiary Courses Singapore](https://www.tertiarycourses.com.sg/).
