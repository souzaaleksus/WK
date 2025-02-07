/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 19-out-2024 10:36:18 				*/
/*  DBMS       : MySql 						*/
/* ---------------------------------------------------- */

CREATE DATABASE IF NOT EXISTS WK;

USE WK;

SET FOREIGN_KEY_CHECKS=0 
;

/* Drop Tables */

DROP TABLE IF EXISTS `TB_CLIENTE` CASCADE
;

DROP TABLE IF EXISTS `TB_PEDIDO_VENDA` CASCADE
;

DROP TABLE IF EXISTS `TB_PEDIDO_VENDA_ITEM` CASCADE
;

DROP TABLE IF EXISTS `TB_PRODUTO` CASCADE
;

/* Create Tables */

CREATE TABLE `TB_CLIENTE`
(
	`ID_CLIENTE` BIGINT NOT NULL AUTO_INCREMENT,
	`COD_CLIENTE` VARCHAR(10) NULL,
	`NOM_CLIENTE` VARCHAR(100) NULL,
	`NOM_CIDADE` VARCHAR(100) NULL,
	`COD_UF` VARCHAR(2) NULL,
	CONSTRAINT `PK_TB_CLIENTE` PRIMARY KEY (`ID_CLIENTE` ASC)
)

;

CREATE TABLE `TB_PEDIDO_VENDA`
(
	`ID_PEDIDO_VENDA` BIGINT NOT NULL AUTO_INCREMENT,
	`ID_CLIENTE` BIGINT NULL,
	`DAT_EMISSAO` DATE NULL,
	`VAL_TOTAL` DOUBLE(10,4) NULL,
	CONSTRAINT `PK_TB_PEDIDO_VENDA` PRIMARY KEY (`ID_PEDIDO_VENDA` ASC)
)

;

CREATE TABLE `TB_PEDIDO_VENDA_ITEM`
(
	`ID_PEDIDO_VENDA_ITEM` BIGINT NOT NULL AUTO_INCREMENT,
	`ID_PEDIDO_VENDA` BIGINT NULL,
	`ID_PRODUTO` BIGINT NULL,
	`QTD_ITEM` DOUBLE(10,2) NULL,
	`VAL_UNITARIO` DOUBLE(10,2) NULL,
	`VAL_ITEM` DOUBLE(10,2) NULL,
	CONSTRAINT `PK_TB_PEDIDO_VENDA_ITEM` PRIMARY KEY (`ID_PEDIDO_VENDA_ITEM` ASC)
)

;

CREATE TABLE `TB_PRODUTO`
(
	`ID_PRODUTO` BIGINT NOT NULL AUTO_INCREMENT,
	`COD_PRODUTO` VARCHAR(10) NULL,
	`NOM_PRODUTO` VARCHAR(100) NULL,
	`VAL_PRECO_VENDA` DOUBLE(10,4) NULL,
	CONSTRAINT `PK_TB_PRODUTO` PRIMARY KEY (`ID_PRODUTO` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `TB_CLIENTE` 
 ADD INDEX `IDX_TB_CLIENTE_01` (`ID_CLIENTE` ASC)
;

ALTER TABLE `TB_CLIENTE` 
 ADD INDEX `IDX_TB_CLIENTE_02` (`COD_CLIENTE` ASC)
;

ALTER TABLE `TB_PEDIDO_VENDA` 
 ADD INDEX `IXFK_TB_PEDIDO_VENDA_TB_CLIENTE` (`ID_CLIENTE` ASC)
;

ALTER TABLE `TB_PEDIDO_VENDA_ITEM` 
 ADD INDEX `IXFK_TB_PEDIDO_VENDA_ITEM_TB_PEDIDO_VENDA` (`ID_PEDIDO_VENDA` ASC)
;

ALTER TABLE `TB_PEDIDO_VENDA_ITEM` 
 ADD INDEX `IXFK_TB_PEDIDO_VENDA_ITEM_TB_PRODUTO` (`ID_PRODUTO` ASC)
;

ALTER TABLE `TB_PRODUTO` 
 ADD INDEX `IDX_TB_PRODUTO_01` (`ID_PRODUTO` ASC)
;

ALTER TABLE `TB_PRODUTO` 
 ADD INDEX `IDX_TB_PRODUTO_02` (`COD_PRODUTO` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `TB_PEDIDO_VENDA` 
 ADD CONSTRAINT `FK_TB_PEDIDO_VENDA_TB_CLIENTE`
	FOREIGN KEY (`ID_CLIENTE`) REFERENCES `TB_CLIENTE` (`ID_CLIENTE`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `TB_PEDIDO_VENDA_ITEM` 
 ADD CONSTRAINT `FK_TB_PEDIDO_VENDA_ITEM_TB_PEDIDO_VENDA`
	FOREIGN KEY (`ID_PEDIDO_VENDA`) REFERENCES `TB_PEDIDO_VENDA` (`ID_PEDIDO_VENDA`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `TB_PEDIDO_VENDA_ITEM` 
 ADD CONSTRAINT `FK_TB_PEDIDO_VENDA_ITEM_TB_PRODUTO`
	FOREIGN KEY (`ID_PRODUTO`) REFERENCES `TB_PRODUTO` (`ID_PRODUTO`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;

INSERT INTO WK.tb_cliente(COD_CLIENTE,NOM_CLIENTE,NOM_CIDADE,COD_UF) VALUES
('1','FRIGORIFICO RIO MARIA LTDA','RIO MARIA','PA'),
('2','FTS - FRIGORIFICO TAVARES DA SILVA LTDA','XINGUARA','PA'),
('3','NEO-TAGUS INDUSTRIAL LTDA','EXTREMA','MG'),
('4','J.A COMERCIO DE GENEROS ALIMENTICIOS E SERVICOS LTDA','CAMPO LIMPO PAULISTA','SP'),
('5','CHOPERIA E PIZZARIA LA BOHEMIA DE ITAPIRA LTDA','ITAPIRA','SP'),
('6','SUPERMERCADO ALABARCE LTDA','MOGI DAS CRUZES','SP'),
('7','SUPERMERCADO NELSINHO LTDA','CACAPAVA','SP'),
('8','FRIGOSUL - FRIGORIFICO SUL LTDA','ITATIBA','SP'),
('9','JBS S/A','SAO PAULO','SP'),
('10','SUPERMERCADO MARIMAR LTDA.','EMBU DAS ARTES','SP'),
('11','COMERCIAL MELHOR LTDA','POA','SP'),
('12','COMERCIAL MATRIT LTDA','SUZANO','SP'),
('13','TAKA SUPERMERCADO LTDA','ARUJA','SP'),
('14','COMERCIAL KEYPAR REPRESENTACOES E SUPERMERCADOS LTDA','ARUJA','SP'),
('15','COMERCIAL SEMAR DE PINDA LTDA','TAUBATE','SP'),
('16','RIO BRANCO ALIMENTOS S/A','JANDIRA','SP'),
('17','RESTAURANTE CAMPIMAR LTDA','CAMPINAS','SP'),
('18','MINI MERCADO JARDIM ALICE LTDA','CABREUVA','SP'),
('19','MINI MERCADO NOVO MODELO LTDA - EM RECUPERACAO JUDICIAL','FRANCO DA ROCHA','SP'),
('20','JAMPAC ALIMENTOS LTDA','ITATIBA','SP'),
('21','W. D. E. REFRIGERACAO COMERCIAL, MONTAGEM E INSTALACAO LTDA','CAMPINAS','SP'),
('22','MERCADINHO PIRATININGA DE GENEROS ALIMENTICIOS LTDA','CARAGUATATUBA','SP'),
('23','F. H. RODRIGUES MARQUES ALIMENTACAO LTDA','SAO BERNARDO DO CAMPO','SP'),
('24','RESTAURANTE EPAMINONDAS LTDA','SAO VICENTE','SP'),
('25','SUPERMERCADO ROSSI NEW LTDA','SAO PAULO','SP'),
('26','COMERCIAL COMPRE MELHOR DE GENEROS ALIMENTICIOS LTDA','PINDAMONHANGABA','SP'),
('27','JULIO CESAR CARDOSO DE MORAIS','MOGI DAS CRUZES','SP'),
('28','FRANGO DA NONNA COMERCIAL AVICOLA LTDA','ITAPIRA','SP'),
('29','GRAN CORTE ALIMENTOS, IMPORTACAO E EXPORTACAO LTDA','CERQUEIRA CESAR','SP'),
('30','FRIMAR INDUSTRIA E COMERCIO LTDA','SAO PAULO','SP'),
('31','REDE DE SUPERMERCADOS PORTUGUES LTDA','SALESOPOLIS','SP'),
('32','REDE DE SUPERMERCADOS PORTUGUES LTDA','SALESOPOLIS','SP'),
('34','SHIBATA COMERCIO E ATACADO DE PRODUTOS EM GERAL LTDA','SUZANO','SP'),
('35','SHIBATA COMERCIO E ATACADO DE PRODUTOS EM GERAL LTDA','JACAREI','SP'),
('39','ROBSON CARLOS CORREA HIGIENE E LIMPEZA','CAMPINAS','SP'),
('44','MINIMERCADO NOSSA CASA LTDA','SAO PAULO','SP'),
('45','COMPANHIA ULTRAGAZ S A','PAULINIA','SP'),
('47','SUPERMERCADO PONTO REAL LAGEADO LTDA','SAO PAULO','SP'),
('50','LATICINIOS GUAIRA LTDA.','GUAIRA','PR'),
('52','FRIGORIFICO BIG BOI LTDA','PAICANDU','PR'),
('53','DIP FRANGOS S.A.','CAPANEMA','PR'),
('54','FRIGORIFICO UNIBEEF LTDA','MARINGA','PR'),
('55','COOPAVEL COOPERATIVA AGROINDUSTRIAL','CASCAVEL','PR'),
('56','LAR COOPERATIVA AGROINDUSTRIAL','MATELANDIA','PR'),
('57','LAR COOPERATIVA AGROINDUSTRIAL','ROLANDIA','PR'),
('60','FRIVATTI INDUSTRIAL LTDA','ITAIPULANDIA','PR'),
('62','COOPERATIVA DALIA ALIMENTOS LTDA','ENCANTADO','RS'),
('64','FRIGORIFICO BXB LTDA','NIOAQUE','MS'),
('67','FRIGOSUL - FRIGORIFICO SUL LTDA','VARZEA GRANDE','MT'),
('69','COOPERATIVA DOS PRODUTORES DE LEITE DE CAMPINAPOLIS','CAMPINAPOLIS','MT'),
('70','CARNES BOI BRANCO LTDA','VARZEA GRANDE','MT'),
('33','COMERCIO VAREJISTA DE MERCADORIAS 3M LTDA','SAO PAULO','SP'),
('36','SILVANA ESTEVAM DOS SANTOS COSMETICOS E MODAS','PARIQUERA-ACU','SP'),
('37','J. R. GOMES DA SILVA','TAUBATE','SP'),
('38','MPP DISTRIBUIDORA DE MATERIAIS ELETRICOS LTDA','MOGI-GUACU','SP'),
('40','2NJ COMERCIO DE ALIMENTOS LTDA','SANTO ANDRE','SP'),
('41','SILCON MATERIAIS ELETRICOS E HIDRAULICOS LTDA','ITATIBA','SP'),
('42','SUPERMERCADO BOX SAITO LTDA - EM RECUPERACAO JUDICIAL','FRANCO DA ROCHA','SP'),
('43','BOLSAO COMERCIO DE PRODUTOS ALIMENTICIOS LTDA','LIMEIRA','SP'),
('46','FENIX INDUSTRIA E COMERCIO DE ALIMENTOS LTDA','SAO PAULO','SP'),
('48','CENTRO DE ALIMENTOS LTDA','BRAGANCA PAULISTA','SP'),
('49','LATICINIO DANIEL COLLE LTDA','VERE','PR'),
('51','SAO LEOPOLDO ALIMENTOS LTDA.','IPORA','PR'),
('58','C.VALE - COOPERATIVA AGROINDUSTRIAL','PALOTINA','PR'),
('59','H.E. IND. E COM. DE LATICINIOS LTDA.','CORONEL VIVIDA','PR'),
('61','JAGUAFRANGOS INDUSTRIA E COMERCIO DE ALIMENTOS LTDA','XANXERE','SC'),
('63','COOPERATIVA LANGUIRU LTDA','WESTFALIA','RS'),
('65','PRIMA FOODS S.A.','CASSILANDIA','MS'),
('66','GOLDEN IMEX LTDA','PARANAIBA','MS'),
('68','MARFRIG GLOBAL FOODS S.A.','PONTES E LACERDA','MT'),
('71','NATURAL PORK ALIMENTOS S.A.','NOVA MUTUM','MT'),
('72','PRIMA FOODS S.A.','SANTA FE DE GOIAS','GO'),
('73','NUTRIZA AGROINDUSTRIAL DE ALIMENTOS S/A','PIRES DO RIO','GO'),
('74','R E RIBEIRO SOARES & CIA LTDA','SANTAREM','PA'),
('75','FRIGORIFICO FORTEFRIGO LTDA','PARAGOMINAS','PA'),
('76','PLENA ALIMENTOS S/A','CONTAGEM','MG'),
('77','FRIGORIFICO NOSSA SENHORA DA SAUDE LTDA','POCOS DE CALDAS','MG'),
('78','DIS COMERCIO DE ELETRODOMESTICOS S.A','ITAPEVI','SP'),
('79','LUIZ EDUARDO TEOCHI','ITU','SP'),
('80','TREVINE & FILHOS LTDA','ITATIBA','SP'),
('81','SUPERMERCADO ALABARCE LTDA','MOGI DAS CRUZES','SP'),
('82','SUPERMERCADO ALABARCE LTDA','MOGI DAS CRUZES','SP'),
('83','MAGRAZI RESTAURANTE LTDA','SOROCABA','SP'),
('84','SUPERMERCADO SUPER MURAMOTO LTDA','SANTO ANDRE','SP'),
('87','SUPERMERCADO CASTELO DA SERRA LTDA','ITAPECERICA DA SERRA','SP'),
('89','APARENCIA PERFEITA ETIQUETAS E RIBBONS LTDA','SAO PAULO','SP'),
('90','FRIGORIFICO NUTRIBRAS S. A.','JANDIRA','SP'),
('92','CASA DE CARNES ROTISSERIE E MERCEARIA DAS FIGUEIRAS LTDA','SANTO ANDRE','SP'),
('94','CHOPPERIA E ESPETINHO DO JUIZ LTDA','SAO PAULO','SP'),
('95','RF LAMANAS COMERCIO DE PRODUTOS ALIMENTICIOS LTDA','SAO PAULO','SP'),
('96','AMANDA ALTAFINI CHOCOLATES','ITAPIRA','SP'),
('99','PAULO SERGIO SERAFIM CHAVEIRO','ITATIBA','SP'),
('100','ROBERTA CARDOSO DE SOUZA BEZERRA','PIRACICABA','SP'),
('105','KALUNGA SA','BARUERI','SP'),
('106','ROYAL PALM OPERADORA HOTELEIRA LTDA','INDAIATUBA','SP'),
('111','FRIGOL S.A.','LENCOIS PAULISTA','SP'),
('112','ORLANDO KIBE & CIA LTDA','SAO PAULO','SP'),
('113','SEARA COMERCIO DE ALIMENTOS LTDA','ITAPETININGA','SP'),
('114','GONCALVES & TORTOLA S/A','BARUERI','SP'),
('117','FRIGORIFICO RAINHA DA PAZ LTDA. EM RECUPERACAO JUDICIAL','IBIPORA','PR');

INSERT INTO wk.tb_produto(COD_PRODUTO,NOM_PRODUTO,VAL_PRECO_VENDA) VALUES
('100697-0','TOUCINHO SUINO CONG GRAN CORTE',109),
('2510','FRANGO SEM MIUDOS CONG 1 8 LANGUIRU',86),
('2511','FRANGO SEM MIUDOS CONG 1 9 LANGUIRU',86),
('11062','PICANHA A RESF IGUATEMI',42),
('27','COXINHA DA ASA BANDEJA 1KG LEVIDA',109),
('2332','CONTRA FILE PORCIONADO RESF MATABOI',2999),
('2600','PICANHA RESF MATABOI',479),
('655217','COSTELA INT  C/O S/P SUINO CG VALE SUL',169),
('130','COSTELA SUINA C/OSSO CONG  COOPAVEL',175),
('00040200','MOELA CONG CX PP 18KG MISTER CANCAO',69),
('5066','LINGUICA TOSCANA NANICA FRICASA',145),
('98','FILEZINHO FRANGO EMPANADO PCT 1KG BAITA FENIX',15),
('505','COXAO DURO',278),
('520','COSTELA TRAS  C/OSSO  RIPA',197),
('071707','COXINHA DA ASA ENV GONG 20KG LAR',99),
('10364','COXINHAS DAS ASAS CX PP 18 KG CANCAO',105),
('5023','PERNIL TEMP  S/OSSO FRICASA',149),
('100','PEDACO FRANGO EMPANADO PCT 2,5KG FENIX',115),
('1151','PALETA S/MUSCULO RESF FRIBEV',215),
('437','CORACAO CG PCT 700G RIVELLI',219),
('538','RECORTE DE ALCATRA ARANHA',265),
('620702-0','CARNE MOIDA CONG 1KG TUDBOM',175),
('03769','PALETA SUINA S/O CONG DALIA',139),
('630702-0','CARNE MOIDA PATINHO CONG 1KG PLENA',199),
('10','LINGUICA TOSCANA SUINA CONG FRIMAR',1199),
('171','QUEIJO MUSSARELA CX LATVIDA',249),
('3614','FRALDINHA RESF MATABOI',269),
('1050','CONTRA FILE RESF FRIBEV',319),
('103235','FILE MIGNON 4/5 S/C RESF FRIBEV',485),
('553','CONTRA FILE   ESPECIAL',3399),
('103222','PICANHA SUINA TEMP  CONG SULITA',215),
('102377','QUEIJO MUSSARELA DO VALLE',2399),
('3561','COXINHAS DAS ASAS CX PP 18 KG CANCAO',105),
('3534','COXINHA DA ASA BANDEJA 1KG LEVIDA',109),
('11057','SOBRECOXA ENV 20 KGS LAR',68),
('11234','COXA SBCX S/ OSSO CG 20KG RIVELLI',89),
('11384','COSTELA SUINA C/OSSO CONG  COOPAVEL',175),
('102853','FRANGO SEM MIUDOS CONG 1 8 LANGUIRU',87),
('102597','COSTELA INT  C/O S/P SUINO CG VALE SUL',169),
('12327','MEIO DA ASA CONG L/P 18KG DIP FRANGOS',169),
('11993','QUEIJO MUSSARELA ALTO ALEGRE',265),
('11541','BARRIGA SUINA C/PELE S/OSSO CONG  LANGUIRU',175),
('11329','TIRINHAS DE FRANGO 4XSC2,5KG C VALE',109),
('12301','CARNE MOIDA CONG 1KG TUDBOM',175),
('103013','COSTELA SUINA RIPA CONG REZENDE',155),
('102593','TOUCINHO SUINO CONG GRAN CORTE',109),
('103247','CORACAO CG PCT 700G RIVELLI',218),
('102963','BACON PALETA DEFUMADA RESF  FRICASA',215),
('3121','CARRE CONG  SUINO   FP DALIA',125),
('103270','COXA E SOBRECOXA C/O INTERF CONG COOPAVEL',675),
('103156','MEIO DA ASA CONG IQF 1KG FRIATO',175),
('12294','SALSICHA CONG HOT DOG 5KG COOPAVEL',599),
('11383','BARRIGA SUINA C/PELE S/OSSO CONG  COOPAVEL',179),
('103','FIGADO CONGELADO DE BOVINO',87),
('517','BIFE DO VAZIO',17),
('11426','LINGUICA TOSCANA NANICA FRICASA',145),
('103207','COSTELA DO TRASEIRO MINGA CONG MONTANA STEAKHOUSE MARFRIG',185),
('103018','FRALDINHA RESF MATABOI',269),
('102888','PICANHA RESF MATABOI',475),
('554','CUPIM',2395),
('102779','SOBRECOXA CG ENVELOPADO 19,5KG FRIATO',68),
('102496','SOBREPALETA SUINA CONG C/OSSO FRIELLA',1299),
('11630','LINGUICA DE FRANGO CONG  PCT COPACOL',89),
('102360','QUEIJO MUSSARELA CX LATVIDA',249),
('102982','LINGUICA TOSCANA SUINA CONG FRIMAR',1199),
('102750','CUPIM GRILL CONG BXB FOODS',2999),
('103126','PALETA SUINA S/O CONG DALIA',139),
('103151','CORACAO DA ALCATRA RESF IGUATEMI',315),
('11215','COXAS E SOBRECOXAS S/O PCT AGRODANIELI',88),
('107','RABO',189),
('507','LAGARTO',265),
('12186','FILE DE PEITO CG  ENVEL  19,5 KG FRIATO',98),
('103251','PALETA S/MUSCULO RESF FRIBEV',21),
('103236','COSTELA DO TRASEIRO MINGA CONG FRIBEV',179),
('103256','ALCATRA COMPLETA GRILL RESF IGUATEMI',359),
('592','PALETA S/MUSCULO CARNE RESFR  BOV S/OSSO',268),
('103146','COSTELA DO DIANTEIRO C/O GOURMET CONG BEST BEEF',325),
('102584','BARRIGA SUINA S/O C/PELE UNIBON',1899),
('102431','COXINHA DA ASA ENV GONG 20KG LAR',105),
('103174','PICANHA A ATE 1,400KG IGUATEMI',42),
('103182','RECORTE DIAFRAGMA LOMBINHO CONG MONTANA MARFRIG',208),
('103155','CONTRA FILE C/O S/N PARA BISTECA ASTRA',268),
('105','MOCOTO DE BOI',98),
('102987','LINGUICA DE COSTELA ANGUS CONG 400G CARAPRETA',285),
('12175','FILEZINHO DE FRANGO BAITA FENIX',15),
('11338','PERNIL TEMP  S/OSSO FRICASA',149),
('102433','FILEZINHO SASSAMI CONG  ENV 18KG C VALE',88),
('3572','FILE DE PEITO INT CG CX 18 KG C VALE',96),
('102722','POSTA DE TILAPIA CONG 16X800G C VALE',162),
('103241','BACON EXTRA LOMBO FATIADO DALIA',26),
('11279','MANTEIGA EXTRA COM SAL 200GRS SAO LEOPOLDO',19),
('102806','CONTRA FILE PORCIONADO RESF MATABOI',305),
('11524','PEITO CONGELADO',71),
('103266','CUPIM GRILL CONG BIG BOI',2999),
('11147','COSTELA S/O C/PELE TEMP CONG  DALIA',219),
('530','COXAO MOLE',282),
('928','COSTELA DESOSSADA MINGA',193),
('103237','BIFE DO VAZIO CONG FRIBEV',279),
('509','MAMINHA DA ALCATRA',347),
('502','PEITO DE BOVINO',238);