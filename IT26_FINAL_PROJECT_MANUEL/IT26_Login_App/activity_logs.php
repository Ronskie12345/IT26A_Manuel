<?php
require 'config.php';

$sql = "SELECT l.log_id, u.username, l.activity, l.log_time
        FROM activity_logs l
        INNER JOIN users u ON l.user_id = u.user_id
        ORDER BY l.log_time DESC";
$result = $conn->query($sql);
?>

<h3>Activity Logs</h3>
<table border="1">
    <tr><th>User</th><th>Activity</th><th>Timestamp</th></tr>
    <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?= htmlspecialchars($row['username']) ?></td>
            <td><?= htmlspecialchars($row['activity']) ?></td>
            <td><?= $row['log_time'] ?></td>
        </tr>
    <?php endwhile; ?>
</table>
