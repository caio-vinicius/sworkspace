#!/bin/bash
#
# sworkspace.sh - Script de instação personalizada de softwares,themas e icones
#
# Autor: SALEM RIBEIRO (26/03/2020)
#
# email: salem.ribeiro@sapo.pt
#
# Script desenvolvido para automatização do ambiente de trabalho facilitando
# a personalização para desenvolvimento.
# Seu proposito principal é manter o padrão em todas as maquinas que utilizam
# o sistema operacional Linux derivadas do sabor Debian.
# Além da padronização para programação em C, C# e Java implementamos também
# a função de personalização de abiente gráfico com temas, icones e wallpapers.
#
#------------------------------------------------------------------------------
# Este programa recebe como parametro uma opção de categoria.
#
# Exemplos:
#			sworkspace.sh -i |	Este exemplo executa a instação de ferramentas
#								de internet para produtividade.
# Temos dentre as opções:
#
#	-a ou --all		| Instalação completa de todas as ferramentas e temas.
#	-b ou --base	| Instalação de ferramentas para manutenção de databases.
#	-c ou --code	| Instalação completa para desenvolvimento.
#	-d ou --data	| Instação de servidores de base de dados.
#	-i ou --internet| Instação de softwares para produtividade com internet.
#	-h ou --help	| Exibe ajuda para comandos.
#
#------------------------------------------------------------------------------
#
# Histórico:
#
# 26/03/2020
# v0.01 - Inicio da implementação, criação do cabeçalho escolha das primeiras
#			funções a serem implementadas.
#------------------------------------------------------------------------------

