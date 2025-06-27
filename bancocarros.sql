CREATE DATABASE db_AlRota;
USE db_AlRota;

CREATE TABLE tb_Sedes (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    NomeGerente VARCHAR(100),
    Multa DECIMAL(10,2),
    PRIMARY KEY (ID)
);

INSERT INTO tb_Sedes (Nome, Endereco, Telefone, NomeGerente, Multa)
VALUES 
('AlRota Centro', 'Av. Brasil, 1000 - Centro', '11999998888', 'João Carvalho', 150.00),
('AlRota Aeroporto', 'Rua Aviadores, 300 - Zona Norte', '11888887777', 'Lúcia Mendes', 125.00);

CREATE TABLE tb_ClasseCarro (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(50),
    ValorDiaria DECIMAL(10,2),
    PRIMARY KEY (ID)
);

INSERT INTO tb_ClasseCarro (Nome, ValorDiaria)
VALUES 
('Compacto', 89.90),
('Sedan', 139.90),
('SUV', 189.90);

CREATE TABLE tb_Carros (
    ID INT AUTO_INCREMENT,
    Placa VARCHAR(10),
    Modelo VARCHAR(40),
    Ano YEAR,
    Cor VARCHAR(50),
    Quilometragem INT,
    Descricao TEXT,
    OrigemCarro VARCHAR(100),
    LocalizacaoCarro VARCHAR(100),
    ClasseCarro INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ClasseCarro) REFERENCES tb_ClasseCarro(ID)
);

INSERT INTO tb_Carros (Placa, Modelo, Ano, Cor, Quilometragem, Descricao, OrigemCarro, LocalizacaoCarro, ClasseCarro)
VALUES 
('ALR1A23', 'Chevrolet Onix', 2022, 'Prata', 15000, 'Compacto econômico ideal para o dia a dia.', 'Chevrolet Brasil', 'AlRota Centro', 1),
('ALR2B45', 'Hyundai HB20S', 2021, 'Preto', 22000, 'Sedan confortável com porta-malas grande.', 'Hyundai Goiás', 'AlRota Centro', 2),
('ALR3C67', 'Jeep Renegade', 2023, 'Branco', 8000, 'SUV potente para qualquer terreno.', 'Jeep Pernambuco', 'AlRota Aeroporto', 3);

CREATE TABLE tb_Clientes (
    ID_Cliente INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    CNH VARCHAR(40),
    Validade DATE,
    CategoriaCNH VARCHAR(5),
    PRIMARY KEY (ID_Cliente)
);

INSERT INTO tb_Clientes (Nome, CNH, Validade, CategoriaCNH)
VALUES 
('Ana Clara Ribeiro', '12345678901', '2027-10-15', 'B'),
('Bruno Silva Lima', '98765432109', '2026-08-30', 'AB');

CREATE TABLE tb_Reservas (
    Numero INT AUTO_INCREMENT,
    Diarias INT,
    DataLocacao DATE,
    DataRetorno DATE,
    QuilometrosRodados INT,
    Multa DECIMAL(10,2),
    Situacao VARCHAR(50),
    Total DECIMAL(10,2),
    CarroReserva INT,
    ClienteReserva INT,
    SedeLocacao INT,
    SedeDevolucao INT,
    PRIMARY KEY (Numero),
    FOREIGN KEY (CarroReserva) REFERENCES tb_Carros(ID),
    FOREIGN KEY (ClienteReserva) REFERENCES tb_Clientes(ID_Cliente),
    FOREIGN KEY (SedeLocacao) REFERENCES tb_Sedes(ID),
    FOREIGN KEY (SedeDevolucao) REFERENCES tb_Sedes(ID)
);

INSERT INTO tb_Reservas (Diarias, DataLocacao, DataRetorno, QuilometrosRodados, Multa, Situacao, Total, CarroReserva, ClienteReserva, SedeLocacao, SedeDevolucao)
VALUES 
(4, '2025-06-20', '2025-06-24', 380, 0.00, 'Finalizada', 359.60, 1, 1, 1, 1),
(2, '2025-06-25', '2025-06-27', 190, 0.00, 'Em andamento', 379.80, 3, 2, 2, 2);