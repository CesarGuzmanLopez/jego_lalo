<!DOCTYPE html>
<html>
<head>
    <title>Pregunta a pablo</title>
    </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Generador de Juegos</h1>

        <form method="post" action="generacuestionaro.php">
            <input type="submit" name="generar" value="Generar Juego">
        </form>

        <h2>Juegos:</h2>
        <ul>
            <?php
            include "conexion.php";

            // Obtener los cuestionarios generados previamente desde la base de datos
            $sql_cuestionarios = "SELECT ID_Cuestionario FROM Cuestionarios";
            $result_cuestionarios = $conexion->query($sql_cuestionarios);
            if ($result_cuestionarios->num_rows > 0) {
                while ($row = $result_cuestionarios->fetch_assoc()) {
                    $id_cuestionario = $row['ID_Cuestionario'];
                    echo "<li><a href='cuestionario.php?id=$id_cuestionario'>Juego $id_cuestionario</a></li>";
                }
            } else {
                echo "<li>No hay cuestionarios generados aún.</li>";
            }
            ?>
        </ul>
    </div>
</body>
</html>
