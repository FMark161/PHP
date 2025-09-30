<?php
include('connect.php');

if (isset($_GET['torol'])) {
    $id = (int) $_GET['torol']; // egész számmá konvertálás
    $conn->query("DELETE FROM tanarok WHERE id = $id");
}

$sql = "SELECT * FROM z_iskola ORDER BY id";

$result = $conn->query($sql);

function h($v)
{
    return htmlspecialchars((string) $v, ENT_QUOTES, 'UTF-8');
}
?>
<h1>Tanárok listája</h1>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th,
    td {
        border: 1px solid #ccc;
        padding: 6px;
    }

    th {
        background: #eee;
    }

    a.torol {
        color: red;
        text-decoration: none;
    }
</style>
<table border=1>
    <thead>
        <tr>
            <th>#</th>
            <th>Név</th>
            <th>Irányítószám</th>
            <th>Település</th>
            <th>Cím</th>
            <th>Telefonszám</th>
            <th>Email</th>
            <th>Webhely</th>
            <th>Megjegyzés</th>
            <th>Hangszerek</th>
            <th>Művelet</th>

        </tr>
    </thead>
    <tbody>
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo isset($row['id']) ? h($row['id']) : ''; ?></td>
                    <td><?php echo h($row['nev']); ?></td>
                    <td>
                        <?php if (!empty($row['irszam'])): ?>
                            <?php echo h($row['irszam']); ?>
                        <td><?php echo h($row['telepules']); ?></td>
                        <td><?php echo h($row['cim']); ?></td>
                        <td><?php echo h($row['telefon']); ?></td>
                        <td><?php echo h($row['email']); ?></td>
                        <td><?php echo h($row['webhely']); ?></td>
                        <td><?php echo h($row['megjegyzes']); ?></td>
                        <td><?php echo h($row['hangszerek']); ?></td>
                        </a>
                    <?php endif; ?>

                    <td><a class="torol" href="?torol=<?= $row['id'] ?>" onclick="return confirm('Biztosan törlöd?')">Törlés</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4">
                    <div class="empty">Még nincs egyetlen bejegyzés sem.</div>
                </td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>