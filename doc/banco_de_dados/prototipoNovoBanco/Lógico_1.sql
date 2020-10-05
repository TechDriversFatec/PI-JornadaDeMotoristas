/* L�gico_1: */

CREATE TABLE funcionarios (
    cpf VARCHAR(11) PRIMARY KEY,
    cargo VARCHAR(13),
    login VARCHAR(50),
    senha VARCHAR(32),
    fk_filiais_id SERIAL
);

CREATE TABLE filiais (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    cidade VARCHAR(30),
    estado VARCHAR(2),
    rntrc VARCHAR(8)
);

CREATE TABLE veiculos (
    placa VARCHAR(8) PRIMARY KEY,
    modelo VARCHAR(20),
    id_rastreador VARCHAR(20),
    marca_rastreador VARCHAR(20),
    modelo_rastreador VARCHAR(20),
    fk_filiais_id SERIAL
);

CREATE TABLE avisos (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(15),
    funcionario_destino VARCHAR(11),
    visualizado BOOLEAN,
    mensagem TEXT,
    fk_funcionarios_cpf VARCHAR(11)
);

CREATE TABLE status (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(20),
    inicio DATETIME,
    fim DATETIME,
    total DATETIME,
    fk_motoristas_cpf VARCHAR(11)
);

CREATE TABLE viagens (
    id SERIAL PRIMARY KEY,
    funcionario VARCHAR(11),
    veiculo VARCHAR(20),
    destino VARCHAR(30),
    carga VARCHAR(20),
    inicio DATETIME,
    fim DATETIME,
    prazo DATETIME,
    fk_motoristas_cpf VARCHAR(11),
    fk_veiculos_placa VARCHAR(8)
);

CREATE TABLE motoristas (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    cnh VARCHAR(11),
    expediente VARCHAR(80),
    salario VARCHAR(10),
    fk_funcionarios_cpf VARCHAR(11)
);

CREATE TABLE supervisores (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    expediente VARCHAR(80),
    salario VARCHAR(10),
    fk_funcionarios_cpf VARCHAR(11)
);

CREATE TABLE administradores (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    expediente VARCHAR(80),
    salario VARCHAR(10),
    fk_funcionarios_cpf VARCHAR(11)
);
 
ALTER TABLE funcionarios ADD CONSTRAINT FK_funcionarios_2
    FOREIGN KEY (fk_filiais_id)
    REFERENCES filiais (id)
    ON DELETE RESTRICT;
 
ALTER TABLE veiculos ADD CONSTRAINT FK_veiculos_2
    FOREIGN KEY (fk_filiais_id)
    REFERENCES filiais (id)
    ON DELETE RESTRICT;
 
ALTER TABLE avisos ADD CONSTRAINT FK_avisos_2
    FOREIGN KEY (fk_funcionarios_cpf)
    REFERENCES funcionarios (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE status ADD CONSTRAINT FK_status_2
    FOREIGN KEY (fk_motoristas_cpf)
    REFERENCES motoristas (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE viagens ADD CONSTRAINT FK_viagens_2
    FOREIGN KEY (fk_motoristas_cpf)
    REFERENCES motoristas (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE viagens ADD CONSTRAINT FK_viagens_3
    FOREIGN KEY (fk_veiculos_placa)
    REFERENCES veiculos (placa)
    ON DELETE RESTRICT;
 
ALTER TABLE motoristas ADD CONSTRAINT FK_motoristas_2
    FOREIGN KEY (fk_funcionarios_cpf)
    REFERENCES funcionarios (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE supervisores ADD CONSTRAINT FK_supervisores_2
    FOREIGN KEY (fk_funcionarios_cpf)
    REFERENCES funcionarios (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE administradores ADD CONSTRAINT FK_administradores_2
    FOREIGN KEY (fk_funcionarios_cpf)
    REFERENCES funcionarios (cpf)
    ON DELETE RESTRICT;