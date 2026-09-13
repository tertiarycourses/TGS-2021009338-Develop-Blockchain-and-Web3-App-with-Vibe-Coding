from pathlib import Path
import csv, json, hashlib, argparse
from web3 import Web3, EthereumTesterProvider
from web3.exceptions import ContractLogicError
from eth_tester import EthereumTester, PyEVMBackend
from eth_tester.exceptions import TransactionFailed
BASE=Path(__file__).resolve().parent
args=argparse.ArgumentParser()
args.add_argument("--rpc",help="Optional isolated local JSON-RPC URL; default is real in-process Py-EVM")
opt=args.parse_args()
w3=Web3(Web3.HTTPProvider(opt.rpc)) if opt.rpc else Web3(EthereumTesterProvider(EthereumTester(PyEVMBackend())))
assert w3.is_connected()
accounts=w3.eth.accounts
assert len(accounts)>=3, "Supply isolated unlocked local test accounts"
a,b,c=accounts[:3]
w3.eth.default_account=a
art=json.loads((BASE/"contract.json").read_text())
receipts=[]
def tx(fn,sender=a,value=0):
 h=fn.transact({"from":sender,"value":value,"gas":3000000})
 r=w3.eth.wait_for_transaction_receipt(h);assert r.status==1, "EVM reverted";receipts.append(dict(hash=h.hex(),gasUsed=r.gasUsed,block=r.blockNumber));return r
def reject(fn,sender=c,value=0):
 try: fn.call({"from":sender,"value":value})
 except (TransactionFailed, ContractLogicError): return
 except ValueError as exc:
  if "execution reverted" in str(exc).lower(): return
  raise
 raise AssertionError("Unauthorized/invalid action unexpectedly accepted")
def deploy(name=None,ctor=()):
 data=art if not name else json.loads((BASE/(name+".json")).read_text())
 fac=w3.eth.contract(abi=data["abi"],bytecode=data["bytecode"])
 r=tx(fac.constructor(*ctor));return w3.eth.contract(address=r.contractAddress,abi=data["abi"])
mock=json.loads((BASE/"mock-data.json").read_text())
digest=hashlib.sha256(json.dumps(mock,sort_keys=True,separators=(",",":")).encode()).digest()
contract=deploy();tx(contract.functions.issue(b,1,digest));assert contract.functions.ownerOf(1).call()==b;assert bytes(contract.functions.documentHash(1).call())==digest;reject(contract.functions.issue(c,2,digest),c);tx(contract.functions.revoke(1));assert contract.functions.revoked(1).call();assert contract.functions.supportsInterface(bytes.fromhex("80ac58cd")).call()
manifest={"chainId":w3.eth.chain_id,"address":contract.address,"contract":art["abi"],"compiler":art["compiler"],"evmVersion":art["evmVersion"],"sourceSha256":hashlib.sha256((BASE/"Contract.sol").read_bytes()).hexdigest(),"runtimeKeccak":Web3.keccak(w3.eth.get_code(contract.address)).hex(),"certificateId":1,"documentDigest":"0x"+digest.hex(),"learner":b,"rpc":opt.rpc,"backend":"HTTP JSON-RPC" if opt.rpc else "Py-EVM"}
(BASE/"deployment.json").write_text(json.dumps(manifest,indent=2))
report={"activity":BASE.name,"backend":manifest["backend"],"chainId":w3.eth.chain_id,"contractAddress":contract.address,"assertions":"passed","receipts":receipts,"boundary":"Browser wallet and public testnet are separate optional checks"}
(BASE/"results.json").write_text(json.dumps(report,indent=2));print(json.dumps(report,indent=2))
