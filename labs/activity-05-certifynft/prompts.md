# Vibe Coding prompt

Act as a Solidity and Python Web3 developer. Build issue and revoke erc-721 course certificates for an isolated test chain. Use Solidity 0.8.30 and web3.py 8.0.0 with EthereumTesterProvider backed by Py-EVM; also allow --rpc for an isolated unlocked local JSON-RPC test chain. Requirements: ERC-721 ownerOf and documentHash prove holder and document binding; revocation remains an explicit status. Read mock-data.json, derive a canonical SHA-256 digest where required, compile using pinned solc-js 0.8.30, deploy actual EVM bytecode, wait for every receipt and assert receipt status. Include positive and negative authorization/state tests, output chain ID/address/transaction hashes/gas and a deployment manifest. Do not simulate contract state in Python or use mainnet keys. Use OpenZeppelin 5.4.0 for ERC standards. Return Contract.sol, run_activity.py, mock-data.json, compile.cjs, requirements.txt and a detailed troubleshooting guide. Explain integer units, failure cases and what the assertions prove. Never claim a browser wallet or public testnet succeeded unless actually exercised.

## Review prompt

Review every external function for authorization, state transitions, integer units and invariants. Point to exact lines. Produce a requirement-to-assertion matrix and add a failing test before repairing any defect.

## Scenario-specific generation constraints

Canonicalize mock evidence and issue certificate ID1 to account1 as issuer. Read ownerOf, documentHash and supportsInterface(0x80ac58cd). Attempt issue as outsider. Revoke ID1 as issuer and read revoked=true; ownership remains account1.

Expected assertions: Owner account1; digest equals canonical SHA256; ERC721 interface true; revoked true.

## Extension prompt

Add a verify function returning holder+digest+not-revoked, and test revoked credentials return false. Return the exact changed source lines and positive/negative tests.
