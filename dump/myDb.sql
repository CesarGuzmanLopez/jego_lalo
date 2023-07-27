SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Crear la tabla "Categorias"
CREATE TABLE Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);





-- Insertar datos en la tabla "Categorias"
INSERT INTO Categorias (Nombre) VALUES
('Química Orgánica'),
('Química Inorgánica'),
('Química Experimental'),
('Laboratorio de Pruebas');

-- Crear la tabla "Preguntas"
CREATE TABLE Preguntas (
    ID_Pregunta INT AUTO_INCREMENT PRIMARY KEY,
    Pregunta VARCHAR(255) NOT NULL,
    Respuesta VARCHAR(255) NOT NULL,
    ID_Categoria INT,
    numero_errores INT DEFAULT 0,
    numero_aciertos INT DEFAULT 0,
    dificultad INT DEFAULT 1,
    CONSTRAINT FK_Categoria
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria)
);


-- Crear la tabla "Cuestionarios"
CREATE TABLE Cuestionarios (
    ID_Cuestionario INT AUTO_INCREMENT PRIMARY KEY,
    Numero_Preguntas INT NOT NULL
);

-- Crear la tabla "Cuestionario_Preguntas" para la relación entre cuestionarios y preguntas
CREATE TABLE Cuestionario_Preguntas (
    ID_Cuestionario INT,
    ID_Pregunta INT,
    PRIMARY KEY (ID_Cuestionario, ID_Pregunta),
    FOREIGN KEY (ID_Cuestionario) REFERENCES Cuestionarios(ID_Cuestionario),
    FOREIGN KEY (ID_Pregunta) REFERENCES Preguntas(ID_Pregunta)
);

-- Preguntas sobre Química Orgánica
INSERT INTO Preguntas (Pregunta, Respuesta, ID_Categoria, dificultad) VALUES
('¿Cuál es la estructura del etanol?', 'C2H5OH', 1, 2),
('¿Qué es un alcano?', 'Hidrocarburo saturado sin enlaces dobles o triples.', 1, 1),
('Menciona un ejemplo de éter.', 'Éter dimetílico (CH3-O-CH3)', 1, 3),
('¿Qué es un alcohol primario?', 'Un alcohol en el cual el carbono que lleva el grupo hidroxilo (OH) está unido a un solo átomo de carbono.', 1, 2),
('¿Cuál es la fórmula molecular del propano?', 'C3H8', 1, 1),
('¿Qué es una cetona?', 'Un compuesto orgánico con un grupo carbonilo enlazado a dos átomos de carbono.', 1, 3),
('¿Cuál es la reacción química general para la síntesis de ésteres?', 'Ácido + Alcohol = Éster + Agua', 1, 2),
('¿Qué son los isómeros?', 'Compuestos con la misma fórmula molecular pero diferentes estructuras.', 1, 3),
('¿Qué es un enlace sigma (σ)?', 'Un enlace covalente donde los electrones se comparten directamente entre los átomos.', 1, 1),
('¿Cuál es la estructura del metano?', 'CH4', 1, 1),
('¿Qué es una amina?', 'Un compuesto orgánico derivado del amoníaco.', 1, 2),
('¿Qué es un aldehído?', 'Un compuesto orgánico que contiene un grupo carbonilo unido a un átomo de hidrógeno.', 1, 3),
('¿Cuál es la reacción de saponificación?', 'Hidrólisis de un éster en medio básico para formar una sal y un alcohol.', 1, 2),
('¿Qué es un alcohol secundario?', 'Un alcohol en el cual el carbono que lleva el grupo hidroxilo (OH) está unido a dos átomos de carbono.', 1, 2),
('¿Qué es el ácido acético?', 'Un ácido orgánico con fórmula CH3COOH.', 1, 1),
('¿Cuál es la fórmula molecular del butano?', 'C4H10', 1, 1),
('¿Qué es un éster?', 'Un compuesto orgánico derivado de un ácido y un alcohol.', 1, 2),
('¿Qué es un alqueno?', 'Hidrocarburo insaturado con un doble enlace carbono-carbono.', 1, 3),
('¿Cuál es la fórmula molecular del propanal?', 'C3H6O', 1, 3),
('¿Qué es una amida?', 'Un compuesto orgánico derivado de un ácido y una amina.', 1, 2);

-- Preguntas sobre Química Inorgánica
INSERT INTO Preguntas (Pregunta, Respuesta, ID_Categoria, dificultad) VALUES
('¿Cuál es el número atómico del oxígeno?', '8', 2, 1),
('¿Qué es un enlace iónico?', 'Un enlace químico formado por la transferencia de electrones entre átomos con diferente electronegatividad.', 2, 2),
('¿Cuál es el símbolo químico del sodio?', 'Na', 2, 1),
('¿Qué es un óxido ácido?', 'Un compuesto que reacciona con agua para formar un ácido.', 2, 3),
('¿Cuál es la fórmula química del ácido sulfúrico?', 'H2SO4', 2, 2),
('¿Qué es una sal?', 'Un compuesto iónico formado por la combinación de un catión y un anión.', 2, 1),
('¿Cuál es el número atómico del hierro?', '26', 2, 1),
('¿Qué es un hidruro?', 'Un compuesto químico que contiene hidrógeno y otro elemento.', 2, 2),
('¿Cuál es el símbolo químico del potasio?', 'K', 2, 1),
('¿Qué es un complejo de coordinación?', 'Un compuesto que contiene un ion central rodeado de ligandos.', 2, 3),
('¿Cuál es el símbolo químico del cloro?', 'Cl', 2, 1),
('¿Qué es un oxoanión?', 'Un ion poliatómico que contiene oxígeno.', 2, 2),
('¿Cuál es la fórmula química del dióxido de carbono?', 'CO2', 2, 1),
('¿Qué es una base?', 'Una sustancia que acepta protones o libera hidróxido en solución acuosa.', 2, 2),
('¿Cuál es la fórmula química del nitrato de potasio?', 'KNO3', 2, 1),
('¿Qué es un ion?', 'Un átomo o molécula cargada eléctricamente debido a una pérdida o ganancia de electrones.', 2, 1),
('¿Cuál es la fórmula química del hidróxido de sodio?', 'NaOH', 2, 2),
('¿Qué es una sal neutra?', 'Una sal que se forma a partir de un ácido y una base fuerte.', 2, 3),
('¿Cuál es la fórmula química del yoduro de potasio?', 'KI', 2, 1),
('¿Qué es un complejo octaédrico?', 'Un complejo de coordinación con forma octaédrica debido a la disposición de ligandos alrededor del ion central.', 2, 2);

-- Preguntas sobre Química Experimental
INSERT INTO Preguntas (Pregunta, Respuesta, ID_Categoria, dificultad) VALUES
('¿Qué es un mortero y mano?', 'Un utensilio utilizado en el laboratorio para triturar y pulverizar sustancias.', 3, 2),
('¿Qué es el papel pH?', 'Un papel impregnado con indicadores de pH que se utiliza para medir la acidez o alcalinidad de una solución.', 3, 1),
('¿Qué es una vidriera o placa de Petri?', 'Un recipiente de vidrio con tapa utilizado para el cultivo de microorganismos o realizar reacciones en pequeña escala.', 3, 3),
('¿Cuál es la función de una bureta en el laboratorio?', 'Medir con precisión el volumen de una solución titulante añadida a una muestra.', 3, 2),
('¿Qué es un desecador?', 'Un aparato que contiene un agente desecante para eliminar la humedad de sustancias.', 3, 3),
('¿Para qué se utiliza el papel filtro?', 'Para separar sólidos de líquidos en un proceso de filtración.', 3, 1),
('¿Qué es un crisol?', 'Un recipiente de porcelana resistente al calor utilizado para calentar sustancias a alta temperatura.', 3, 2),
('¿Cuál es la función de un embudo de separación?', 'Permite separar dos líquidos inmiscibles de diferentes densidades.', 3, 2),
('¿Qué es una pipeta serológica?', 'Una pipeta utilizada para medir y transferir volúmenes precisos de líquidos.', 3, 1),
('¿Qué es el matraz Erlenmeyer?', 'Un matraz de vidrio con forma cónica utilizado para contener líquidos o realizar reacciones químicas.', 3, 3),
('¿Cuál es el símbolo químico del oxígeno?', 'O', 3, 1),
('¿Qué es un desecante?', 'Un agente químico que se utiliza para eliminar o absorber la humedad de un ambiente cerrado.', 3, 2),
('¿Cuál es el símbolo químico del sodio?', 'Na', 3, 1),
('¿Qué es un matraz aforado?', 'Un matraz de vidrio que contiene una marca de aforo que indica un volumen fijo a una temperatura específica.', 3, 2),
('¿Cuál es el símbolo químico del potasio?', 'K', 3, 1),
('¿Qué es un mechero de Bunsen?', 'Un dispositivo utilizado en el laboratorio para producir una llama caliente y regulable.', 3, 3),
('¿Cuál es el símbolo químico del hidrógeno?', 'H', 3, 1),
('¿Qué es un agente oxidante?', 'Una sustancia que acepta electrones y provoca la oxidación de otras sustancias.', 3, 2),
('¿Cuál es el símbolo químico del carbono?', 'C', 3, 1),
('¿Qué es un embudo de decantación?', 'Un embudo utilizado para separar dos líquidos inmiscibles con diferentes densidades.', 3, 2);

-- Preguntas sobre Laboratorio de Pruebas
INSERT INTO Preguntas (Pregunta, Respuesta, ID_Categoria, dificultad) VALUES
('¿Qué es la cromatografía?', 'Un método de separación de mezclas basado en la distribución diferencial de los componentes en una fase móvil y una fase estacionaria.', 4, 3),
('¿Cuál es el procedimiento para calibrar una pipeta volumétrica?', 'Se lava la pipeta con la solución que se va a medir, y luego se llena y se vacía tres veces para garantizar una dosificación precisa.', 4, 2),
('¿Qué es un indicador de pH?', 'Un compuesto que cambia de color en función del pH de una solución.', 4, 1),
('¿Cuál es la función de un mechero de Bunsen?', 'Proporcionar una llama caliente para calentar sustancias en el laboratorio.', 4, 1),
('¿Qué es una disolución?', 'Una mezcla homogénea de dos o más sustancias, donde una es el solvente y las otras son solutos.', 4, 2),
('¿Qué es un análisis cualitativo?', 'Un análisis que determina la presencia o ausencia de ciertas sustancias en una muestra.', 4, 1),
('¿Cuál es la función de una placa calefactora?', 'Proporcionar calor constante y uniforme para calentar sustancias en el laboratorio.', 4, 2),
('¿Qué es la destilación simple?', 'Un método de separación de mezclas líquidas basado en las diferencias de puntos de ebullición.', 4, 3),
('¿Qué es un análisis cuantitativo?', 'Un análisis que determina la cantidad de una sustancia en una muestra.', 4, 2),
('¿Cuál es la función de un termómetro en el laboratorio?', 'Medir la temperatura de sustancias o mezclas.', 4, 1),
('¿Qué es una técnica de extracción?', 'Un método para separar una sustancia de una mezcla mediante su transferencia a un solvente adecuado.', 4, 3),
('¿Cuál es la función de una pipeta volumétrica?', 'Medir volúmenes precisos de líquidos.', 4, 2),
('¿Qué es un matraz aforado?', 'Un matraz de vidrio con una marca de aforo que indica un volumen fijo.', 4, 1),
('¿Cuál es la función de un agitador magnético?', 'Agitar y mezclar sustancias líquidas en el laboratorio.', 4, 2),
('¿Qué es un matraz de fondo redondo?', 'Un matraz de vidrio con fondo redondeado utilizado para calentar líquidos de manera uniforme.', 4, 1),
('¿Cuál es la función de un embudo de vidrio?', 'Facilitar la transferencia de líquidos de un recipiente a otro.', 4, 1),
('¿Qué es un mechero de alcohol?', 'Un dispositivo utilizado para calentar sustancias en el laboratorio.', 4, 2),
('¿Cuál es la función de un agente reductor?', 'Aceptar electrones y provocar la reducción de otras sustancias.', 4, 2),
('¿Qué es una pipeta graduada?', 'Una pipeta utilizada para medir y transferir volúmenes variables de líquidos.', 4, 1),
('¿Cuál es la función de un matraz de Erlenmeyer?', 'Contener y agitar líquidos en el laboratorio.', 4, 3);
