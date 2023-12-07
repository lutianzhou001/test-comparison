# test struct/arrays with 1,5,10 times

| test/gasComparision.t.sol:AccountImpl contract |                 |       |        |       |         |
|------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                | Deployment Size |       |        |       |         |
| 331768                                         | 1689            |       |        |       |         |
| Function Name                                  | min             | avg   | median | max   | # calls |
| execute((address,uint256,bytes))               | 10171           | 10171 | 10171  | 10171 | 1       |
| execute(address,uint256,bytes)                 | 10055           | 10055 | 10055  | 10055 | 1       |
| executeBatch((address,uint256,bytes)[])        | 10888           | 45199 | 42560  | 82150 | 3       |
| executeBatch(address[],uint256[],bytes[])      | 11099           | 44032 | 41499  | 79499 | 3       |

This code shows the struct is cheaper when only one call is executed, but when the calls is greater, seems the arrays are cheaper.