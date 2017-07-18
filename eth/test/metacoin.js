var EternalStorage = artifacts.require("./EternalStorage.sol");

contract('EternalStorage', function(accounts) {
  it("should return account[0] address", function() {
    return EternalStorage.deployed().then(function(instance) {
      defaultAccount = accounts[0];
      instance.setAddressValue('default_account',defaultAccount);
      return instance.getAddressValue.call('default_account');
    }).then(function(address) {
      assert.equal(address.valueOf(), defaultAccount,  defaultAccount + " correctly set");
    });
  });
});
