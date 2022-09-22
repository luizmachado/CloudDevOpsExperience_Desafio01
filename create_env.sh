#!/bin/bash

# Lista de usuários, grupos e diretórios
declare -a usuarios=("carlos" "debora" "josefina" "maria" "sebastiana" "amanda" "joao" "roberto" "rogerio")
declare -a grupos=("GRP_ADM" "GRP_VEN" "GRP_SEC")
declare -a diretorios=("publico" "adm" "ven" "sec")

# Criar usuários com bash e senha padrão
for i in "${usuarios[@]}"
do
	echo "Criando usuario $i ..."
	useradd -m -c "$i" -s /bin/bash "$i" -p $(openssl passwd -crypt Senha123)
done

# Criar diretórios na raiz do sistema
for i in "${diretorios[@]}"
do
	echo "Criando diretorio $i ..."
	mkdir /"$i"
done


