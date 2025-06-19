<?php
require '../config.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = hash('sha256', $_POST['password']);
    $role_id = $_POST['role_id'];
    $stmt = $conn->prepare("INSERT INTO users (username, password, role_id) VALUES (?, ?, ?)");
    $stmt->bind_param("ssi", $username, $password, $role_id);
    $stmt->execute();
    header("Location: ../dashboard.php");
}
$roles = $conn->query("SELECT * FROM roles");
?>
<form method="POST">
    <input name="username" required>
    <input name="password" type="password" required>
    <select name="role_id">
        <?php while ($r = $roles->fetch_assoc()) echo "<option value='{$r['role_id']}'>{$r['role_name']}</option>"; ?>
    </select>
    <button type="submit">Create</button>
</form>
