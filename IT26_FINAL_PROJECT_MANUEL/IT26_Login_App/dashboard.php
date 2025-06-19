<?php
session_start();
require 'config.php';
if (!isset($_SESSION['user'])) header('Location: login.php');

$user = $_SESSION['user'];

$sql = "SELECT u.user_id, u.username, r.role_name
        FROM users u
        LEFT JOIN roles r ON u.role_id = r.role_id";
$result = $conn->query($sql);
?>

<a href="logout.php">Logout</a>
<h2>Welcome, <?= htmlspecialchars($user['username']) ?></h2>
<table border="1">
    <tr><th>ID</th><th>Username</th><th>Role</th><th>Actions</th></tr>
    <?php while ($row = $result->fetch_assoc()): ?>
    <tr>
        <td><?= $row['user_id'] ?></td>
        <td><?= $row['username'] ?></td>
        <td><?= $row['role_name'] ?></td>
        <td>
            <a href="users/edit.php?id=<?= $row['user_id'] ?>">Edit</a>
            <a href="users/delete.php?id=<?= $row['user_id'] ?>" onclick="return confirm('Delete this user?')">Delete</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>
<a href="users/create.php">Add User</a>
