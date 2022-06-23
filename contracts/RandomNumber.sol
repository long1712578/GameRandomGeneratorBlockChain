// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract RandomNumber {

    struct HistoryInfo {
        address player;
        uint reward;
    }
    HistoryInfo[] public historyInfos;
    uint256 private _tail = 0;
    mapping (uint256 => HistoryInfo) private _historyInfo;
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    function rand(uint seed) internal pure returns(uint) {
        bytes32 data;
        uint sum;

        if(seed % 2 == 0){
            data = keccak256(abi.encodePacked(seed));
        }else{
            data = keccak256(abi.encodePacked(keccak256(abi.encodePacked(seed))));
        }

        for(uint i = 0; i < 32; i++) {
            sum += uint(uint8(data[i]));
        }

        return uint(uint8(data[sum % data.length])) + uint(uint8(data[(sum + 2) % data.length]));
    }

    function randSingle() public view returns(uint){
        return rand(block.timestamp);
    }

    function randRange(uint a, uint b) public view returns(uint){
        require(a < b, "value a can't bigger than value b");
        uint result = a + randSingle() % b;
        
        // HistoryInfo memory _historyInfo;
        // _historyInfo.player = msg.sender;
        // _historyInfo.reward = result;
        //  _historyInfos[_tail] = _historyInfo;
        //  _tail++;
        //  emit BET(_tail - 1, msg.sender, msg.value, block.number, result);

        return result;
    }

}