// SPDX-License-Identifier: GPL-2.0-or-later

// PPGI - Avaliação da disciplina de Criptomoedas.
// Aluno: JOHAN KEVIN / Professor: Guido Lemos

pragma solidity >=0.7.4; //Roda em versões a partir desta.

contract Votacao {
    //Fiscal de votaçao (abre a sessão)
    address public fiscal; 

    //Pauta da votação
    string public pauta;   
    
    //Candidatos
    enum Opcao { candidato0, candidato1, candidato2 } 
    
    //Guardar os nossos votos (Estado)
    mapping (Opcao => address[]) voto;   
    
    //Endereço de quem ja votou como chave boolean
    mapping (address => bool) eleitores; 
    
    constructor (string memory _pauta){
        fiscal = msg.sender; 
        pauta = _pauta; 
    }
    
    //execução da votação
    function votar (Opcao _opcao) public {   
        require(!eleitores[msg.sender], "Eleitor ja votou!"); //Teste de repetição
        voto[_opcao].push(msg.sender); //Inserir o valor do endereço
        eleitores[msg.sender] = true;
    }
    
    //Retornando a lista de endereços que votaram
    function verResultado (Opcao _opcao) public view returns (address[] memory){
        return (voto[_opcao]); //
    }
}

