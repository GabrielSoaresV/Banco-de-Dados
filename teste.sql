-- 1. Criar banco de dados
CREATE DATABASE escola;
USE escola;

-- 2. Criar tabela de cursos
CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    duracao_anos INT
);

-- 3. Criar tabela de alunos com chave estrangeira
CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    data_nascimento DATE,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- 4. Inserir cursos
INSERT INTO cursos (nome, duracao_anos) VALUES
('Informática', 3),
('Administração', 2);

-- 5. Inserir alunos
INSERT INTO alunos (nome, idade, data_nascimento, id_curso) VALUES
('João', 18, '2006-03-15', 1),
('Maria', 20, '2004-09-20', 2),
('Carlos', 17, '2007-01-10', 1);

-- 6. SELECT com WHERE
SELECT * FROM alunos WHERE idade >= 18;

-- 7. UPDATE aluno
UPDATE alunos SET idade = 19 WHERE nome = 'João';

-- 8. DELETE aluno menor de idade
DELETE FROM alunos WHERE idade < 18;

-- 9. ALTER TABLE - adicionar coluna de email
ALTER TABLE alunos ADD email VARCHAR(100);

-- 10. ALTER TABLE - modificar tipo da idade
ALTER TABLE alunos MODIFY idade TINYINT;

-- 11. ALTER TABLE - renomear coluna idade para idade_aluno
ALTER TABLE alunos CHANGE idade idade_aluno TINYINT;

-- 12. RENAME TABLE
RENAME TABLE alunos TO estudantes;

-- 13. SELECT com JOIN
SELECT e.nome, c.nome AS curso
FROM estudantes e
JOIN cursos c ON e.id_curso = c.id;

-- 14. DROP TABLE
DROP TABLE estudantes;

-- 15. DROP DATABASE
DROP DATABASE escola;
