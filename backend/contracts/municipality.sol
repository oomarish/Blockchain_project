// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Municipality {
    enum HoleState { Pending, Fixing, Fixed }

    uint256[] public reportIds;

    struct Report {
        uint256 id;
        string location;
        uint256 timestamp;
        address reporter;
        HoleState state;
        uint256 stateTimestamp; // Timestamp when the state was last updated
    }

    uint256 public reportCount;
    mapping(uint256 => Report) public reports;
    mapping(string => uint256) public locationReportCount;

    // Event emitted when a hole's state changes
    event HoleStateChanged(uint256 id, HoleState state, uint256 timestamp);

    // Event emitted when a new hole is reported
    event HoleReported(uint256 id, string location, address reporter); // <-- Ajout ici

    // Function to update the hole's state (municipality's action)
    function updateHoleState(uint256 reportId, HoleState newState) public {
        Report storage report = reports[reportId];
        
        // Ensure the report exists
        require(report.id != 0, "Report does not exist");
        
        // Set the new state and timestamp
        report.state = newState;
        report.stateTimestamp = block.timestamp;
        
        emit HoleStateChanged(reportId, newState, block.timestamp);
    }

    // Function to create or manage a report (initially pending)
    function createReport(uint256 id, string memory location, address reporter) public {
        reportCount++;
        reports[reportCount] = Report(reportCount, location, block.timestamp, reporter, HoleState.Pending, block.timestamp);
        
        // Debugging: Verify if report is added correctly
        require(reports[reportCount].id == reportCount, "Report was not added properly");

        // Emit both events: HoleReported and HoleStateChanged
        emit HoleReported(reportCount, location, reporter); // <-- Ajout ici
        emit HoleStateChanged(reportCount, HoleState.Pending, block.timestamp);
    }
     
}
