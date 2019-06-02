const assert = require('assert'); //para que coincidan los valores proporcionados
const Web3 = require('web3');

const provider = new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545"); //indicar la ruta
const web3 = new Web3(provider);

const {interface, bytecode} = require('../scripts/compile');

let accounts;
let usersContract;

beforeEach(async() => {
    accounts = await web3.eth.getAccounts(); //recupera las cuentas de Ganache
    usersContract = await new web3.eth.Contract(JSON.parse(interface))
        .deploy( {data: bytecode})
        .send({from: accounts[0], gas: '1000000'});
});

describe('The UsersContract', async() => {

    it('should deploy', () => {
        console.log(usersContract.options.address);
        assert.ok(usersContract.options.address);
    });

});
