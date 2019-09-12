#!/bin/bash
#
# Info: Script que efetua o ajuste do parametro responsavel por definir o limite de envio de mensagens, editando o pacote de cada conta
# Nota: Adicionar na cron do cPanel para que seja executado uma vez ao dia
# Autor: Marcio Grangeiro
# Email: 
#
# Acessa o diretorio de pacotes
cd /var/cpanel/packages/;
# Gera a lista padrao com todos os pacotes
ls  /var/cpanel/packages|awk '{print $1,"/",$2,"/",$3}' > /tmp/listadef.txt
sed -i 's/ //g' /tmp/listadef.txt
rm -rf /tmp/listafiltro.txt

# Le a lista definitiva e gera um filtro checando os arquivos com espaco 
for i in $(cat /tmp/listadef.txt)
do
	esp1=$(echo $i| cut -d "/" -f1)
	esp2=$(echo $i| cut -d "/" -f2)
	esp3=$(echo $i| cut -d "/" -f3)
	if [ -n "${esp2}" ] ; then
		echo $esp1 $esp2 $esp3 >> /tmp/listafiltro.txt
	fi
done

sed -i 's/ /#/g' /tmp/listafiltro.txt

# Le a lista filtrada acima dos arquivos COM espaco, remove e adiciona o parametro MAX_EMAIL_PER_HOUR correto
for u in $(cat /tmp/listafiltro.txt)
do
       cerq1=$(echo $u| cut -d "#" -f1)
       cerq2=$(echo $u| cut -d "#" -f2)
       cerq3=$(echo $u| cut -d "#" -f3)
       update1=$(sed -i '/MAX_EMAIL_PER_HOUR/d' $cerq1\ $cerq2 && echo "MAX_EMAIL_PER_HOUR=300" >> $cerq1\ $cerq2)	
       update2=$(sed -i '/MAX_EMAIL_PER_HOUR/d' $cerq1\ $cerq2\ $cerq3 && echo "MAX_EMAIL_PER_HOUR=300" >> $cerq1\ $cerq2\ $cerq3)
done

# Le a lista filtrada acima dos arquivos SEM espaco, remove e adiciona o parametro MAX_EMAIL_PER_HOUR correto
listasem=`ls -tl * | awk -F" +" '{print $9,$10,$11,$12}' > /tmp/listasem.txt`

for i in $(cat /tmp/listasem.txt)
  do sed -i '/MAX_EMAIL_PER_HOUR/d' $i  && echo "MAX_EMAIL_PER_HOUR=300" >> $i
done
