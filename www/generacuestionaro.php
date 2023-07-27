<?php
include 'conexion.php';
// Función para obtener preguntas aleatorias de una categoría y dificultad específica
function obtenerPreguntasAleatorias($conexion, $categoria, $dificultad, $cantidad = 2) {
    $sql = "SELECT ID_Pregunta FROM Preguntas WHERE ID_Categoria = ? AND dificultad = ? ORDER BY RAND() LIMIT ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("iii", $categoria, $dificultad, $cantidad);
    $stmt->execute();
    $result = $stmt->get_result();
    $preguntas = array();
    while ($row = $result->fetch_assoc()) {
        $preguntas[] = $row['ID_Pregunta'];
    }
    return $preguntas;
}

// Función para crear un cuestionario con preguntas aleatorias
function crearCuestionario($conexion) {
    $num_preguntas_categoria = 2;
    $categorias = array(1, 2, 3, 4); // ID de las categorías en la tabla "Categorias"
    $dificultades = array(1, 2, 3); // Niveles de dificultad (1, 2, 3)

    // Insertar el cuestionario en la tabla "Cuestionarios"
    $sql_cuestionario = "INSERT INTO Cuestionarios (Numero_Preguntas) VALUES (?)";
    $stmt_cuestionario = $conexion->prepare($sql_cuestionario);
    $stmt_cuestionario->bind_param("i", $num_preguntas_categoria);
    $stmt_cuestionario->execute();
    $id_cuestionario = $stmt_cuestionario->insert_id;

    // Obtener preguntas aleatorias para cada categoría y dificultad
    foreach ($categorias as $categoria) {
        foreach ($dificultades as $dificultad) {
            $preguntas_aleatorias = obtenerPreguntasAleatorias($conexion, $categoria, $dificultad, $num_preguntas_categoria);
            foreach ($preguntas_aleatorias as $pregunta_id) {
                // Insertar preguntas en la tabla "Cuestionario_Preguntas"
                $sql_cuestionario_preguntas = "INSERT INTO Cuestionario_Preguntas (ID_Cuestionario, ID_Pregunta) VALUES (?, ?)";
                $stmt_cuestionario_preguntas = $conexion->prepare($sql_cuestionario_preguntas);
                $stmt_cuestionario_preguntas->bind_param("ii", $id_cuestionario, $pregunta_id);
                $stmt_cuestionario_preguntas->execute();
            }
        }
    }
}

// Crear el cuestionario
crearCuestionario($conexion);

// Cerrar la conexión
$conexion->close();
//regresar a la pagina anterior
header("Location: index.php");