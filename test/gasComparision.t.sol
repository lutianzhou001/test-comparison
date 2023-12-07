// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "forge-std/Test.sol";

contract Target {
    uint256 public value;

    function setValue(uint256 _value) public returns (uint256) {
        value = _value;
        return _value;
    }
}

contract AccountImpl {
    struct Execution {
        address dest;
        uint256 value;
        bytes data;
    }

    function execute(address dest, uint256 value, bytes calldata func) external {
        dest.call{ value: value }(func);
    }

    function execute(Execution calldata exec) external {
        exec.dest.call{ value: exec.value }(exec.data);
    }

    function executeBatch(
        address[] calldata dests,
        uint256[] calldata values,
        bytes[] calldata datas
    ) external {
        for (uint256 i = 0; i < dests.length; i++) {
            dests[i].call{ value: values[i] }(datas[i]);
        }
    }

    function executeBatch(Execution[] calldata execs) external {
        for (uint256 i = 0; i < execs.length; i++) {
            execs[i].dest.call{ value: execs[i].value }(execs[i].data);
        }
    }
}

contract GasComparisonExecute is Test {
    AccountImpl account;
    Target target;

    function setUp() public {
        account = new AccountImpl();
        target = new Target();

        target.setValue(0);
    }

    function testGasOne() public {
        address dest = address(target);
        uint256 value = 1;
        bytes memory callData = abi.encodeCall(Target.setValue, (1));
        AccountImpl.Execution memory exec = AccountImpl.Execution(dest, value, callData);

        account.execute(exec);
    }

    function testGasTwo() public {
        address dest = address(target);
        uint256 value = 1;
        bytes memory callData = abi.encodeCall(Target.setValue, (1));

        account.execute(dest, value, callData);
    }

    function testGasThree() public {
        address dest = address(target);
        address[] memory dests = new address[](1);
        dests[0] = dest;
        uint256 value = 1;
        uint256[] memory values = new uint256[](1);
        values[0] = value;
        bytes memory callData = abi.encodeCall(Target.setValue, (1));
        bytes[] memory datas = new bytes[](1);
        datas[0] = callData;

        account.executeBatch(dests, values, datas);
    }

    function testGasFour() public {
        address dest = address(target);
        uint256 value = 1;
        bytes memory callData = abi.encodeCall(Target.setValue, (1));

        AccountImpl.Execution[] memory execs = new AccountImpl.Execution[](1);
        execs[0] = AccountImpl.Execution(dest, value, callData);

        account.executeBatch(execs);
    }
}