const RNG = artifacts.require("Lottery");

contract('Lottery', ([deployer, user1, user2]) => {
    let rng;
    beforeEach(async() => {
        console.log('Before each');
        rng = await RNG.new();
    })

    it('Basic test', async() => {
        let owner = await rng.owner();
        let randAsingle = await rng.randSingle();
        let randRange = await rng.randRange(10, 99);
        let contractBalance = await web3.eth.getBalance(rng.address);
        console.log('owner', owner);
        console.log('address', rng.address)
        console.log('randAsingle', randAsingle.words[0]);
        console.log('randRange', randRange.words[0]);
        console.log('contractBalance', contractBalance);
    })
})