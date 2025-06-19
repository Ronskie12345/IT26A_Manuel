<?php
require '../config.php';

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM users WHERE user_id = $id");
$user = $result->fetch_assoc();
$roles = $conn->query("SELECT * FROM roles");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $role_id = $_POST['role_id'];
    $update = $conn->prepare("UPDATE users SET username=?, role_id=? WHERE user_id=?");
    $update->bind_param("sii", $username, $role_id, $id);
    $update->execute();
    header("Location: ../dashboard.php");
}
?>

<form method="POST">
    <input name="username" value="<?= htmlspecialchars($user['username']) ?>" required>
    <select name="role_id">
        <?php while ($r = $roles->fetch_assoc()): ?>
            <option value="<?= $r['role_id'] ?>" <?= $r['role_id'] == $user['role_id'] ? 'selected' : '' ?>>
                <?= $r['role_name'] ?>
            </option>
        <?php endwhile; ?>
    </select>
    <button type="submit">Update</button>
</form>
<a href="../dashboard.php">Cancel</a>
