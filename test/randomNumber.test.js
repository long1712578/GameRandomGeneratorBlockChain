const RNG = artifacts.require("RandomNumber");

contract('RandomNumber', ([deployer, user1, user2]) => {
    let rng;
    beforeEach(async() => {
        console.log('Before each');
        rng = await RNG.new();
    })

    it('Basic test', async() => {
        let owner = await rng.owner();
        let randAsingle = await rng.randSingle();
        let randRange = await rng.randRange(10, 99);
        console.log('owner', owner);
        console.log('randAsingle', randAsingle.words[0]);
        console.log('randRange', randRange.words[0]);
    })
})