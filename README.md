# test struct/arrays with 1,5,10 times

| test/gasComparision.t.sol:AccountImpl contract |                 |       |        |       |         |
|------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                | Deployment Size |       |        |       |         |
| 433068                                         | 2195            |       |        |       |         |
| Function Name                                  | min             | avg   | median | max   | # calls |
| execute((address,uint256,bytes))               | 10206           | 10206 | 10206  | 10206 | 1       |
| execute(address,uint256,bytes)                 | 10099           | 10099 | 10099  | 10099 | 1       |
| executeBatch((address,uint256,bytes)[])        | 10888           | 45199 | 42560  | 82150 | 3       |
| executeBatch(address[],uint256[],bytes[])      | 11143           | 44076 | 41543  | 79543 | 3       |
| executeBatch_((address,uint256,bytes)[])       | 8139            | 41159 | 38619  | 76719 | 3       |
| executeBatch_(address[],uint256[],bytes[])     | 8650            | 41583 | 39050  | 77050 | 3       |

