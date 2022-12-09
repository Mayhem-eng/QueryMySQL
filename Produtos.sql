CREATE TABLE tipo_produto(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL	
);


CREATE TABLE produtos(
	id INT  NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	id_tipo INT NOT NULL  REFERENCES tipo_produto(id),
	preco DECIMAL(8,2) NOT NULL,
	quantidade INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_tipo) REFERENCES tipo_produto(id)
	
);

INSERT INTO tipo_produto (nome) VALUES ('cozinha');
INSERT INTO tipo_produto (nome) VALUES ('congelados');
INSERT INTO tipo_produto (nome) VALUES ('limpeza');
INSERT INTO tipo_produto (nome) VALUES ('escritorio');
INSERT INTO tipo_produto (nome) VALUES ('games');

INSERT INTO produtos (nome, id_tipo, preco, quantidade) VALUES ('Talheres', 1, 32.90, 200);
INSERT INTO produtos (nome, id_tipo, preco, quantidade) VALUES ('caneta', 4, 2.90, 500);
INSERT INTO produtos (nome, id_tipo, preco, quantidade) VALUES ('Fones', 5, 120.00, 70);
INSERT INTO produtos (nome, id_tipo, preco, quantidade) VALUES ('grampeador', 4, 64.90, 500);
INSERT INTO produtos (nome, id_tipo, preco, quantidade) VALUES ('File Mignon', 2, 90.90, 55);
INSERT INTO produtos (nome, id_tipo, preco, quantidade) VALUES ('Salmao', 2, 102.90, 40);

-- SELECT p.*, tp.nome FROM produtos AS p, tipo_produto AS tp WHERE p.id_tipo = tp.id;

SELECT p.nome, MAX(p.preco) AS preco, tp.nome AS correspondencia
	FROM produtos AS p INNER JOIN tipo_produto AS tp ON p.id_tipo = tp.id
	GROUP BY tp.nome, p.nome
	HAVING MAX(p.preco) > 50;