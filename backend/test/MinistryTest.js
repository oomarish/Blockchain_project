const Ministry = artifacts.require("Ministry");
const Municipality = artifacts.require("Municipality");

contract("Ministry", accounts => {
  let ministry;
  let municipality;

  before(async () => {
    ministry = await Ministry.deployed();
    municipality = await Municipality.deployed();
  });

  it("should register a municipality", async () => {
    await ministry.registerMunicipality(municipality.address, { from: accounts[0] });
    const isRegistered = await ministry.registeredMunicipalities(municipality.address);
    assert(isRegistered, "Municipality should be registered");
  });

  it("should track municipality action", async () => {
    await municipality.createReport(1, "Street 123", accounts[0]);
    await municipality.updateHoleState(1, 1); // Change to 'Fixing'
    
    // Call trackMunicipalityAction
    await ministry.trackMunicipalityAction(municipality.address, 1, { from: accounts[0] });

    const action = await ministry.municipalityActions(1);
    assert.equal(action.action, 1, "Action should be 'Award' or 'Punish'");
  });
});
