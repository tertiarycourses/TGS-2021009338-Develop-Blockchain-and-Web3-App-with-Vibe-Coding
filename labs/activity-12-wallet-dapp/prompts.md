# Vibe Coding prompt

Act as a Solidity and Python Web3 developer. Build connect a wallet and verify a certificate dapp for an isolated test chain. Use Solidity 0.8.30 and web3.py 8.0.0 with EthereumTesterProvider backed by Py-EVM; also allow --rpc for an isolated unlocked local JSON-RPC test chain. Requirements: EIP-1193 provider checks chain ID then eth_call ownerOf/documentHash; explicit local-RPC deployment provides manifest. Read mock-data.json, derive a canonical SHA-256 digest where required, compile using pinned solc-js 0.8.30, deploy actual EVM bytecode, wait for every receipt and assert receipt status. Include positive and negative authorization/state tests, output chain ID/address/transaction hashes/gas and a deployment manifest. Do not simulate contract state in Python or use mainnet keys. Use OpenZeppelin 5.4.0 for ERC standards. Return Contract.sol, run_activity.py, mock-data.json, compile.cjs, requirements.txt and a detailed troubleshooting guide. Explain integer units, failure cases and what the assertions prove. Never claim a browser wallet or public testnet succeeded unless actually exercised.

## Review prompt

Review every external function for authorization, state transitions, integer units and invariants. Point to exact lines. Produce a requirement-to-assertion matrix and add a failing test before repairing any defect.

## Scenario-specific generation constraints

Launch persistent Anvil with chain31337. Run python run_activity.py --rpc http://127.0.0.1:8545. Serve this folder with python -m http.server8000. Open index.html, connect MetaMask using that local network. Load the same deployment.json, verify chain and query certificate ID1 ownership/digest/revoked. Switch wallet to Sepolia and verify the dApp blocks chain mismatch.

Expected assertions: Wallet readbacks match manifest; digest match true; revoked false; mismatch blocked before calls.

## Extension prompt

Change certificate ID to missing2 and show the revert/error message without falsely displaying valid status. Return the exact changed source lines and positive/negative tests.
