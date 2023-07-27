<?php
// Configuración de la conexión a la base de datos
$host = 'db';
$usuario = 'root';
$contrasena = 'test';
$base_datos = 'dbname';

// Establecer conexión a la base de datos
$conexion = new mysqli($host, $usuario, $contrasena, $base_datos);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

