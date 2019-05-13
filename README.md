# Scripts diversos, vou tentar explicar o que é em miúdos

## O que fazer com cada um deles?

### 1. backupfiles.bat

Efetua a cópia de vários arquivos para um caminho remoto.

### 2. csf.conf

Todos os parâmetros de configuração do CSF(ConfigServer Firewall) sem os comentários, no meu caso eu renomeio o arquivo csf.conf original e adiciono este com os ajustes que preciso.

### 3. mysql_backup.pl

Efetua backup de bases de dados em MySQL e gera um dump tabela a tabela em modo txt, é extremamente rápido em caso de restore.

### 4. rangeip.sh

Verifica dentro de uma rede /24 quais os IPs estão UP ou DOWN, com a exceção do Servidor não permitir PING, o resultado será negativo.

### 5. zerocached.sh

Verifica a memória livre juntamente com a memória em cache e efetua a limpeza, caso necessário, é necessário ajustar a variável presente na linha 11 chamado limite.

### Pré-requisitos

Nenhum.

## Versão

1.0.0

## Autor

* **Joel Pinheiro** - *Github* - [joelcpinheiro](https://github.com/joelcpinheiro)


## License

Use onde achar que irá contribuir :)
