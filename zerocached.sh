#!/bin/bash
# INFO:  SCRIPT QUE EFETUA A LIMPEZA DA MEMORIA CACHE, EVITANDO QUE A MESMA SEJA UTILIZADA E VA PARA A MEMORIA SWAP, CAUSANDO LENTIDAO NO SO
# NOTA:  UTILIZA A LINGUAGEM DE CALCULADORA BC
# AUTOR: JOEL PINHEIRO
# EMAIL: JOEL@OPOVODIGITAL.COM
# UPDATE 16/04/2018
memlivre=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && memlivre=$(echo "$memlivre/1024.0" | bc)
memcached=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && memcached=$(echo "$memcached/1024.0" | bc)

# NA VARIAVEL ABAIXO ADICIONAR O LIMITE DE MEMORIA QUE O SERVER DEVE ALCANCAR PARA RODAR O COMANDO DENTRO DA CONDICAO A SEGUIR
limite=`echo 1096`
data=`date "+%d/%m/%Y, as %H:%M:%S"`

if [ "$memlivre" -lt "$limite" ]
  then
   sync && echo 3 > /proc/sys/vm/drop_caches
  else
   echo  "nao foi necessario limpar o cache, dia  $data" >> zerocached_logs.txt
  fi 
exit 0
