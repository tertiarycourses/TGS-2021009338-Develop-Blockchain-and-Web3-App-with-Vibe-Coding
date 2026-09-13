# Vibe Coding prompt

Act as a Solidity and Python Web3 developer. Build track custody for pharmaceutical batches for an isolated test chain. Use Solidity 0.8.30 and web3.py 8.0.0 with EthereumTesterProvider backed by Py-EVM; also allow --rpc for an isolated unlocked local JSON-RPC test chain. Requirements: Batch ID + evidence digest + custodian + stage create a custody state machine; unauthorized handover reverts. Read mock-data.json, derive a canonical SHA-256 digest where required, compile using pinned solc-js 0.8.30, deploy actual EVM bytecode, wait for every receipt and assert receipt status. Include positive and negative authorization/state tests, output chain ID/address/transaction hashes/gas and a deployment manifest. Do not simulate contract state in Python or use mainnet keys. Use OpenZeppelin 5.4.0 for ERC standards. Return Contract.sol, run_activity.py, mock-data.json, compile.cjs, requirements.txt and a detailed troubleshooting guide. Explain integer units, failure cases and what the assertions prove. Never claim a browser wallet or public testnet succeeded unless actually exercised.

## Review prompt

Review every external function for authorization, state transitions, integer units and invariants. Point to exact lines. Produce a requirement-to-assertion matrix and add a failing test before repairing any defect.

## Scenario-specific generation constraints

Read mock batch identifier BATCH-SG-042 and hash it. Create batch as manufacturer account0 with canonical evidence digest. Reject outsider handover; handover manufacturer→distributor account1 then distributor→retailer account2. Read batches(id) after each state change. Reject duplicate create.

Expected assertions: custodian account2; stage2; digest unchanged; wrong-custodian and duplicate create fail.

## Extension prompt

Add temperature evidence as a new digest and a permitted rejection/quarantine state with exact role tests. Return the exact changed source lines and positive/negative tests.
