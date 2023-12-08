# test result

Test result: ok. 8 passed; 0 failed; 0 skipped; finished in 1.52ms
| test/gasComparision.t.sol:AccountImpl contract |                 |       |        |       |         |
|------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                | Deployment Size |       |        |       |         |
| 324162                                         | 1651            |       |        |       |         |
| Function Name                                  | min             | avg   | median | max   | # calls |
| execute((address,uint256,bytes))               | 10162           | 10162 | 10162  | 10162 | 1       |
| execute(address,uint256,bytes)                 | 10064           | 10064 | 10064  | 10064 | 1       |
| executeBatch_((address,uint256,bytes)[])       | 10617           | 43637 | 41097  | 79197 | 3       |
| executeBatch_(address[],uint256[],bytes[])     | 11128           | 44061 | 41528  | 79528 | 3       |
