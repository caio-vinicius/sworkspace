#/bin/bash
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
#	-b ou --base	| Instalação de ferramentas para manutenção de databases.
#	-c ou --code	| Instalação completa para desenvolvimento.
#	-d ou --data	| Instação de servidores de base de dados.
#	-e ou --estudo	| Instalação de ferramentas para estudo
#	-i ou --internet| Instação de softwares para produtividade com internet.
#	-p ou --producao| Instalação de ferramentas para produção
#	-h ou --help	| Exibe ajuda para comandos.

#
#------------------------------------------------------------------------------
#
# Histórico:
#
# 26/03/2020
# v0.01 - Inicio da implementação, criação do cabeçalho escolha das primeiras
#			funções a serem implementadas.
# 27/03/2020
# v0.02 - Implementação dos argumentos -c,-d, -e, -i, -p e retirada do
#			argumento -a.
# 27/03/2020
# v0.03 - Implementação do argumento -m e adicionados mais softwares.
#------------------------------------------------------------------------------

#Comando de inicialização

echo "-----------------------------------------------"
echo "|          Iniciando o sworkspace             |"
echo "-----------------------------------------------"
echo ""
echo " - Atualizando repositórios apt"
sudo apt-get -y update  > update.sfr
sudo apt-get -y upgrade > upgrade.sfr
echo " - Instalando suporte a snap"
sudo apt-get -y install snapd > snap.sfr

echo ""
echo "-----------------------------------------------"
echo ""

# Tratamento de argumentos
case "$1" in

	-b | --base)
		echo " * Ferramentas de manutenção de databases"
#		echo "   - Instalando MySql Workbench"
#		sudo apt-get install -y mysql-workbench > workbench.sfr
		echo "   - Instalando DBeaver Community"
		sudo snap install dbeaver-ce > dbeaver.sfr
	;;

	-c | --code)
		echo " * Ferramentas de Programação"
		echo "-----------------------------------------------"
		echo "   - Instalando pacotes de desenvolvimento em C"
		echo "     -> Compilador GCC"
		sudo apt-get install -y gcc > c.sfr
		echo "     -> Ferramenta de debug Valgrind"
		sudo apt-get install -y valgrind >> c.sfr
		echo "     -> Ferramenta de debug LLDB"
		sudo apt-get install -y lldb >> c.sfr
		echo "     -> Plataforma de codificação Make"
		sudo apt-get install -y make >> c.sfr
		echo "     -> Editor de texto vim"
		sudo apt-get install -y vim >> c.sfr
		echo "     -> Emulador de terminal Tilix"
		sudo apt-get install -y tilix >> c.sfr
		echo "-----------------------------------------------"
		echo "   - Instalando pacotes de desenvolvimento em C#"
		echo "     -> Baixando pacote .deb"
		wget -q https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb > dotnet.sfr
		echo "     -> Registrando chave e feed da Microsoft via pacote .deb"
		sudo dpkg -i packages-microsoft-prod.deb >> dotnet.sfr
		echo "     -> Atualizando repositórios"
		sudo apt-get update >> dotnet.sfr
		echo "     -> Instalando apt-transport-https"
		sudo apt-get install -y apt-transport-https >> dotnet.sfr
		echo "     -> Atualizando repositórios"
		sudo apt-get update >> dotnet.sfr
		echo "     -> Instalando DotNet SDK"
		sudo apt-get install -y dotnet-sdk-3.1 >> dotnet.sfr
		echo "     -> Ferramenta de edição Visual Studio Code"
		sudo snap install code --classic > dotnet.sfr
		echo "-----------------------------------------------"
		echo "   - Pacotes de desenvolvimento Java"
		echo "     -> Instalando Java JDK"
		sudo apt-get install -y default-jdk > java.sfr
		echo "     -> IDE de desenvolvimento Eclipse"
		sudo snap install eclipse --edge --classic
		echo "   - Pacotes de desenvolvimento Gnome"
		echo "     -> IDE de desenvolvimento Gnome"
		sudo apt-get install -y gnome-builder > gnome.sfr
		echo "-----------------------------------------------"
		echo "   - Ferramentas para controle e versionamento de código"
		echo "     -> Controle e versionamento git"
		apt-get install -y git > git.sfr
		echo "     -> Ferramenta visual Gitkraken"
		sudo snap install gitkraken > gitkraken.sfr
		;;

	-d | --data)
		echo " * Servidores de banco de dados"
		echo "-----------------------------------------------"
		echo "   - Instalação de pacotes Mysql Server"
		echo "     -> Instalando Mysql Server"
		sudo apt-get install -y mysql-server > mysql-server.sfr
	;;

	-e | --estudo)
		echo " * Ferramentas de estudo e foco"
		echo "-----------------------------------------------"
		echo "   - Instalação de ferramentas de estudo"
		echo "     -> Ferramenta de memorização Anki"
		sudo apt-get install -y anki > anki.sfr
		echo "     -> Ferramenta de pomodoro Rush"
		sudo apt-get install -y rush > rush.sfr
	;;

	-i | --internet)
		echo " * Ferramentas para produtividade na internet"
		echo "-----------------------------------------------"
		echo "   - Instalação de navegação, email e comunicação"
		echo "     -> Instalando Firefox"
		sudo apt-get install -y firefox > firefox.sfr
		echo "     -> Gerenciador de email Thunderbird"
		sudo apt-get install -y thunderbird > thunderbird.sfr
		echo "     -> Mensageiro Slack"
		sudo snap install slack --classic > slack.sfr
		echo "     -> Mensageiro Telegram"
		sudo snap install telegram-desktop > telegram.sfr
		echo "     -> Whatsapp desktop"
		sudo snap install whatsdesk > whats.sfr
	;;

	-p | --producao)
		echo " * Ferramentas para produtividade no desktop"
		echo "-----------------------------------------------"
		echo "   - Instalação ferramenta de manipulação de arquivos"
		echo "     -> Instalação de gestor de arquivo Nautilus"
		sudo apt-get install -y nautilus > nautilus.sfr
		echo "     -> Ferramenta de criptografia ccrypt"
		sudo apt-get install -y ccrypt > ccrypt.sfr
		echo "     -> Doca de softwares Plank"
		sudo apt-get install -y plank > plank.sfr
		echo "     -> Ferramenta office Onlyoffice"
		sudo snap install onlyoffice-desktopeditors
	;;

	-m | --media)
		echo "* Ferramentas para entreterimento"
		echo "-----------------------------------------------"
		echo "   - Instalação de ferramenta de multmedia"
		echo "     -> Reprodutor de vídeo VLC"
		apt-get install -y vlc > vlc.sfr
		echo "     -> Reprodutor de audio Spotify"
		sudo snap install spotify > spotify.sfr

esac

echo "-----------------------------------------------"
echo "|            Fim do sworkspace                |"
echo "-----------------------------------------------"
