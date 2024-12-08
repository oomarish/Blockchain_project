// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Manager {
    enum HoleState { Pending, Fixing, Fixed }

    struct HoleReport {
        uint256 id;
        string location;
        uint256 timestamp;
        address reporter;
        HoleState state;
        uint256 stateTimestamp;
    }

    uint256 public reportCount; // Counter for reports
    mapping(uint256 => HoleReport) public reports; // Mapping of report ID to HoleReport
    mapping(string => uint256) public dailyReportCount; // Track daily reports per location
    mapping(address => mapping(string => uint256)) public userReportTimestamps; // Track user's last report per location

    address public ministry; // Ministry address

    event HoleReported(uint256 id, string location, uint256 timestamp, address reporter);
    event HoleStateChanged(uint256 id, HoleState state, uint256 timestamp);
    event MunicipalityAction(uint256 reportId, uint256 actionTimestamp, bool isPunished);

    modifier onlyMinistry() {
        require(msg.sender == ministry, "Not authorized: Ministry only");
        _;
    }

    constructor() {
        ministry = msg.sender; // Set ministry as the contract deployer
    }

    // Citizens report holes
    function reportHole(string memory location) public {
        uint256 currentTime = block.timestamp;

        // Check if the user has already reported this location within the last 24 hours
        require(
            userReportTimestamps[msg.sender][location] == 0 ||
            (currentTime - userReportTimestamps[msg.sender][location]) > 1 days,
            "You have already reported this location today."
        );

        // Check if daily report limit (e.g., 3 reports per location) is exceeded
        require(dailyReportCount[location] < 3, "Daily report limit reached for this location");

        // Create a new report
        reportCount++;
        reports[reportCount] = HoleReport(
            reportCount,
            location,
            currentTime,
            msg.sender,
            HoleState.Pending,
            currentTime
        );

        // Increment daily report count and update user's last report timestamp
        dailyReportCount[location]++;
        userReportTimestamps[msg.sender][location] = currentTime;

        emit HoleReported(reportCount, location, currentTime, msg.sender);
    }

    // Municipalities update the state of a hole
    function updateHoleState(uint256 reportId, HoleState newState) public {
        HoleReport storage report = reports[reportId];

        // Ensure the report exists
        require(report.id != 0, "Report does not exist");

        // Update the report state
        report.state = newState;
        report.stateTimestamp = block.timestamp;

        emit HoleStateChanged(reportId, newState, block.timestamp);
    }

    // Ministry evaluates a report
    function evaluateReport(uint256 reportId) public onlyMinistry {
        HoleReport storage report = reports[reportId];

        // Ensure the report exists
        require(report.id != 0, "Report does not exist");

        uint256 timeElapsed = block.timestamp - report.timestamp;

        // Check if the report took longer than 1 week
        if (timeElapsed > 1 weeks && report.state != HoleState.Fixed) {
            emit MunicipalityAction(reportId, block.timestamp, true); // Punished
        } else {
            emit MunicipalityAction(reportId, block.timestamp, false); // Awarded
        }
    }

    // Function to get all reported holes
    function getAllHoles() public view returns (HoleReport[] memory) {
        HoleReport[] memory holeReports = new HoleReport[](reportCount);
        for (uint256 i = 1; i <= reportCount; i++) {
            holeReports[i - 1] = reports[i];
        }
        return holeReports;
    }

    // Function to get a specific hole report
    function getHole(uint256 reportId) public view returns (HoleReport memory) {
        return reports[reportId];
    }
}
