<?php
require '../config.php';

$id = $_GET['id'];
$conn->query("DELETE FROM users WHERE user_id = $id");
header("Location: ../dashboard.php");
