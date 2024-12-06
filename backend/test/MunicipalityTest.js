const Municipality = artifacts.require("Municipality");

contract("Municipality", accounts => {
  let municipality;

  before(async () => {
    municipality = await Municipality.deployed();
  });

  it("should create a report", async () => {
    await municipality.createReport(1, "Street 123", accounts[0]);
    const report = await municipality.reports(1);
    
    assert.equal(report.location, "Street 123", "Location should match");
    assert.equal(report.state, 0, "Initial state should be 'Pending'");
  });

  it("should update the hole state", async () => {
    await municipality.updateHoleState(1, 1); // Change state to 'Fixing'
    const report = await municipality.reports(1);
    
    assert.equal(report.state, 1, "State should be 'Fixing'");
  });
});
