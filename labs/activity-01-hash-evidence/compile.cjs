const fs=require('fs'),solc=require('solc'),path=require('path');
const source=fs.readFileSync('Contract.sol','utf8');
const input={language:'Solidity',sources:{'Contract.sol':{content:source}},settings:{optimizer:{enabled:true,runs:200},evmVersion:'cancun',outputSelection:{'*':{'*':['abi','evm.bytecode.object']}}}};
const output=JSON.parse(solc.compile(JSON.stringify(input),{import:p=>{try{return {contents:fs.readFileSync(path.join('node_modules',p),'utf8')}}catch(e){return {error:e.message}}}}));
const errors=(output.errors||[]).filter(e=>e.severity==='error');if(errors.length)throw Error(errors.map(e=>e.formattedMessage).join('\n'));
const name=JSON.parse(fs.readFileSync('activity.json')).contract;
for(const [n,c] of Object.entries(output.contracts['Contract.sol'])) {const data={abi:c.abi,bytecode:'0x'+c.evm.bytecode.object,compiler:solc.version(),evmVersion:'cancun',optimizerRuns:200};fs.writeFileSync(n===name?'contract.json':n+'.json',JSON.stringify(data,null,2));}
console.log('Compiled '+name+' with '+solc.version());
