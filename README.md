# Assistente de Diagnóstico - Suporte N1

Script em PowerShell que fiz para agilizar o atendimento inicial (Nível 1) em chamados de suporte técnico.

A ideia foi juntar em um menu só os comandos básicos de verificação de rede e sistema do Windows, para testar a máquina rápido ou salvar um relatório pronto para anexar no chamado.

## Como eu fiz

Para montar esse script, usei a mesma lógica de menus no terminal que já pratico em **Java** na faculdade, só adaptando os comandos para o **PowerShell**:

1. **Menu e leitura de opção (`Write-Host` e `Read-Host`):**
   Mostrei as opções na tela com `Write-Host` e peguei o número que o usuário digita usando `Read-Host`, guardando na variável `$opcao`.

2. **Condições (`if / elseif / else`):**
   Usei `if` e `elseif` com `-eq` (que funciona igual ao `==`) para rodar o comando certo de acordo com a opção escolhida. No final coloquei um `else` para avisar caso seja digitada uma opção inválida.

3. **Comandos do Windows:**
   Em vez de escrever código complexo, aproveitei os próprios comandos que já são usados no dia a dia de suporte (`ping`, `ipconfig` e `systeminfo`) para não precisar ficar digitando um por um a cada chamado.

4. **Salvar o relatório (`>` e `>>`):**
   Na opção 4, usei a saída do próprio terminal para criar o arquivo `relatorio.txt` sozinho:
   - `ping 8.8.8.8 > relatorio.txt` cria o arquivo do zero e grava o resultado do ping.
   - `ipconfig /all >> relatorio.txt` e `systeminfo >> relatorio.txt` vão adicionando o resto no final do mesmo arquivo sem apagar o que já estava lá.

## O que precisa para rodar

- Windows 10 ou Windows 11
- PowerShell (já vem instalado no Windows)

## Como baixar e usar

### 1. Baixar o projeto
Você pode clonar pelo Git:
```bash
git clone [https://github.com/pedroplovcke/assistente-suporte-n1.git](https://github.com/pedroplovcke/assistente-suporte-n1.git)
cd assistente-suporte-n1
```
Ou clicar no botão verde **Code** aqui em cima, baixar o **ZIP** e extrair no seu computador.

### 2. Abrir o terminal na pasta
Abra a pasta `assistente-suporte-n1`, clique com o botão direito em um espaço vazio dentro dela e selecione **Abrir no Terminal** (ou **Abrir janela do PowerShell aqui**).

### 3. Executar o script
Rode o comando abaixo no terminal:
```powershell
powershell -ExecutionPolicy Bypass -File .\diagnostico.ps1
```
O `-ExecutionPolicy Bypass` serve só para o Windows liberar a execução desse arquivo `.ps1` local na hora, sem mexer nas configurações de segurança do PC.

### 4. Escolher uma opção no menu
Vai aparecer o seguinte menu:
```text
=== ASSISTENTE DE SUPORTE N1 ===
1 - Testar conexao com a internet (Ping)
2 - Ver configuracoes de rede (IP e DNS)
3 - Ver informacoes do sistema e memoria
4 - Rodar diagnostico completo e salvar relatorio
Escolha uma opcao:
```

- **1 (Ping):** Testa a conexão com a internet enviando pacotes para o `8.8.8.8` (DNS do Google) para ver se há resposta e como está a latência.
- **2 (Rede):** Roda o `ipconfig /all` para mostrar IP local, gateway, DNS e endereço MAC.
- **3 (Sistema):** Roda o `systeminfo` para mostrar versão do Windows, tempo que o PC está ligado, processador e memória RAM.
- **4 (Completo):** Roda os três comandos em sequência e salva tudo no arquivo `relatorio.txt` dentro da própria pasta do projeto.

### 5. Ver o relatório
Depois de rodar a opção 4, basta abrir o `relatorio.txt` gerado na pasta para conferir os dados ou anexar no chamado.