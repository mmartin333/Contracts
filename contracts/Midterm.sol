//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IPausable {
    // Returns if the contract is currently paused
    function paused() external view returns (bool);
}

interface IMidterm {
    // solhint-disable ordering
    function addArrays(uint256[] calldata array0, uint256[] calldata array1)
        external
        pure
        returns (uint256[] memory);

    // Please make sure things are returned in order, else you will fail testing
    function getRangeSolutionDeposit()
        external
        view
        returns (
            uint256, // floor
            uint256, // ceiling
            bytes32, // solution hash
            uint256 // current deposit required
        );

    // Only the owner can set this when game is paused
    function setRangeSolutionDeposit(
        uint256 floor,
        uint256 ceiling,
        bytes32 solution,
        uint256 deposit
    ) external;

    // Can only run when game is not paused
    function guess(uint256 number) external payable;

    // Emitted when a player guesses (regardless of correctness)
    event DidGuess(address player, uint256 number);
    // Emitted when a player wins and the game pauses
    event DidResetGame(address winner);
}

contract Midterm is IPausable, IMidterm {
    // solhint-disable ordering
    function addArrays(uint256[] calldata array0, uint256[] calldata array1)
        external
        pure
        override
        returns (uint256[] memory)
    {}

    constructor() {}

    function paused() external view override returns (bool) {}

    function getRangeSolutionDeposit()
        external
        view
        override
        returns (
            uint256,
            uint256,
            bytes32,
            uint256
        )
    {}

    function setRangeSolutionDeposit(
        uint256 floor,
        uint256 ceiling,
        bytes32 solution,
        uint256 deposit
    ) external override {}

    function guess(uint256 number) external payable override {}

    function hashNumber(uint256 number) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(number));
    }
}
