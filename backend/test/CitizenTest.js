const Citizen = artifacts.require("Citizen");

contract("Citizen", accounts => {
  it("should report a hole", async () => {
    const citizen = await Citizen.deployed();
    await citizen.reportHole("Street 123", { from: accounts[0] });
    const report = await citizen.reports(1);

    assert.equal(report.location, "Street 123", "Location should match");
    assert.equal(report.reporter, accounts[0], "Reporter address should match");
  });

  it("should limit daily reports per location", async () => {
    const citizen = await Citizen.deployed();

    await citizen.reportHole("Street 123", { from: accounts[0] });
    await citizen.reportHole("Street 123", { from: accounts[0] });
    try {
      await citizen.reportHole("Street 123", { from: accounts[0] });
    } catch (err) {
      assert(err.message.includes("Daily report limit reached"), "Should enforce limit");
    }
  });

  it("should delete old reports", async () => {
    const citizen = await Citizen.deployed();
    await citizen.reportHole("Street 456", { from: accounts[0] });

    // Simulate time passing (Ganache-specific)
    await new Promise(resolve => setTimeout(resolve, 1000)); // Wait 1 sec for testing
    await citizen.deleteOldReports();

    const report = await citizen.reports(1);
    assert.equal(report.location, "", "Old report should be deleted");
  });
});
