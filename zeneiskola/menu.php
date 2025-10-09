<?php

$sql = "SELECT * FROM menu ORDER BY id";

$result = $conn->query($sql);

function h($v)
{
    return htmlspecialchars((string) $v, ENT_QUOTES, 'UTF-8');
}
?>
    <tbody>
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                
                    <td>
                        <a href="index.php?p=<?php echo urlencode($row['link']); ?>">
                        <?php echo htmlspecialchars($row['nev']); ?>
                        </a>
                    </td>
            
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4">
                    <div class="empty">Még nincs egyetlen bejegyzés sem.</div>
                </td>
            </tr>
        <?php endif; ?>
    </tbody>
