vagrantpupp
===========
vagrant
Versions:

Vagrant (1.2.2)
Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)
Magento Enterprise: 1.13.0.2
Nginx: 1.1.19 (default Package)
Varnish: 3.0.2 (default Package)
PHP: 5.3 (default Package)
Redis: 2.8.2
Solr: 3.6.1 (Default Package)
Mysql: 5.5 (Default Package)
Ports

Nginx: 8080
Varnish: 80
Redis: 6379 (default)
Solr: 8983 (default)
Mysql: 3306 (default)
Este tutorial step by step é para o quem utilizar o Ubuntu, e quer usar a estrutura do Vagrant dentro do projeto WEB.

Instalar o VirtualBox Instalar o vagrant

Na pasta www, crie um novo diretório com o nome {{myproject}} (Ou use o seu path preferido). clonar o projeto vagrant Clonar o projeto {{Lojaxyz}} (código fonte da loja disponível no github)

Adicionar a box, no terminal digite o seguinte comando: vagrant box add ubuntu1204 https://dl.dropbox.com/u/5595111/precise64-kohadeps.box vagrant init vagrant up

Diretório vagrant, contém o arquivo de configuração vangrantFile e o provisioning dos serviços, utilizando Puppet, dentro do diretório Manifest, default.pp, alterar a senha do usuário root do mysql para a senha do usuário root do seu mysql, se isto não foi feito você terá que modificar o arquivo local.xml do seu projeto(magento) para acessar o banco de dados da VM.

Todas as dependencias do projeto serão criadas na máquina virtual, o repositório não será clonado, pos o sentido é usar o código fonte da máquina "real".

Suba o dump do banco de dados na sua máquina virtual e faça as mudanças necessárias para que o magento funcione. core_config_data:

path: web/unsecure/base_url value: http://192.168.33.10/ -> ou outro ip que você tenha definido

path: web/secure/base_url value: http://192.168.33.10/ -> ou outro ip que você tenha definido

UPDATE saraiva.core_config_data SET value='http://192.168.33.10/' WHERE config_id='5';

UPDATE saraiva.core_config_data SET value='http://192.168.33.10/' WHERE config_id='4';
UPDATE saraiva.core_config_data SET value='0' WHERE config_id='2';
INSERT INTO saraiva.admin_user (firstname, lastname, email, username, password, logdate, lognum, is_active) VALUES ('Valdir', 'Calixto', 'valdir.calixto@e-smart.com.br', 'admin', '7d73f2040194b75e5b23c65bf834753b:GI', '0', '0', '1');
INSERT INTO saraiva.admin_role (parent_id, tree_level, sort_order, role_type, user_id, role_name, gws_is_all) VALUES ('1', '2', '0', 'U', '1', 'Administrators', '1');
pwd: abc1234
Acesse através do Browser em sua máquina: 192.168.33.10

Configure o Varnish via admin do magento
Configure o redis via admin do magento
configure o solr via admin do magento
Teste o ambiente.
