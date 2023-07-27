<?php
// Verificar si se ha recibido el parámetro ID del cuestionario
if (!isset($_GET['id'])) {
    // Si no se proporciona un ID válido, redirigir a la página principal
    header('Location: index.php');
    exit;
}

// Obtener el ID del cuestionario seleccionado
$id_cuestionario = $_GET['id'];

// Establecer conexión a la base de datos (cambiar las credenciales según tu configuración)
include "conexion.php";
// Obtener las preguntas y categorías del cuestionario desde la base de datos utilizando una sentencia preparada
$sql_preguntas = "SELECT P.ID_Pregunta, P.Pregunta, C.Nombre, P.Dificultad, P.Respuesta
                 FROM Cuestionario_Preguntas CP
                 JOIN Preguntas P ON CP.ID_Pregunta = P.ID_Pregunta
                 JOIN Categorias C ON P.ID_Categoria = C.ID_Categoria
                 WHERE CP.ID_Cuestionario = $id_cuestionario
                 ORDER BY P.Dificultad ASC"; // Ordenar por dificultad ascendente
$stmt_preguntas = $conexion->prepare($sql_preguntas);
$stmt_preguntas->execute();

$result_preguntas = $stmt_preguntas->get_result();
// Organizar las preguntas por categoría y dificultad en un arreglo multidimensional
$categorias_preguntas = array();
while ($row = $result_preguntas->fetch_assoc()) {
    $categoria = $row['Nombre'];
    $categorias_preguntas[$categoria][] = $row;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Cuestionario <?php echo $id_cuestionario; ?></title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
        }

        /* Estilos para los botones */
        .btn-modal {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 24px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10px;
        }

        /* Estilos para el modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 10px;
        }

        .hide {
            display: none;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
        }

        /* Efecto hover para los botones */
        .btn-modal:hover {
            background-color: #45a049;
        }

        /* Efecto sombra para el modal */
        .modal-content:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <h1>Juego <?php echo $id_cuestionario; ?></h1>
    <table>
        <thead>
            <tr>
                <?php foreach ($categorias_preguntas as $categoria => $preguntas) : ?>
                    <th><?php echo $categoria; ?></th>
                <?php endforeach; ?>
            </tr>
        </thead>
        <tbody>
            <?php
            // Obtener el número máximo de preguntas en una categoría
            $max_preguntas = max(array_map('count', $categorias_preguntas));

            // Imprimir las filas con las preguntas
            for ($i = 0; $i < $max_preguntas; $i++) :
                echo "<tr>";
                foreach ($categorias_preguntas as $categoria => $preguntas) :
                    if (isset($preguntas[$i])) {
                        $pregunta = $preguntas[$i];
                        $dificultad = $pregunta['Dificultad'] * 100;
                        $respuesta = $pregunta['Respuesta']; // Agregamos la respuesta aquí
                        echo "<td><button class='btn-modal' data-pregunta='" . htmlentities($pregunta['Pregunta'], ENT_QUOTES) . "' data-respuesta='" . htmlentities($respuesta, ENT_QUOTES) . "'>$dificultad</button></td>";
                    } else {
                        echo "<td></td>";
                    }
                endforeach;
                echo "</tr>";
            endfor;
            ?>
        </tbody>
    </table>

    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="pregunta-modal"></p>
            <button id="btn-respuesta" class="btn-modal hide">Ver Respuesta</button>
            <p id="respuesta-modal" class="hide"></p>
        </div>
    </div>

    <script>
        // Abrir modal y mostrar la pregunta al hacer clic en el botón
        const buttons = document.querySelectorAll('.btn-modal');
        const modal = document.getElementById('modal');
        const preguntaModal = document.getElementById('pregunta-modal');
        const respuestaModal = document.getElementById('respuesta-modal');
        const btnRespuesta = document.getElementById('btn-respuesta');

        buttons.forEach(button => {
            button.addEventListener('click', function() {
                const pregunta = this.dataset.pregunta;
                const respuesta = this.dataset.respuesta;
                preguntaModal.textContent = pregunta;
                respuestaModal.textContent = ''; // Limpiamos la respuesta cuando se muestra la pregunta
                respuestaModal.classList.add('hide');
                btnRespuesta.classList.remove('hide');
                btnRespuesta.dataset.respuesta = respuesta;
                modal.style.display = 'block';
            });
        });

        // Mostrar la respuesta al hacer clic en el botón "Ver Respuesta"
        btnRespuesta.addEventListener('click', function() {
            const respuesta = this.dataset.respuesta;
            respuestaModal.textContent = "Respuesta: " + respuesta;
            respuestaModal.classList.remove('hide');
            btnRespuesta.classList.add('hide');
        });

        // Cerrar modal al hacer clic en la "X"
        const closeBtn = document.querySelector('.close');
        closeBtn.addEventListener('click', function() {
            modal.style.display = 'none';
        });

        // Cerrar modal al hacer clic fuera del contenido
        window.addEventListener('click', function(event) {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    </script>
</body>
</html>
