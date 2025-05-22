// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AirplaneRace {
    uint256 public constant FINISH_LINE = 100;

    struct Player {
        address addr;
        uint256 position;
        bool hasMoved;
    }

    mapping(address => Player) public players;
    address[] public playerList;
    bool public raceStarted;
    address public winner;

    modifier onlyBeforeStart() {
        require(!raceStarted, "Race already started");
        _;
    }

    modifier onlyInRace() {
        require(raceStarted, "Race not started");
        require(players[msg.sender].addr != address(0), "You are not in the race");
        _;
    }

    function register() external onlyBeforeStart {
        require(playerList.length < 2, "Only two players allowed");
        require(players[msg.sender].addr == address(0), "Already registered");

        players[msg.sender] = Player(msg.sender, 0, false);
        playerList.push(msg.sender);
    }

    function startRace() external onlyBeforeStart {
        require(playerList.length == 2, "Need exactly 2 players to start");
        raceStarted = true;
    }

    function move(uint256 distance) external onlyInRace {
        require(distance > 0 && distance <= 10, "Move must be between 1 and 10");
        Player storage player = players[msg.sender];
        require(!player.hasMoved, "You already moved this turn");

        player.position += distance;
        player.hasMoved = true;

        if (player.position >= FINISH_LINE && winner == address(0)) {
            winner = msg.sender;
        }

        // Reset turn if both have moved
        if (players[playerList[0]].hasMoved && players[playerList[1]].hasMoved) {
            players[playerList[0]].hasMoved = false;
            players[playerList[1]].hasMoved = false;
        }
    }

    function getPosition(address _player) external view returns (uint256) {
        return players[_player].position;
    }

    function getPlayers() external view returns (address[] memory) {
        return playerList;
    }
}
