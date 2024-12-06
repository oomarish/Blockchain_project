// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./municipality.sol"; // Import the Municipality contract

contract Ministry {
    enum Action { None, Award, Punish }

    struct MunicipalityRecord {
        uint256 reportId;
        uint256 timestamp;
        Action action;
    }

    mapping(uint256 => MunicipalityRecord) public municipalityActions;
    mapping(address => bool) public registeredMunicipalities;

    event MunicipalityAction(address municipality, uint256 reportId, Action action, uint256 timestamp);

    uint256 public penaltyPeriod = 1 weeks; // Punishment period (1 week)
    uint256 public awardPeriod = 1 weeks;  // Award period (1 week)

    modifier onlyMunicipality() {
        require(registeredMunicipalities[msg.sender], "Not a registered municipality");
        _;
    }

    // Register a municipality (can be done by the admin)
    function registerMunicipality(address municipality) public {
        registeredMunicipalities[municipality] = true;
    }

    // Listen for state changes in the Municipality contract
    function trackMunicipalityAction(address municipalityContract, uint256 reportId) public {
    // Get the Municipality contract instance
    Municipality municipality = Municipality(municipalityContract);

    // Retrieve the report from the Municipality contract
    (uint256 id, , uint256 timestamp, , Municipality.HoleState state, ) = municipality.reports(reportId);

    require(id != 0, "Report does not exist");

    uint256 timeTaken = block.timestamp - timestamp;

    // Check if the report took longer than the penalty period
    if (timeTaken > penaltyPeriod) {
        municipalityActions[reportId] = MunicipalityRecord(reportId, block.timestamp, Action.Punish);
        emit MunicipalityAction(municipalityContract, reportId, Action.Punish, block.timestamp);
    } else {
        municipalityActions[reportId] = MunicipalityRecord(reportId, block.timestamp, Action.Award);
        emit MunicipalityAction(municipalityContract, reportId, Action.Award, block.timestamp);
    }
}
}
