// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManualToken {
    // key é o endereço do usuário, value é o saldo do usuário
    mapping(address => uint256) private s_balances;

    // nome do token
    function name() public pure returns (string memory) {
        return "ManualToken";
    }

    // totalSupply é 100 tokens, considerando 18 casas decimais
    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    // totalSupply tem 18 casas decimais
    function decimals() public pure returns (uint8) {
        return 18;
    }

    // retorna o saldo da conta do usuário
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }

    // transfere _amount tokens do remetente para o destinatário _to
    function transfer(
        address _to,
        uint256 _amount
    ) public returns (bool success) {
        // verifica se o remetente tem saldo suficiente
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount; // subtrai o valor do saldo do remetente
        s_balances[_to] += _amount; // adiciona o valor ao saldo do destinatário
        require(
            balanceOf(msg.sender) + balanceOf(_to) == previousBalance,
            "Erro de saldo"
        ); // verifica se o saldo total permanece o mesmo
    }
}
