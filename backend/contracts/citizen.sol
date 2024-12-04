// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Citizen {
    struct HoleReport {
        uint256 id;
        string location;
        uint256 timestamp;
        address reporter;
    }

    uint256 public reportCount; // Counter for reports
    mapping(uint256 => HoleReport) public reports; // Mapping of report ID to HoleReport
    mapping(string => uint256) public dailyReportCount; // Track daily reports per location
    mapping(address => mapping(string => uint256)) public userReportTimestamps; // Track user's last report per location

    event HoleReported(uint256 id, string location, uint256 timestamp, address reporter);
    event HoleDeleted(uint256 id);

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
        reports[reportCount] = HoleReport(reportCount, location, block.timestamp, msg.sender);

        // Increment daily report count and update user's last report timestamp
        dailyReportCount[location]++;
        userReportTimestamps[msg.sender][location] = currentTime;

        emit HoleReported(reportCount, location, block.timestamp, msg.sender);
    }

    function deleteOldReports() public {
        uint256 currentTime = block.timestamp;

        for (uint256 i = 1; i <= reportCount; i++) {
            if (reports[i].timestamp > 0 && (currentTime - reports[i].timestamp) > 1 days) {
                delete reports[i];
                emit HoleDeleted(i);
            }
        }
    }
}
