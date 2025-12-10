```markdown
# ERC20 Token Test

Projeto de teste / aprendizado para criação de token ERC-20 customizado em Ethereum (ou EVM-compatible), com ambiente de desenvolvimento e scripts básicos para deploy e interação.

---

## 🚀 Tecnologias Utilizadas  
- **Solidity** – contrato inteligente ERC-20  
- **Hardhat** – framework de desenvolvimento, deploy e testes  
- **ethers.js** – integração e scripts de interação com contrato  
- **TypeScript / JavaScript** – scripts de deploy e interação  
- (Opcional) **Foundry** — se houver testes escritos com Forge  
- (Opcional) Configuração para redes de teste (testnets) / rede local  

---

## 🔧 Funcionalidades Principais  
- Deploy de um token ERC-20 customizado com nome, símbolo e supply definidos  
- Scripts para deploy, mint, transferência e verificação de saldos  
- Estrutura mínima para testes e simulação de interações com o token  
- Base adequada para expandir com funcionalidades extras (governança, vesting, queima, etc.)

---

## 📂 Estrutura do Repositório  
erc20_tokenTest/
├── contracts/        # Código Solidity do token
├── scripts/          # Scripts de deploy e interações (mint, transfer, etc.)
├── test/             # Testes unitários (se houver)
├── hardhat.config.ts # Configuração do Hardhat
└── README.md         # Este arquivo

---

## 🧪 Como Executar / Testar  

1. Clone o repositório  
   ```bash
   git clone https://github.com/gabrielfst30/erc20_tokenTest.git
   cd erc20_tokenTest
````

2. Instale dependências

   ```bash
   npm install
   # ou
   yarn install
   ```
3. Compile os contratos

   ```bash
   npx hardhat compile
   ```
4. (Opcional) Execute testes

   ```bash
   npx hardhat test
   ```
5. Deploy local / testnet / mainnet — configure `hardhat.config.ts` com RPC e chave privada, então execute script de deploy:

   ```bash
   npx hardhat run scripts/deploy.ts --network <your-network>
   ```

---

## 🧑‍💻 Sobre o Projeto

Este repositório foi construído como um aprendizado prático de como implementar e interagir com tokens ERC-20. Serve como base leve e clara para projetos maiores: smart contracts, dApps, integração Web3, testes, infraestrutura de deploy.

Se você busca algo mais sofisticado (governança, tokens vesting, integração com frontend, etc.), pode usar esse template como ponto de partida.
