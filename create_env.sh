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

# Criar grupos
for i in "${grupos[@]}"
do
	echo "Criando grupo $i ..."
	groupadd "$i"
done

# Atribuir grupo aos usuários
echo "Adicionando usuários os grupo ADM ..."
eval 'usermod -G GRP_ADM '{carlos,maria,joao}';'

echo "Adicionando usuários os grupo VEN ..."
eval 'usermod -G GRP_VEN '{debora,sebastiana,roberto}';'

echo "Adicionando usuários os grupo SEC ..."
eval 'usermod -G GRP_SEC '{josefina,amanda,rogerio}';'

# Adicionar permissões às pastas

#Pasta publico
chmod 777 /publico

#Pasta adm
chown root:GRP_ADM /adm
chmod 770 /adm

#Pasta ven
chown root:GRP_VEN /ven
chmod 770 /ven

#Pasta sec
chown root:GRP_SEC /sec
chmod 770 /sec
