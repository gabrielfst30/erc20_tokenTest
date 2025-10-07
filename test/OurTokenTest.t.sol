// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {console} from "forge-std/console.sol";

contract OurTokenTest is Test {
    OurToken public token; // Renome a variável para 'token' para maior clareza
    DeployOurToken public deployer; // Instância do script de deployment

    // Contas de teste
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether; // 100 tokens com 18 decimais

    function setUp() public {
        // Deploy do contrato OurToken com fornecimento inicial de 1.000.000 tokens (com 18 decimais)
        deployer = new DeployOurToken(); // Cria uma nova instância do script de deploy
        token = deployer.run(); // Executa o método run para deployar o contrato e recebe o retorno do contrato do token

        vm.prank(msg.sender); // Simula que o deployer está transferindo para Bob
        token.transfer(bob, STARTING_BALANCE); // Transfere 100 tokens para Bob

        // vm.prank(msg.sender); // Simula que o deployer está transferindo para Alice
        // token.transfer(alice, STARTING_BALANCE); // Transfere 100 tokens para Alice
    }

    // Testando se Bob recebeu os tokens
    function testBobBalance() public view {
        assertEq(token.balanceOf(bob), STARTING_BALANCE); // Verifica se Bob recebeu o STARTING_BALANCE
    }

    // Testando se Alice recebeu os tokens
    function testAliceBalance() public view {
        assertEq(token.balanceOf(alice), STARTING_BALANCE); // Verifica se Alice recebeu o STARTING_BALANCE
    }

    // Testando se as permissões de gasto funcionam corretamente
    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000; // Bob aprova Alice para gastar 1000 tokens
        uint256 transferAmount = 500; // Reduzir para 50 tokens

        vm.prank(bob); // Simula que Bob está aprovando Alice
        token.approve(alice, initialAllowance); // Bob aprova Alice para gastar 1000 tokens

        vm.prank(alice); // Simula que Alice está transferindo tokens de Bob
        token.transferFrom(bob, alice, transferAmount); // Alice transfere 500 tokens de Bob para ela mesma

        // Verificações corretas:
        assertEq(token.balanceOf(alice), transferAmount); // Alice deve ter 500 tokens (transferAmount)
        assertEq(token.balanceOf(bob), STARTING_BALANCE - transferAmount); // Bob deve ter 100 - 500 = -400 tokens (não deve ser possível, mas para o teste)

        console.log("Bob's balance:", token.balanceOf(bob));
        console.log("Alice's balance:", token.balanceOf(alice));
    }
}
